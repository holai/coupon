import 'package:coupon/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef FuncControl = void Function(RefreshController refreshController);

//封装    动画  刷新 列表
class Refresher extends StatefulWidget {
  FuncWidget widgetBox;
  int length;
  FuncControl onRefresh;
  FuncControl onLoading;
  ScrollController scrollController;
  bool isLoad;
  Color bg;
  var nodatatext = "";
  var showLoad = true;

  Refresher(this.widgetBox, this.length,
      {this.onRefresh,
      this.onLoading,
      this.scrollController,
      this.isLoad = true,
      this.bg = AppTheme.bg,
      this.nodatatext = "没有更多数据了!",
      this.showLoad = true});
  @override
  _RefresherState createState() => _RefresherState();
}

class _RefresherState extends State<Refresher> {
  // int length;

  // FuncWidget widgetBox;
  // _MyRefresherState(FuncWidget widget, int length) {
  //   this.widgetBox = widget;
  //   this.length = length;
  // }

  // final AsyncMemoizer _memoizer = AsyncMemoizer();
  RefreshController _refreshController;
  ScrollController _scrollController;
  // List<Mession> messionList = [];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(); //①声明刷新控制器
    _scrollController = ScrollController();
// _refreshController.
  }

  @override
  bool get wantKeepAlive => true;

  // _fetchMessionList() {
  //   //初始化获取数据列表
  //   return listData;
  // }

  // _fetchList() async {
  //   setState(() {
  //     _refreshController.refreshCompleted(); //下拉结束
  //   });
  //   // return listData;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bg,
      ),
      margin: EdgeInsets.all(0),
      child: AnimationLimiter(
          child: SmartRefresher(
        //②SmartRefresher使用
        controller: _refreshController, //指定下拉控制器
        enablePullDown: true, //下拉可用
        enablePullUp: widget.isLoad,
        // isNestWrapped: false,
// ClassicIndicator
        header: ClassicHeader(
          // canTwoLevelText: "成功",
          completeText: "成功",
          idleText: "刷新",
          // refreshingText: "加载中",
          releaseText: "加载中",
        ), //下拉样式

        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;

            if (mode == LoadStatus.idle) {
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(I),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                  Text("加载中", style: AppTheme.body2),
                ],
              );
              body = SizedBox();
            } else if (mode == LoadStatus.loading) {
              body = CircularProgressIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！", style: AppTheme.body2);
            } else if (mode == LoadStatus.canLoading) {
              // body = Text("松手,加载更多!");
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(I),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                  Text("加载中", style: AppTheme.body2),
                ],
              );
            } else {
              body = Text(widget.nodatatext, style: AppTheme.body2);
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: () async {
          //下拉实现
          widget.onRefresh(_refreshController);
          // LoggerUtil.d(widget.onRefresh);
        },
        onLoading: () {
          widget.onLoading(_refreshController);
        },
        child: ListView.builder(
          itemCount: widget.length,
          controller: widget.scrollController != null
              ? widget.scrollController
              : _scrollController,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                  //滑动动画
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      //渐隐渐现动画
                      child: Container(
                    decoration: BoxDecoration(
                      color: widget.bg,
                    ),
                    child: widget.widgetBox(context, index),
                  ))),
            );
          },
        ),
      )),
    );
  }
}

typedef FuncWidget = Widget Function(BuildContext context, int type);
