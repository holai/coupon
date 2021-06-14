import 'package:coupon/theme/app_theme.dart';
import 'package:coupon/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class MyWidget {
  static Widget getButton(String ts, Function func,
      {Color color, double height}) {
    return Container(
      margin: EdgeInsets.fromLTRB(63, 20, 63, 20),
      height: height == null ? 40.h : height,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(maxHeight: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Material(
        // Color(0XFFFF6B01)
        color: color == null ? Theme.of(Get.context).primaryColor : color,
        type: MaterialType.button,
        child: InkWell(
          splashColor: Colors.black12,
          onTap: () {
            func();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black12,
              //       offset: Offset(1.0, 1.0),
              //       blurRadius: 1.0,
              //       spreadRadius: 1.0)
              // ]
            ),
            alignment: Alignment.center,
            child: Text(
              ts,
              style: AppTheme.body2Light,
            ),
          ),
        ),
      ),
    );
  }

  static Widget getBack({Color color, double size, Function func}) {
    return InkWell(
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: color == null ? Colors.black : color,
        size: size == null ? 20.w : size,
      ),
      onTap: () {
        if (func != null) {
          func();
        }
        Navigator.pop(Get.context);
      },
    );
  }

  static Widget getTextTag(String str, {String dw = ""}) {
    if (Util.isEmpty(str)) {
      return SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(1.0, 1.0),
              blurRadius: .1,
              spreadRadius: .1),
          BoxShadow(
              color: Colors.black12,
              offset: Offset.zero,
              blurRadius: .1,
              spreadRadius: .2)
        ],
      ),
      margin: const EdgeInsets.only(left: 0, right: 4, top: 0, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        str + dw,
        style: TextStyle(fontSize: 12, height: 1.5, color: AppTheme.grey),
      ),
    );
  }
}
