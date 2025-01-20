import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'dashboard_service.g.dart';

@RestApi()
abstract class DashboardService {
  factory DashboardService(Dio dio, {String baseUrl}) = _DashboardService;

  @GET('/mobile/count')
  Future<List<String>> getCategories();

  @GET('/mobile/count')
  Future<List<String>> getArtists();

  @GET('/mobile/count')
  Future<List<String>> getAlbums();
}
