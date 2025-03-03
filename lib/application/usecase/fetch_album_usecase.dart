import 'package:dartz/dartz.dart';

import 'package:spookify_v2/presentation/utils/utils.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/album.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';

class FetchAlbumUsecase {
  final DashboardRepository _repository;

  FetchAlbumUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Album>>> call() async =>
      _repository.getAlbums(SpotifyId.albumIds.join(','));
}
