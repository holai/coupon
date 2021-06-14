import 'package:coupon/components/ErrorShow.dart';
import 'package:coupon/components/MyWidget.dart';
import 'package:coupon/components/WebViewPage.dart';
import 'package:coupon/components/refresher.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:coupon/utils/logger_util.dart';
import 'package:coupon/utils/request_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:coupon/utils/util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'list_controller.dart';

class ListPage extends StatelessWidget {
  var id = "";
  ListPage({this.id = ""}) {
    Get.lazyPut(() => ListController(id: id), tag: id);
    // Get.lazyPut(() => ListController());
  }
  var controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.find<ListController>(tag: id);
    // Get.put<ListController>(ListController(), tag: id);

    // <ListController>
    // controller.request(id);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.bg,
        body: SafeArea(
          child: Container(
              child: Obx(() => (controller.list.length == 0)
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
                        controller.request(id);
                        control.refreshCompleted(); //下拉结束
                      },
                      onLoading: (control) {
                        controller.request(id);
                        if (controller.isEmpty.value) {
                          control.loadNoData();
                        } else {
                          control.loadComplete();
                        }
                      },
                    ))),
        ));
  }

  static Widget buildItem(BuildContext context, var item) {
    //
    num zk_final_price = num.parse(item['zk_final_price']);
    num coupon_amount = item['coupon_amount'];
    int price = (zk_final_price * 100).floor();
    int amount = (coupon_amount * 100).floor();
    // LoggerUtil.e((price - amount) / 100);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 140.h,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: GestureDetector(
        onTap: () async {
          Util.openUrl(item['coupon_share_url']);
        },
        child: Row(
          children: [
            ExtendedImage.network(
              'http:' + item['pict_url'],
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
                      style: AppTheme.title1Q.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Wrap(
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
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(item['level_one_category_name'],
                            style: AppTheme.body1.copyWith(color: Colors.grey)),
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
                            Util.openUrl(item['coupon_share_url']);
                          },
                          child: Text('领${item['coupon_amount']}元劵',
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
