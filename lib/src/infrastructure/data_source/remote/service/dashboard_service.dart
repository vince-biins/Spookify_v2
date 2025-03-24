import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/album_response.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/artist_response.dart';

import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/category_response.dart';

part 'dashboard_service.g.dart';

@RestApi()
abstract class DashboardService {
  factory DashboardService(Dio dio, {String baseUrl}) = _DashboardService;

  @GET('v1/browse/categories')
  Future<CategoryResponse> getCategories({
    @Query('limit') int? limit,
  });

  @GET('v1/artists')
  Future<ArtistResponse> getArtists(
    @Query('ids') String ids,
  );

  @GET('v1/albums')
  Future<AlbumResponse> getAlbums(
    @Query('ids') String ids,
  );
}
