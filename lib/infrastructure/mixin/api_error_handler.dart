import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:spookify_v2/domain/failure.dart';

mixin ApiErrorHandler {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  Failure handleApiError(dynamic error) {
    String errorMessage = '';
    if (error is DioException) {
      final String endpoint = error.requestOptions.uri.toString();
      errorMessage = '''Error occurred at endpoint: $endpoint 
      $error
      ''';
      switch (error.type) {
        case DioExceptionType.cancel:
          errorMessage += 'Request to API was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          errorMessage += 'Connection timeout with API';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage += 'Receive timeout in connection with API';
          break;
        case DioExceptionType.badResponse:
          if (error.response != null) {
            errorMessage +=
                'Received invalid status code: ${error.response?.statusCode}';

            switch (error.response?.statusCode) {
              case 400:
                errorMessage += 'Bad request';
                break;
              case 401:
                errorMessage += 'Unauthorized';
                break;
              case 403:
                errorMessage += 'Forbidden';
                break;
              case 404:
                errorMessage += 'Not found';
                break;
              case 500:
                errorMessage += 'Internal server error';
                break;

              default:
                errorMessage +=
                    'Received unexpected status code: ${error.response?.statusCode}';
            }
          } else {
            errorMessage += 'Received invalid response without status code';
          }
          break;
        case DioExceptionType.sendTimeout:
          errorMessage += 'Send timeout in connection with API';
          break;
        case DioExceptionType.unknown:
          errorMessage += 'Connection to API failed due to network issues';
          break;
        case DioExceptionType.badCertificate:
          errorMessage += 'Bad certificate error';
          break;
        case DioExceptionType.connectionError:
          errorMessage += 'Connection error with API';
          break;
      }
    } else {
      errorMessage += 'Unexpected error: $error';
    }
    logger.e(errorMessage);
    return Failure(message: errorMessage);
  }
}
