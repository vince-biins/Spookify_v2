import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/features/playlist/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';

part 'player_state.dart';
part 'player_cubit.freezed.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final PlaylistRepository _repository;
  PlayerCubit({
    required PlaylistRepository repository,
  })  : _repository = repository,
        super(PlayerState.initialized());
  Future<void> toggleFavorite({
    required bool isFavorite,
    required Track track,
  }) async {
    final res = switch (isFavorite) {
      true => await _repository.insertFavorite(FavoriteEntity(
          trackId: track.trackId,
          title: track.trackName,
          imageUrl: track.imageUrl ?? '',
          isFavorite: true,
        )),
      false => await _repository.deleteFavorite(track.trackId)
    };
    res.fold((error) {
      emit(state.copyWith(error: error.message));
    }, (success) {
      emit(state.copyWith(isFavorite: success));
    });
  }

  Future<void> initialize(String id) async {
    final track = await _repository.getTrack(id: id);
    track.fold((error) {}, (success) {
      emit(state.copyWith(track: success, isLoading: false));
    });
  }
}
