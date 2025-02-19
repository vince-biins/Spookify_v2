import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/core/network/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/features/playlist/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';

part 'player_state.dart';
part 'player_cubit.freezed.dart';

class PlayerCubit extends Cubit<PlayerState> with StateConnectivityMixin {
  final PlaylistRepository _repository;
  bool _isInitializing = false;

  PlayerCubit({
    required PlaylistRepository repository,
  })  : _repository = repository,
        super(PlayerState.initialized()) {
    listenForConnectionChange();
  }

  Future<void> toggleFavorite({
    required bool isFavorite,
    required Track track,
  }) async {
    final res = switch (isFavorite) {
      true => await _repository.insertFavorite(
          FavoriteEntity(
            trackId: track.trackId,
            title: track.trackName,
            imageUrl: track.imageUrl ?? '',
            isFavorite: true,
          ),
        ),
      false => await _repository.deleteFavorite(track.trackId)
    };
    res.fold((error) {
      emit(state.copyWith(error: error.message));
      addNewFailedRequest(
        () => toggleFavorite(
          isFavorite: isFavorite,
          track: track,
        ),
      );
    }, (success) {
      emit(state.copyWith(isFavorite: success));
    });
  }

  Future<void> initialize(String id) async {
    if (_isInitializing) return;
    _isInitializing = true;

    final track = await _repository.getTrack(id: id);

    track.fold((error) {
      emit(state.copyWith(error: error.message, isLoading: false));
      addNewFailedRequest(() => initialize(id));
    }, (success) {
      print(success);
      emit(state.copyWith(track: success, isLoading: false, error: ''));
    });

    _isInitializing = false;
  }
}
