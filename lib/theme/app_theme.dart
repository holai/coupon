import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xff2196f3);
const kPrimaryLightColor = Color(0xffbbdefb);
const primaryDarkColor = Color(0xff1976d2);
// const secondaryColor = Color(0xFFe1a6ff);
// const secondaryLightColor = Color(0xFFe1a6ff);
// const secondaryDarkColor = Color(0xFFe1a6ff);
// const primaryTextColor = Color(0xFFF1E6FF);
// const secondaryTextColor = Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    scaffoldBackgroundColor: Colors.white,
    accentColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    textTheme: GoogleFonts.architectsDaughterTextTheme());

AppBarTheme get appBarTheme => AppBarTheme();

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const String fontName = "";
  static const double bottomHeight = 50;

  // static const TextStyle topBar = TextStyle(
  //     color: Color.fromRGBO(89, 61, 58, 1),
  //     fontSize: ScreenUtil().setSp(55),
  //     fontWeight: FontWeight.w600,
  //     letterSpacing: 3);

  //字体大小表

  static double bodySize = 10.sp > 16 ? 16 : 10.sp;
  static double body1Size = bodySize + 1.sp;
  static double body2Size = body1Size + 1.sp;
  static double body3Size = body2Size + 1.sp;
  static double body4Size = body3Size + 1.sp;
  static double body5Size = body4Size + 1.sp;
  static double body6Size = body5Size + 1.sp;

  static double titleSize = 14.sp;
  static double title1Size = titleSize + 1.sp;
  static double title2Size = title1Size + 1.sp;
  static double title3Size = title2Size + 1.sp;
  static double title4Size = title3Size + 2.sp;
  static double numberSize = titleSize * 2;

  // static const Color bg = Color.fromRGBO(248, 248, 248, 1);
  static const Color bg = Color.fromRGBO(237, 237, 237, 1);
  // static const Color bg = Color(0xFFF6F7FB);
  //

  // static Color wz = (Color.fromRGBO(237, 243, 255, 1).withOpacity(0.7));
  static Color wz = Color.fromRGBO(247, 247, 247, 1);

// 100,149,237
  static const Color zd = Color.fromRGBO(252, 157, 153, 1);
  static const Color ys = Color(0xff2196f3);

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static TextStyle strong = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 40.sp,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: titleSize,
    letterSpacing: 0.8,
    color: darkerText,
  );

  static TextStyle titleLight = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: titleSize,
    letterSpacing: 0.18,
    color: white, // was lightText
  );
  static TextStyle titleQ = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: titleSize,
    letterSpacing: 0.6,
    color: darkerText,
  );

  static TextStyle title1 = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title1Size,
    letterSpacing: 1,
    height: 1.5,
    color: darkerText,
  );
  static TextStyle title1Q = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: title1Size,
    letterSpacing: 1,
    color: darkerText,
  );

  static TextStyle title1Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title1Size,
    letterSpacing: 0.5,
    color: white, // was lightText
  );

  static TextStyle title2 = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: title2Size,
    letterSpacing: 0.8,
    color: darkerText,
  );
  static TextStyle title2Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: title2Size,
    letterSpacing: 0.7,
    color: white, // was lightText
  );

  static TextStyle title2Q = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: title2Size,
    letterSpacing: 0.7,
    color: darkerText,
  );

  static TextStyle title3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title3Size,
    letterSpacing: 0.8,
    color: darkerText, // was lightText
  );
  static TextStyle title3Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title3Size,
    letterSpacing: 0.8,
    color: white, // was lightText
  );

  static TextStyle title3Q = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title3Size,
    letterSpacing: 0.5,
    color: darkerText,
  );

  static TextStyle title4 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title4Size,
    letterSpacing: 0.5,
    color: darkerText, // was lightText
  );
  static TextStyle title4Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title4Size,
    letterSpacing: 0.5,
    color: Colors.white60, // was lightText
  );

  static TextStyle title4Q = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: title4Size,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static TextStyle number = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: numberSize,
    letterSpacing: 0.5,
    color: darkerText, // was lightText
  );

  static TextStyle subbody = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w300,
    fontSize: 30.sp,
    letterSpacing: 0.04,
    color: grey,
  );

  static TextStyle subbodyLight = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w300,
    fontSize: 30.sp,
    letterSpacing: -0.04,
    color: white,
  );

  static TextStyle bodyLight = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: bodySize,
    letterSpacing: 0.2,
    color: white,
  );

  static TextStyle body = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: bodySize,
    letterSpacing: 0.2,
    color: darkText,
  );

  static TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body1Size,
    letterSpacing: 1,
    color: darkText,
  );

  static TextStyle body1Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body1Size,
    letterSpacing: 1,
    color: white, // was lightText
  );

  static TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body2Size,
    letterSpacing: 1,
    color: darkText,
  );

  static TextStyle body2Light = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body2Size,
    letterSpacing: 1,
    color: white,
  );

  static TextStyle body3 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body3Size,
    letterSpacing: 1,
    color: darkText,
  );

  static TextStyle body3Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body3Size,
    letterSpacing: 1,
    color: white, // was lightText
  );

  static TextStyle body4 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body4Size,
    letterSpacing: 1,
    color: darkText,
  );
  static TextStyle body4Light = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: body4Size,
    letterSpacing: 0.6,
    color: white,
  );

  static TextStyle body5 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    height: 2,
    fontWeight: FontWeight.w400,
    fontSize: body5Size,
    letterSpacing: 0.8,
    color: darkText,
  );

  static TextStyle body5Light = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    height: 2,
    fontWeight: FontWeight.w400,
    fontSize: body5Size,
    letterSpacing: 0.8,
    color: white,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
