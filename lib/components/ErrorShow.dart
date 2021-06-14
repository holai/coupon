import 'package:coupon/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Errorshow extends StatelessWidget {
  String img = "";
  String ts = "";
  bool isEmpty = false;
  Color color = Colors.white;
  Function func;
  Errorshow(
      {Key key,
      this.img = "assets/center/fail.png",
      this.ts = "暂无数据",
      this.color = Colors.white,
      this.isEmpty = false,
      this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: this.color,
      child: GestureDetector(
        onTap: () {
          if (func != null && (isEmpty)) {
            func();
          }
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Container(
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(124)),
                    boxShadow: [
                      // BoxShadow(
                      //     color: Colors.black,
                      //     offset: Offset(0.0, 1.0),
                      //     blurRadius: 1.0,
                      //     spreadRadius: 1.0)
                    ],
                  ),
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(30),
                  child: isEmpty
                      ? Image.asset(
                          img,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      : CircularProgressIndicator()),
              Container(
                margin: EdgeInsets.only(top: 40),
                width: 300,
                child: Text(
                  isEmpty ? ts : "加载中",
                  style: AppTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(
                flex: 2,
              )
            ]),
      ),
    );
  }
}
