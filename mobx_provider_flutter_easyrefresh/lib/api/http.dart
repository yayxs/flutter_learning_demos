import 'package:dio/dio.dart';

class HttpRequest {
  final Dio dio = Dio();

  HttpRequest() {
    // api地址
    dio.options.baseUrl = 'https://www.soscoon.com/';
    // 请求超时时间
    dio.options.receiveTimeout = 15000;
    // 增加拦截器
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        // 请求加入token
        options.headers["csrfToken"] = 'csrfToken';
        return options;
      }, onResponse: (Response response) {
        // 在返回响应数据之前做一些预处理
        return response;
      }, onError: (DioError error) {
        // print(error);
        // 当请求失败时做一些预处理
        return error; //continue
      }))
      ..add(LogInterceptor());
  }
}
