import 'package:coupon/modules/tabbar/tabBar_controller.dart';
import 'package:get/get.dart';

class TabBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(() => TabBarController());
  }
}
