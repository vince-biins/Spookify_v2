import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:spookify_v2/features/playlist/data/remote/model/model.dart';

part 'playlist_service.g.dart';

@RestApi()
abstract class PlaylistService {
  factory PlaylistService(Dio dio, {String baseUrl}) = _PlaylistService;

  @GET('v1/albums/{id}/tracks')
  Future<TrackResponse> getCategoryTracks(
    @Path('id') String id,
  );

  @GET('v1/artists/{id}/top-tracks?market=PH')
  Future<ArtistTopTrackResponse> getArtistTopTracks(
    @Path('id') String id,
  );

  @GET('v1/tracks/{id}?market=PH')
  Future<TrackResponseItem> getTrack(
    @Path('id') String id,
  );
}
