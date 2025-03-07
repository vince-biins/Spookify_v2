import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/application/config/misc.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';

import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/entity/artist.dart';

class FetchArtistUsecase {
  final DashboardRepository _repository;

  FetchArtistUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Artist>>> call() async =>
      _repository.getAllArtists(SpotifyId.artistIds.join(','));
}
