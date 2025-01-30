import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/network.dart';
import 'package:spookify_v2/core/utils/utils.dart';
import 'package:spookify_v2/features/dashboard/domain/model/artist.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';

class FetchArtistUsecase {
  final DashboardRepository _repository;

  FetchArtistUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Artist>>> call() async =>
      _repository.getArtists(SpotifyId.artistIds.join(','));
}
