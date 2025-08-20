import 'package:dio/dio.dart';

class RemoteApi {
  final Dio _dio;

  RemoteApi(this._dio) {
    _dio.options
      ..baseUrl = "https://fakestoreapi.com/"
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print(" Request: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(" Response: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(" Error: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> getProducts(int limit, int page) async {
        return await _dio.get("products");
  }
}
