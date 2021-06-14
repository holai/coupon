import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/list/list_page.dart';

class HomeController extends GetxController {
  List<Map> tabTitles = [
    {
      "name": "热榜",
      "page": ListPage(
        id: "28026",
      )
    },
    {
      "name": "大额劵",
      "page": ListPage(
        id: "27446",
      )
    },
    {
      "name": "食品",
      "page": ListPage(
        id: "3761",
      )
    },
    {
      "name": "美妆个护",
      "page": ListPage(
        id: "3763",
      )
    },
    {
      "name": "鞋包配饰",
      "page": ListPage(
        id: "3762",
      )
    },
    {
      "name": "女装",
      "page": ListPage(
        id: "3767",
      )
    },
    {
      "name": "数码家电",
      "page": ListPage(
        id: "3759",
      )
    },
    {
      "name": "母婴",
      "page": ListPage(
        id: "3760",
      )
    },
    {
      "name": "男装",
      "page": ListPage(
        id: "3764",
      )
    },
  ];

  var tabController;

  SharedPreferences sp;
  @override
  void onInit() {
    super.onInit();

    tabController =
        TabController(length: tabTitles.length, vsync: NavigatorState());
    sp = Get.find<SharedPreferences>();
  }
}
