import 'package:coupon/modules/home/home_page.dart';
import 'package:coupon/modules/spread/spread_page.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class TabBarController extends GetxController with WidgetsBindingObserver {
  var tabController =
      TabController(initialIndex: 0, vsync: NavigatorState(), length: 2).obs;

  var color = AppTheme.bg;
  var currentIndex = 0.obs;
  var size = 25.sp;

  // List<Map> list = [
  //   {"on": "icon_lt.png", "off": "icon_lt_no.png"},
  //   {"on": "icon_pyq.png", "off": "icon_pyq_no.png"},
  //   {"on": "icon_fx.png", "off": "icon_fx_no.png"},
  //   {"on": "icon_wd.png", "off": "icon_wd_no.png"},
  // ];

  var list = [
    {"lable": "主页", "on": "assets/tab/a.png", "off": "assets/tab/a_off.png"},
    {"lable": "红包", "on": "assets/tab/b.png", "off": "assets/tab/b_off.png"},
  ];

  var listView = [
    HomePage(),
    SpreadPage(),
    // KeepAliveWrapper(
    //   child: FindIndexPage(),
    // ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    tabController.value
      ..addListener(() async {
        setIndex(tabController.value.index);
      });
  }

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
