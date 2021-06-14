import 'package:coupon/utils/logger_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/android.dart';
import 'components/windows.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarDividerColor: Colors.transparent,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));
    Widget widget;

// context.responsiveValue<bool>(
//         desktop: true, mobile: false, tablet: false, watch: false)
    if (context.isSmallTablet) {
      LoggerUtil.d("宽度大于1200");
      widget = TabBarWindowsPage();
    } else {
      widget = TabBarAndroidPage();
    }

    return Scaffold(body: widget);
  }
}
