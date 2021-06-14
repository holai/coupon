import 'package:coupon/components/WebViewPage.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:date_format/date_format.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  //图片加载 占位
  static Widget ExtendedImageLoad(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          // padding: EdgeInsets.all(30.w),
          child: CircularProgressIndicator(
              // semanticsLabel: "加载",

              // backgroundColor: Colors.black54,
              ),
        );
        break;
      // case LoadState.completed:
      //   return ExtendedRawImage(
      //     image: state.extendedImageInfo?.image,
      //   );
      //   break;
      case LoadState.failed:
        // _controller.reset();
        return GestureDetector(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            // padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                    child: Image.asset(
                      "assets/center/imgError.png",
                      fit: BoxFit.fill,

                      //  width: 80,
                      // height: 80,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Container(
                    // clipBehavior: Clip.antiAlias,
                    // margin: EdgeInsets.only(top: 60.h),
                    child: Text(
                      "点击重新加载",
                      style: AppTheme.body,
                    ),
                  ),
                ),
                Spacer(),

                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Text(
                //     "load image failed, click to reload",
                //     textAlign: TextAlign.center,
                //   ),
                // )
              ],
            ),
          ),
          onTap: () {
            state.reLoadImage();
          },
        );
        break;
      case LoadState.completed:
        // TODO: Handle this case.
        break;
    }
  }

  static bool isEmpty(var val) {
    return val == null || val.toString() == "" || int.tryParse(val) == 0;
  }

  static void launchURL(var url) async => await launch(
        url,
      );

  // 店铺信息-卖家类型，0表示淘宝，1表示天猫，3表示特价版
  static String getUserType(int code) {
    switch (code) {
      case 0:
        return '淘宝';
      case 1:
        return '天猫';
      case 3:
        return '特价版';

      default:
        return '其他';
    }
  }

  static void openUrl(var url) {
    //打开链接
    if (GetPlatform.isWindows || GetPlatform.isWeb) {
      Util.launchURL('http:' + url);
    } else {
      Get.to(WebViewPage(), arguments: 'http:' + url);
    }
  }
}
