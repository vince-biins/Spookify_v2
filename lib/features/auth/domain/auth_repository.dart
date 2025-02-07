import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<String> getToken();
  Future<String?> getStoredToken();
  Future<Response> retryRequest(RequestOptions requestOptions);
}
