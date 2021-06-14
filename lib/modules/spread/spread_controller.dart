import 'package:coupon/utils/logger_util.dart';
import 'package:coupon/utils/loginLocal.dart';
import 'package:coupon/utils/request_util.dart';
import 'package:get/get.dart';

class SpreadController extends GetxController {
  var list = [].obs;
  var isEmpty = false.obs;
  @override
  void onInit() {
    request();
    super.onInit();
  }

  void request() async {
    if (isEmpty.value) {
      return;
    }
    var res = await DioUtil().get(Path.spread);
    LoggerUtil.e(res);
    if (res == null || res['status'] != 0) {
      return;
    }

    list.value = res['list'];
  }
}
