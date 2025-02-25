import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/track_id_provider.dart';
import 'package:spookify_v2/core/network/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/database/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';

part 'player_state.dart';
part 'player_cubit.freezed.dart';

class PlayerCubit extends Cubit<PlayerState> with StateConnectivityMixin {
  final PlaylistRepository _repository;
  bool _isInitializing = false;

  final List<String> _trackIds = [];
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
            artist: track.artistName,
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
      emit(state.copyWith(track: state.track.copyWith(isFavorite: success)));
    });
  }

  Future<void> initialize(TrackIdProvider args) async {
    if (_isInitializing) return;
    _isInitializing = true;
    if (args.trackIds.length <= 1) {
      emit(state.copyWith(hasNext: false));
    }
    _trackIds.addAll(args.trackIds);

    if (state.currId.isEmpty) {
      emit(state.copyWith(currId: args.currId));
      _setPrevAndNextIds(args.currId, _trackIds);
    }

    final track = await _repository.getTrack(id: state.currId);

    track.fold((error) {
      emit(
        state.copyWith(
          error: error.message,
          isLoading: false,
        ),
      );
      addNewFailedRequest(() => initialize(args));
    }, (success) {
      emit(state.copyWith(track: success, isLoading: false, error: ''));
    });

    _isInitializing = false;
  }

  Future<void> _onRefresh() async {
    if (_isInitializing) return;
    _isInitializing = true;

    final track = await _repository.getTrack(id: state.currId);

    track.fold((error) {
      emit(
        state.copyWith(
          error: error.message,
          isLoading: false,
        ),
      );
      addNewFailedRequest(() => _onRefresh());
    }, (success) {
      emit(state.copyWith(track: success, isLoading: false, error: ''));
    });

    _isInitializing = false;
  }

  void playMusic() {
    emit(state.copyWith(isPlaying: true));
  }

  void pauseMusic() {
    emit(state.copyWith(isPlaying: false));
  }

  void onNextTrack() {
    if (_trackIds.isEmpty) return;
    _setPrevAndNextIds(state.nextId, _trackIds);
    _onRefresh();
    emit(state.copyWith(isPlaying: true));
  }

  void onPrevTrack() {
    if (_trackIds.isEmpty) return;
    _setPrevAndNextIds(state.prevId, _trackIds);
    _onRefresh();
    emit(state.copyWith(isPlaying: true));
  }

  void _setPrevAndNextIds(
    String currId,
    List<String> trackIds,
  ) {
    final indexOfCurrentId = trackIds.indexOf(currId);

    final prevId =
        indexOfCurrentId == 0 ? trackIds.last : trackIds[indexOfCurrentId - 1];
    final nextId = indexOfCurrentId == trackIds.length - 1
        ? trackIds.first
        : trackIds[indexOfCurrentId + 1];

    emit(
      state.copyWith(
        prevId: prevId,
        nextId: nextId,
        currId: currId,
      ),
    );
  }

  String formatTimeDuration({required int minutes, required int seconds}) =>
      "$minutes:${(seconds % 60).toString().padLeft(2, '0')}";
}
