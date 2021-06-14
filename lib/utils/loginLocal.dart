import 'dart:convert';

import 'package:coupon/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocal {
  static final String keyLoginModel = 'login_model';

  static saveLoginModel(String bean) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(keyLoginModel, bean);
  }

  static clearLoginModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.remove(keyLoginModel);
  }

  static dynamic getLoginModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(keyLoginModel);
      var v = jsonDecode(json);
      return v;
    } catch (e) {
      LoggerUtil.d(e);
      return null;
    }
  }
}
