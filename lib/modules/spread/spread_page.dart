import 'package:coupon/theme/app_theme.dart';
import 'package:coupon/utils/util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'spread_controller.dart';

class SpreadPage extends StatelessWidget {
  SpreadController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.put(SpreadController());
    return Scaffold(
        backgroundColor: AppTheme.bg,
        body: Container(
            width: double.infinity,
            child: Obx(() => ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  var item = controller.list[index];
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
                    child: GestureDetector(
                      onTap: () {
                        Util.openUrl(item['href']);
                      },
                      child: Row(
                        children: [
                          ExtendedImage.network(
                            item['img'],
                            fit: BoxFit.fitWidth,
                            loadStateChanged: Util.ExtendedImageLoad,
                            cache: true,
                            width: 140.w,
                            // constraints: BoxConstraints(minWidth: 140.h),
                            // shape: BoxShape.rectangle,
                            // borderRadius: BorderRadius.circular(5),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: AppTheme.title3,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Text(
                                '平台: ' + item['platform'],
                                style: AppTheme.body3,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                }))));
  }
}
