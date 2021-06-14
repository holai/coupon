import 'package:coupon/routes/app_pages.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:coupon/utils/dependency_injection.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();

  final botToastBuilder = BotToastInit(); //1.调用BotToastInit

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('zh', 'CN'),
      const Locale('en', 'US'),
    ],
    initialRoute: '/',
    builder: (context, child) {
      return GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: botToastBuilder(context, child),
      );
    },
    navigatorObservers: [BotToastNavigatorObserver()],
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    initialBinding: SplashBinding(),
    home:
        ScreenUtilInit(designSize: Size(360, 800), builder: () => SplashPage()),
  ));
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
