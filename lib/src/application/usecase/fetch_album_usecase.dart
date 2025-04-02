import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/application/config/misc.dart';

import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/entity/album.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';

class FetchAlbumUsecase {
  final DashboardRepository _repository;

  FetchAlbumUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Album>>> call() async =>
      _repository.getAllAlbums(SpotifyId.albumIds.join(','));
}
