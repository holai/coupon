import 'package:coupon/config/config.dart';
import 'package:logger/logger.dart';

class LoggerUtil {
  LoggerUtil.v(dynamic v) {
    if (Config.IsDebug) {
      Logger().v(v);
    }
  }
  // 调试
  LoggerUtil.d(dynamic d, {dynamic tag}) {
    if (Config.IsDebug) {
      Logger().d(d, tag);
    }
  }
  // 信息
  LoggerUtil.i(dynamic i, {dynamic tag}) {
    if (Config.IsDebug) {
      Logger().i(i, tag);
    }
  }
  // 错误
  LoggerUtil.e(dynamic e, {dynamic tag}) {
    if (Config.IsDebug) {
      Logger().e(e, tag);
    }
  }
  // 警告
  LoggerUtil.w(dynamic w) {
    if (Config.IsDebug) {
      Logger().w(w);
    }
  }
  // WTF
  LoggerUtil.wtf(dynamic wtf) {
    if (Config.IsDebug) {
      Logger().wtf(wtf);
    }
  }
}
