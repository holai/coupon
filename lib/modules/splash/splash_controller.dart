import 'package:coupon/routes/app_pages.dart';
import 'package:coupon/utils/logger_util.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var title = "随手券";
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(seconds: 1));

    Get.offNamed(Routes.HOME);
  }
}
