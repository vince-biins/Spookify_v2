import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/track.dart';
import 'package:spookify_v2/domain/repositories/local_repository.dart';
import 'package:spookify_v2/infrastructure/data_source/local/entity/save_category_dto.dart';

abstract class PlaylistRepository implements LocalRepository<Track> {
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id);
  Future<Either<Failure, List<Track>>> getArtistTopTracks(String id);

  Future<Either<Failure, Track>> getTrack({required String id});
  Future<Either<Failure, bool>> saveAllTracksInLocal({
    required SaveCategoryDto saveCategory,
    required List<Track> tracks,
  });
  Future<Either<Failure, bool>> getSavedCategoryById(String id);
  Future<Either<Failure, bool>> deleteSavedCategoryById(String id);
}
