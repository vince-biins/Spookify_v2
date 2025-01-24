import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id);
  Future<Either<Failure, List<Track>>> getArtistTopTracks(String id);
}
