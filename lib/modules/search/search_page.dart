import 'package:coupon/components/ErrorShow.dart';
import 'package:coupon/components/MyWidget.dart';
import 'package:coupon/components/refresher.dart';
import 'package:coupon/main.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:coupon/utils/util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  var focusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<SearchController>(() => SearchController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.bg,
      body: SafeArea(
          // width: double.infinity,
          // decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyWidget.getBack(),
                Expanded(
                  child: Container(
                    height: 35.h,
                    child: TextField(
                      maxLines: 1,
                      focusNode: focusnode,
                      controller: controller.searchcontroller.value,
                      onChanged: (value) {
                        controller.searchstr = value;
                      },
                      style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: AppTheme.body3Size,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,

                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.searchcontroller.value.clear();
                              controller.searchstr = "";
                              controller.showtag.value = true;
                            },
                            alignment: Alignment.center,
                            icon: Icon(Icons.clear),
                            iconSize: 14.w),
                        hintText: "输入商品名称搜索",
                        hintStyle: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: AppTheme.body3Size,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 0, bottom: 0, right: 0),
                        hoverColor: Colors.transparent,
                        fillColor: Colors.white,
                        filled: true,
                        // isCollapsed: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                      ),

                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      onEditingComplete: () {
                        if (controller.searchstr == "") {
                          return;
                        }
                        controller.list.clear();
                        controller.page = 0;

                        controller.isEmpty.value = false;
                        hideKeyboard(context);
                        controller.showtag.value = false;

                        controller.request();
                      },
                      // keyboardType: TextInputType.,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      controller.list.clear();
                      controller.page = 0;
                      controller.isEmpty.value = false;
                      hideKeyboard(context);
                      controller.showtag.value = false;
                      controller.request();
                    },
                    child: Text("搜索"))
              ],
            ),
          ),
          Expanded(
              child: Obx(
            () => controller.showtag.value
                ? Container(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "历史搜索",
                              style: AppTheme.title2,
                            ),
                            Spacer(),
                            IconButton(
                              iconSize: 21.w,
                              onPressed: () {
                                controller.clearSearchlist();
                              },
                              icon: Icon(
                                Icons.delete_sweep_outlined,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            // runSpacing: 8,
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,

                            children: buildTags(),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: (controller.list.length == 0)
                        ? Errorshow(
                            isEmpty: controller.isEmpty.value,
                            color: AppTheme.bg,
                          )
                        : Refresher(
                            (BuildContext context, int index) {
                              var item = controller.list[index];

                              return buildItem(context, item);
                            },
                            controller.list.length,
                            onRefresh: (control) async {
                              controller.list.clear();
                              controller.page = 0;
                              controller.isEmpty.value = false;
                              controller.request();
                              control.refreshCompleted(); //下拉结束
                            },
                            onLoading: (control) {
                              controller.request();
                              if (controller.isEmpty.value) {
                                control.loadNoData();
                              } else {
                                control.loadComplete();
                              }
                            },
                          )),
          ))
        ],
      )),
    );
  }

  List<Widget> buildTags() {
    List<Widget> widgets = [];
    if (controller.setlist.length != 0) {
      for (String item in controller.setlist) {
        widgets.add(GestureDetector(
          onTap: () {
            controller.searchstr = item;
            controller.searchcontroller.value.text = item;
            controller.page = 0;
            controller.isEmpty.value = false;
            hideKeyboard(Get.context);
            controller.showtag.value = false;
            controller.request();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 2, right: 6, top: 8, bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppTheme.grey.withOpacity(.2)),
            child: Text(
              item,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.body3.copyWith(color: AppTheme.grey),
            ),
          ),
        ));
      }
    } else {
      widgets.add(SizedBox());
    }

    return widgets;
  }

  Widget buildItem(BuildContext context, var item) {
    //
    num zk_final_price = num.parse(item['zk_final_price']);
    int amount;
    var coupon_amount = item['coupon_amount'];
    if (coupon_amount == null) {
      amount = 0;
    } else {
      amount = (num.parse(coupon_amount) * 100).floor();
    }
    int price = (zk_final_price * 100).floor();
    // LoggerUtil.e((price - amount) / 100);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 140.h,
      constraints: BoxConstraints(
          // minHeight: 140.h,
          ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: GestureDetector(
        onTap: () async {
          Util.openUrl(item['url']);
        },
        child: Row(
          children: [
            ExtendedImage.network(
              item['pict_url'],
              fit: BoxFit.contain,
              loadStateChanged: Util.ExtendedImageLoad,
              cache: true,
              // width: 140.h,
              constraints: BoxConstraints(minWidth: 140.h),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    constraints:
                        BoxConstraints(minHeight: AppTheme.title1Size * 2),
                    child: Text(
                      item['title'],
                      style: AppTheme.titleQ.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      // 彩妆/香水/美妆工具
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                        decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(Util.getUserType(item['user_type']),
                            style: AppTheme.body1.copyWith(color: Colors.pink)),
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.none,
                          margin: EdgeInsets.only(left: 5),
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(item['level_one_category_name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTheme.body1.copyWith(color: Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('劵后：' + ((price - amount) / 100).toString(),
                          style:
                              AppTheme.body3.copyWith(color: Colors.red[500])),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromHeight(10.h)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[700]),
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                          onPressed: () {
                            Util.openUrl(item['url']);
                          },
                          child: Text(
                              Util.isEmpty(coupon_amount)
                                  ? '打开商品'
                                  : '领${item['coupon_amount']}元劵',
                              style:
                                  AppTheme.body3.copyWith(color: Colors.white)))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
