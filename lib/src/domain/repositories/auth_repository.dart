import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<bool> retrieveToken();
  Future<String?> getStoredToken();
  Future<Response> retryRequest(RequestOptions requestOptions);
  Future<void> saveToken(String accessToken);
}
