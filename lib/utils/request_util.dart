import 'package:coupon/config/config.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';

import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
import 'logger_util.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class Path {
  static final String getList = "/list";
  static final String search = "/search";
  static final String spread = "/assets/spread.json";
}

class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();
  // static PersistCookieJar cookieJar;

  factory DioUtil() {
    return _instance;
  }
  DioUtil._init() {
    _dio = new Dio();
    _dio.options = _options;
  }
  // static void setCookie() async {
  //   //DioCacheManager
  //   _dio.interceptors.add(DioCacheManager(
  //     CacheConfig(baseUrl: Config.getBaseUrl()),
  //   ).interceptor);
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String cookiesPath = join(appDocDir.path, ".cookies/");
  //   //Cookie管理
  //   cookieJar = PersistCookieJar(dir: cookiesPath);
  //   _dio.interceptors.add(CookieManager(cookieJar));
  // }

  static BaseOptions getDefOptions({var token = ""}) {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;

    options.baseUrl = Config.getBaseUrl();
    options.contentType = 'application/json; charset=utf-8';

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;
    // if (cookieJar != null) {
    // } else {
    //   setCookie();
    // }

    return options;
  }

  setOptions({BaseOptions options}) async {
    _options = options;
    _dio.options = _options;
  }

  Future<Map<String, dynamic>> get(String path,
      {pathParams, data, Function errorCallback}) {
    return request(path,
        method: Method.get,
        pathParams: pathParams,
        data: data,
        errorCallback: errorCallback);
  }

  Future<Map<String, dynamic>> post(
    String path, {
    pathParams,
    data,
    Map<String, dynamic> queryParameters,
    Function errorCallback,
  }) {
    return request(path,
        method: Method.post,
        pathParams: pathParams,
        data: data,
        queryParameters: queryParameters,
        errorCallback: errorCallback);
  }

  Future<Map<String, dynamic>> request(String path,
      {String method,
      Map pathParams,
      data,
      Map<String, dynamic> queryParameters,
      Function errorCallback}) async {
    ///restful请求处理
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }

    Response response;
    try {
      response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: method));
    } catch (e) {
      LoggerUtil.d(e);
      BotToast.showText(text: '网络连接失败');
      return {"status": "404"};
    }
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        var data;
        if (response.data is Map) {
          data = response.data;
        } else {
          data = json.decode(response.data.toString());
        }

        return data;
      } catch (e) {
        return null;
      }
    } else {
      _handleHttpError(response.statusCode);
      if (errorCallback != null) {
        errorCallback(response.statusCode);
      }
      return null;
    }
  }

  void _handleHttpError(int errorCode) {}
}
