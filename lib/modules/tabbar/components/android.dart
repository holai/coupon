import 'dart:ui';

import 'package:coupon/modules/tabbar/tabBar_controller.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarAndroidPage extends GetView<TabBarController> {
  TabBarAndroidPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return WillPopScope(
      onWillPop: () async {
        // AndroidBackDesktop.backToDesktop(); //设置为返回不退出ap
        return true;
      },
      child: Scaffold(
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: (index) async {
                    if (index == controller.currentIndex.value) {
                      return;
                    }
                    controller.tabController.value.animateTo(index,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease);
                  },
                  elevation: 0,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: AppTheme.ys,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: AppTheme.body,
                  selectedLabelStyle:
                      AppTheme.body.copyWith(fontWeight: FontWeight.bold),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    ...controller.list.map((e) {
                      return BottomNavigationBarItem(
                          label: e['lable'],
                          tooltip: "",
                          activeIcon: Image.asset(
                            e['on'],
                            // shape: BoxShape.circle,
                            width: controller.size,
                            height: controller.size,
                          ).paddingOnly(top: 3.h, bottom: 2.h),
                          icon: Image.asset(
                            e['off'],

                            // shape: BoxShape.circle,
                            width: controller.size,
                            height: controller.size,
                          ).paddingOnly(top: 3.h));
                    }).toList()
                  ])),
          body: Obx(() => TabBarView(
                physics: NeverScrollableScrollPhysics(), //禁止滑动
                controller: controller.tabController.value,
                children: controller.listView,
              ))),
    );
  }

  Image buildImage(index) {
    var data = controller.list[index];

    return Image.asset(
      'assets/newtab/' +
          (controller.currentIndex.value == index ? data['on'] : data['off']),
      width: controller.size,
      height: controller.size,
      fit: BoxFit.fill,
    );
  }
}
