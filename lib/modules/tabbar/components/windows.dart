import 'dart:ui';

import 'package:coupon/modules/tabbar/tabBar_controller.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:coupon/utils/logger_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarWindowsPage extends GetView<TabBarController> {
  var width = (60.w >= 85.0) ? 85.0 : 60.w;
  var size = 26.sp;

  @override
  Widget build(BuildContext context) {
    LoggerUtil.d(AppTheme.bodySize);

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Container(
            color: AppTheme.white,
            width: width,
            child: Column(
              children: [
                buildTabItem(0),
                buildTabItem(1),
                buildTabItem(2),
                buildTabItem(3),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => TabBarView(
                  physics: NeverScrollableScrollPhysics(), //禁止滑动
                  controller: controller.tabController.value,
                  children: controller.listView,
                )),
          ),
        ],
      ),
    ));
  }

  GestureDetector buildTabItem(var index) {
    var data = controller.list[index];
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.tabController.value.animateTo(index,
            duration: Duration(milliseconds: 100), curve: Curves.ease);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Image.asset(
              'assets/newtab/' +
                  (controller.currentIndex.value == index
                      ? data['on']
                      : data['off']),
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
