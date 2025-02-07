import 'package:dio/dio.dart';
import 'package:spookify_v2/core/secret/environment.dart';
import 'package:spookify_v2/features/auth/data/service/token_service.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final TokenService service;
  final Dio dio;
  late String token;
  AuthRepositoryImpl(this.dio, this.service);

  @override
  Future<String> getToken() async {
    try {
      final response = await service.getToken(
        'client_credentials',
        Environment.clientId,
        Environment.clientSecret,
      );

      final accessToken = response.accessToken;
      token = accessToken;
      print('TOKEN: $accessToken');
      //  await _storage.write(key: 'access_token', value: accessToken);
      return accessToken;
    } catch (e) {
      print(e);
      // Handle error (e.g., log the error, rethrow the error, etc.)
      throw Exception('Failed to retrieve token: $e');
    }
  }

  @override
  Future<String?> getStoredToken() async {
    try {
      return token; //     return await _storage.read(key: 'access_token');
    } catch (e) {
      // Handle error (e.g., log the error, return null, etc.)
      return null;
    }
  }

  @override
  Future<Response> retryRequest(RequestOptions requestOptions) async {
    try {
      final newAccessToken = await getToken();
      requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      return await dio.fetch(requestOptions);
    } catch (e) {
      // Handle error (e.g., log the error, rethrow the error, etc.)
      throw Exception('Failed to retry request: $e');
    }
  }
}
