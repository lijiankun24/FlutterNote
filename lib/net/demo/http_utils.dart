import 'package:dio/dio.dart';

typedef ErrorCallback = void Function(String msg);

class HttpUtils {
  static const TIMEOUT_TIME = 10 * 1000;

  static const GET = 'GET';
  static const POST = 'POST';

  static Dio _dio;

  static HttpUtils _instance;

  HttpUtils._internal(String base) {
    _dio = new Dio(
      BaseOptions(
        baseUrl: base,
        connectTimeout: TIMEOUT_TIME,
        receiveTimeout: TIMEOUT_TIME,
      ),
    );
  }

  factory HttpUtils(String base) {
    if (_instance == null) {
      _instance = HttpUtils._internal(base);
    }
    return _instance;
  }

  void addInterceptor(List<InterceptorsWrapper> list) {
    _dio.interceptors.clear();
    _dio.interceptors.addAll(list);
  }

  Future<Response<T>> get<T>(String path,
      {Map params, ErrorCallback errorCallback}) {
    return this._request(path, GET);
  }

  Future<Response<T>> post<T>(String path,
      {Map params, ErrorCallback errorCallback}) {
    return this._request(path, POST);
  }

  Future<Response<T>> _request<T>(String path, String method,
      {Map params, ErrorCallback errorCallback}) async {
    try {
      Response<T> rep;
      if (method == 'GET') {
        if (params != null && params.isNotEmpty) {
          StringBuffer urlParam = StringBuffer();
          urlParam.write('?');
          params.forEach((key, value) {
            urlParam.write('$key=$value&');
          });
          path = path + params.toString().substring(0, params.length - 1);
        }
        rep = await _dio.get(path);
      } else if (method == 'POST') {
        if (params == null || params.isEmpty) {
          rep = await _dio.post(path);
        } else {
          rep = await _dio.post(path, data: params);
        }
      }
      if (rep != null && rep.statusCode != 200 && errorCallback != null) {
        errorCallback('server response error: ${rep.statusCode}');
        return null;
      }
      return rep;
    } catch (e) {
      if (errorCallback != null) {
        errorCallback('network error, catch error: ${e.toString()}');
      }
      return null;
    }
  }
}
