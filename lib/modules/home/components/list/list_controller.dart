import 'package:coupon/utils/logger_util.dart';
import 'package:coupon/utils/request_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends GetxController {
  var id = "";
  SharedPreferences sp;
  int page = 0;
  var list = [].obs;
  var isEmpty = false.obs;

  ListController({this.id = ""});
  @override
  void onInit() {
    super.onInit();
    request(id);
    sp = Get.find<SharedPreferences>();
  }

  void request(var id) async {
    if (isEmpty.value) {
      return;
    }
    LoggerUtil.d(page);
    var res = await DioUtil().post(Path.getList, queryParameters: {
      "page": ++page,
      "id": id,
    });
    // LoggerUtil.e(res);
    if (res == null) {
      return;
    }
    if (res['is_default'] == true) {
      isEmpty.value = true;
    }

    list.addAll(res['result_list']['map_data']);
  }
}
