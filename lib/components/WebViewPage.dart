import 'package:bot_toast/bot_toast.dart';
import 'package:coupon/utils/logger_util.dart';
import 'package:coupon/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var webViewTitle = "领券中...".obs;

    FlutterWebviewPlugin().onUrlChanged.listen((String url) async {
      if (!(url.startsWith("http:") || url.startsWith("https:"))) {
        LoggerUtil.e("qd");
        // return false;
        await FlutterWebviewPlugin().stopLoading();
        await FlutterWebviewPlugin().goBack();

        // await FlutterWebviewPlugin().goBack();

        LoggerUtil.e(await canLaunch(url));
        if (await canLaunch(url)) {
          Get.back();
          Util.launchURL(url); //use url launcher plugin
        } else {
          BotToast.showText(text: "未安装淘宝");
        }
      }
    });

    FlutterWebviewPlugin()
        .onStateChanged
        .listen((WebViewStateChanged st) async {
      String title =
          await FlutterWebviewPlugin().evalJavascript("window.document.title");
      title = title.replaceAll("\"", "");
      if (!(title == "")) {
        webViewTitle.value = title;
      }
    });

    var url = Get.arguments;
    return WebviewScaffold(
      url: url,
      withZoom: true,
      withJavascript: true,
      userAgent:
          "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
      appBar: AppBar(
        title: Obx(() => Text(webViewTitle.value)),
      ),
    );
  }
}
