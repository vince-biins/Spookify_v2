import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/network.dart';
import 'package:spookify_v2/core/utils/utils.dart';
import 'package:spookify_v2/features/dashboard/domain/model/album.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';

class FetchAlbumUsecase {
  final DashboardRepository _repository;

  FetchAlbumUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Album>>> call() async =>
      _repository.getAlbums(SpotifyId.albumIds.join(','));
}
