import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/database/domain/repository/local_repository.dart';

import 'package:spookify_v2/features/playlist/domain/model/model.dart';

abstract class PlaylistRepository implements LocalRepository<Track> {
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id);
  Future<Either<Failure, List<Track>>> getArtistTopTracks(String id);

  Future<Either<Failure, Track>> getTrack({required String id});
}
