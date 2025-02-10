import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spookify_v2/core/secret/environment.dart';
import 'package:spookify_v2/features/auth/data/service/token_service.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';

const String _accessTokenKey = 'access_token';
const String _tokenExpiryKey = 'token_expiry';

class AuthRepositoryImpl extends AuthRepository {
  final TokenService service;
  final Dio dio;
  final FlutterSecureStorage storage;
  AuthRepositoryImpl(this.dio, this.service, this.storage);

  @override
  Future<bool> retrieveToken() async {
    try {
      final response = await service.getToken(
        'client_credentials',
        Environment.clientId,
        Environment.clientSecret,
      );

      final accessToken = response.accessToken;

      await saveToken(accessToken);
      return accessToken != '';
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getStoredToken() async {
    try {
      final accessToken = await storage.read(key: _accessTokenKey);
      final expiryTimeStr = await storage.read(key: _tokenExpiryKey);
      if (accessToken != null && expiryTimeStr != null) {
        final expiryTime = DateTime.parse(expiryTimeStr);
        final currentTime = DateTime.now();

        if (currentTime.isBefore(expiryTime)) {
          return accessToken;
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Response> retryRequest(RequestOptions requestOptions) async {
    try {
      await retrieveToken();

      final newAccessToken = await getStoredToken();
      requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final response = await dio.fetch(requestOptions);

      return response;
    } catch (e) {
      throw Exception('Failed to retry request: $e');
    }
  }

  @override
  Future<void> saveToken(String accessToken) async {
    final expiryTime =
        DateTime.now().add(const Duration(hours: 1)).toIso8601String();
    await storage.write(key: _accessTokenKey, value: accessToken);
    await storage.write(key: _tokenExpiryKey, value: expiryTime);
  }
}
