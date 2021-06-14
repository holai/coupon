import 'package:coupon/routes/app_pages.dart';
import 'package:coupon/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.bg,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/home" + Routes.SEARCH);
                  },
                  child: Container(
                    height: 35.h,
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        Text("搜索商品",
                            style: AppTheme.body2.copyWith(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  //tab文字类型
                  labelStyle:
                      TextStyle(fontSize: 55.sp, fontWeight: FontWeight.bold),
                  //选中的颜色
                  labelColor: Color.fromRGBO(89, 61, 58, 1),
                  //未选中的颜色
                  unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
                  //自定义指示器
                  indicator: CustomUnderlineTabIndicator(
                    borderSide: BorderSide(width: 4.0, color: Colors.red),
                    insets: EdgeInsets.only(
                        // left: (MediaQuery.of(context).size.width / 2.0 - 20) / 2.0,
                        // right: (MediaQuery.of(context).size.width / 2.0 - 20) / 2.0,
                        left: 18,
                        right: 18,
                        top: 15),
                  ),
                  //文本偏移
                  labelPadding: EdgeInsets.only(top: 10, bottom: 10),
                  tabs: controller.tabTitles.map((value) {
                    return Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          value['name'],
                          style: AppTheme.body3,
                        ));
                  }).toList(),
                ),
                Expanded(
                    child: TabBarView(
                        // physics: NeverScrollableScrollPhysics(), //禁止滑动
                        controller: controller.tabController,
                        children: () {
                          List<Widget> list = [];
                          controller.tabTitles.forEach((element) {
                            list.add(element['page']);
                          });
                          return list;
                        }()))
              ],
            ),
          ),
        ));
  }
}

//自定义指示器--实现方式：复制UnderlineTabIndicator类的源码，新建类，修改StrokeCap.square为StrokeCap.round
class CustomUnderlineTabIndicator extends Decoration {
  const CustomUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomUnderlineTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    //设置为圆角
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
