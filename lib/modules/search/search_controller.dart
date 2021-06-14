import 'dart:convert';

import 'package:coupon/utils/logger_util.dart';
import 'package:coupon/utils/request_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  int page = 0;
  var list = [].obs;
  var isEmpty = false.obs;
  var searchstr = "";
  var showtag = true.obs;
  RxSet<dynamic> setlist = new Set().obs;
  var searchcontroller = TextEditingController().obs;
  SharedPreferences sharedPreferences;
  @override
  void onInit() async {
    //获取搜索记录
    sharedPreferences = Get.find<SharedPreferences>();
    if (sharedPreferences.containsKey("searchlist")) {
      var list = sharedPreferences.get("searchlist");
      setlist.addAll(json.decode(list));
    }
    super.onInit();
  }

  //搜索
  void request() async {
    if (isEmpty.value) {
      return;
    }
    setlist.add(searchstr);
    var res = await DioUtil()
        .post(Path.search, queryParameters: {"page": ++page, "q": searchstr});
    LoggerUtil.d(res);

    if (res == null) {
      return;
    }
    if (res['is_default'] == true) {
      isEmpty.value = true;
    }

    list.addAll(res['result_list']['map_data']);
  }

  //清楚 搜索记录
  void clearSearchlist() {
    setlist.clear();
    sharedPreferences.remove("searchlist");
    setlist.update((value) {});
  }

  @override
  void onClose() {
    if (setlist.length > 0) {
      // 保存搜索记录
      sharedPreferences.setString("searchlist", json.encode(setlist.toList()));
    }
    super.onClose();
  }
}
