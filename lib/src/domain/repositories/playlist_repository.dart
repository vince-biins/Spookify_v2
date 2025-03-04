import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/models/playlist.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<int>>> getPlaylist({
    required String id,
    required String playlistType,
  });
  Future<Either<Failure, List<Track>>> getTrack({
    required String? id,
    required TrackType trackType,
  });

  Future<Either<Failure, Track>> getTrackById({required String id});
  Future<Either<Failure, bool>> getDownloadedById(String id);

  Future<Either<Failure, bool>> saveFavoriteTrack(
    Track track,
    String tempImageUrl,
  );
  Future<Either<Failure, bool>> deleteFavoriteTrack(String trackId);

  Future<Either<Failure, bool>> saveDownloadedPlaylist(Playlist playlist);
  Future<Either<Failure, bool>> deleteDownloadedPLaylistById(String id);
}
