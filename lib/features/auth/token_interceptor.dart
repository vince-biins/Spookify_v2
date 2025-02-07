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
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 400) {
      if (!isRefreshing) {
        isRefreshing = true;
        try {
          final newAccessToken = await authRepository.getToken();
          print(newAccessToken);
          _retryFailedRequests(newAccessToken);
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

  void _retryFailedRequests(String newAccessToken) {
    for (var request in failedRequests) {
      final err = request['err'] as DioException;
      final handler = request['handler'] as ErrorInterceptorHandler;
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
