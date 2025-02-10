import 'dart:async';

import 'package:dio/dio.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';

class TokenInterceptor extends Interceptor {
  final AuthRepository authRepository;
  bool isRefreshing = false;
  List<Map<String, dynamic>> failedRequests = [];

  TokenInterceptor(this.authRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authRepository.getStoredToken();
    print('ONREQUEST $accessToken');

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!isRefreshing) {
        isRefreshing = true;
        try {
          final token = await refreshToken(err, handler);
          print('ONERROR $token');
          isRefreshing = false;
        } catch (e) {
          _handleTokenRefreshFailure(err, handler);
          isRefreshing = false;
        }
      } else {
        failedRequests.add({'err': err, 'handler': handler});
      }
    } else {
      return handler.next(err);
    }
  }

  FutureOr refreshToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isSuccess = await authRepository.retrieveToken();

    if (!isSuccess) {
      return false;
    }
    if (isSuccess) {
      final accessToken = await authRepository.getStoredToken();
      if (accessToken != null) {
        failedRequests.add({'err': err, 'handler': handler});
        _retryFailedRequests(accessToken);
        return true;
      } else {
        isRefreshing = false;
        return false;
      }
    }
  }

  void _retryFailedRequests(String newAccessToken) {
    for (var request in failedRequests) {
      final err = request['err'] as DioException;
      final handler = request['handler'] as ErrorInterceptorHandler;
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      authRepository.retryRequest(err.requestOptions).then((response) {
        handler.resolve(response);
      }).catchError((error) {
        handler.next(error);
      });
    }
    failedRequests.clear();
  }

  void _handleTokenRefreshFailure(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    err = DioException(
      requestOptions: err.requestOptions,
      error: 'Session Expired',
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: err.requestOptions,
        statusCode: 511,
        statusMessage: 'Session Expired',
      ),
    );
    handler.next(err);
  }
}
