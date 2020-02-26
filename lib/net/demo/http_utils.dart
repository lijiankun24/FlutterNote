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

  Future<Response<T>> get<T>(String path) {
    return this._request(path, GET);
  }

  Future<Response<T>> post<T>(String path) {
    return this._request(path, POST);
  }

  Future<Response<T>> _request<T>(String path, String method,
      {ErrorCallback errorCallback}) async {
    try {
      Response<T> rep;
      if (method == 'GET') {
        rep = await _dio.get(path);
      } else if (method == 'POST') {
        rep = await _dio.post(path);
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
