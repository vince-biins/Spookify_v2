import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/core/network/mixin/api_error_handler.dart';
import 'package:spookify_v2/features/playlist/domain/mapper/playlist_mapper.dart';
import 'package:spookify_v2/features/playlist/data/service/playlist_service.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';

class PlaylistRepositoryImpl
    with ApiErrorHandler
    implements PlaylistRepository {
  final PlaylistService _service;

  PlaylistRepositoryImpl({required PlaylistService service})
      : _service = service;

  @override
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id) async {
    try {
      final response = await _service.getCategoryTracks(id);
      return Right(response.transform());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Track>>> getArtistTopTracks(
    String id,
  ) async {
    try {
      final response = await _service.getArtistTopTracks(id);
      print(response);
      return Right(response.transform());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }
}
