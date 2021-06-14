/*
 * @Author: your name
 * @Date: 2020-12-08 20:56:00
 * @LastEditTime: 2020-12-12 14:38:37
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/splash/splash_page.dart
 */
import 'package:coupon/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            child: Column(
              children: [
                Spacer(
                  flex: 8,
                ),
                Text(controller.title),
                // Image.asset(
                //   'assets/center/XIN.png',
                //   width: 200.w,
                // ) ,

                Spacer(
                  flex: 1,
                ),
              ],
            )),
      ),
    );
  }
}
