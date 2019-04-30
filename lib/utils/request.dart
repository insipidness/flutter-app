import 'package:dio/dio.dart';
import 'dart:async';

/*
 * 封装 restful 请求
 * 
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {

  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://192.168.45.73:8080';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  static Future<Map> request (
    String url, 
    { data, method }) async {

    data = data ?? {};
    method = method ?? 'GET';

    Dio dio = createInstance();
    var result;

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + data.toString());
    print(dio.options.baseUrl);
    try {
      /*
      await dio.request(url, queryParameters: data, options: new Options(method: method)); 请求参数url后拼接
      await dio.request(url, data: data, options: new Options(method: method));            请求参数url后不拼接
      **/
      Response response = await dio.request(url, queryParameters: data, options: new Options(method: method));
      result = response.data;
      /// 打印响应相关信息
      // print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      // print('请求出错：' + e.toString());
    } 

    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance () {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      dio = new Dio();
      dio.options.baseUrl = API_PREFIX;
      dio.options.connectTimeout = CONNECT_TIMEOUT;
      dio.options.receiveTimeout = RECEIVE_TIMEOUT;
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear () {
    dio = null;
  }

}