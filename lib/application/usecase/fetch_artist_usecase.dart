import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';

import 'package:spookify_v2/presentation/utils/utils.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/artist.dart';

class FetchArtistUsecase {
  final DashboardRepository _repository;

  FetchArtistUsecase({
    required DashboardRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Artist>>> call() async =>
      _repository.getArtists(SpotifyId.artistIds.join(','));
}
