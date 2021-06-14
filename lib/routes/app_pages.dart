/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 14:37:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/routes/app_pages.dart
 */

import 'package:coupon/modules/search/search_binding.dart';
import 'package:coupon/modules/search/search_page.dart';
import 'package:coupon/modules/tabbar/TabBar_page.dart';
import 'package:coupon/modules/tabbar/tabBar_binding.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => TabBarPage(),
        binding: TabBarBinding(),
        children: [
          GetPage(
            name: Routes.SEARCH,
            page: () => SearchPage(),
            binding: SearchBinding(),
          ),
        ]),
  ];
}
