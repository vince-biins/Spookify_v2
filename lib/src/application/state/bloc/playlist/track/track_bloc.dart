import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/utils/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/src/domain/models/playlist.dart';
import 'package:spookify_v2/src/domain/repositories/playlist_repository.dart';
import 'package:spookify_v2/src/application/state/bloc/playlist/provider/provider.dart';
import 'package:spookify_v2/src/domain/models/models.dart';

part 'track_event.dart';
part 'track_state.dart';
part 'track_bloc.freezed.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState>
    with StateConnectivityMixin {
  final TrackBlocProvider _args;
  final PlaylistRepository _repository;
  StreamSubscription? _connectivitySubscription;

  TrackBloc({
    required TrackBlocProvider args,
    required PlaylistRepository repository,
  })  : _repository = repository,
        _args = args,
        super(const TrackState.initial()) {
    on<LoadTrack>(_onLoadTrack);
    on<UpdateFavoriteTrack>(_onAddedFavoriteTrack);
    on<SavedAllTracks>(_onSavedAllTracks);

    _connectivitySubscription = listenForConnectionChange();
  }

  FutureOr<void> _onLoadTrack(LoadTrack event, Emitter<TrackState> emit) async {
    emit(const TrackState.loading());

    final result =
        await _repository.getTrack(id: _args.id, trackType: _args.type);

    final saveCategoryRes = await _repository.getDownloadedById(_args.id ?? '');

    bool isDownloaded = false;
    saveCategoryRes.fold((error) {}, (data) {
      isDownloaded = data;
    });

    result.fold(
      (error) {
        emit(
          TrackState.error(message: error.message),
        );
        addNewFailedRequest(() => add(const LoadTrack()));
      },
      (data) {
        if (!emit.isDone) {
          emit(
            TrackState.loaded(tracks: data, isDownloaded: isDownloaded),
          );
        }
      },
    );
  }

  FutureOr<void> _onAddedFavoriteTrack(
    UpdateFavoriteTrack event,
    Emitter<TrackState> emit,
  ) async {
    final res = switch (event.isFavorite) {
      true =>
        await _repository.saveFavoriteTrack(event.track, event.tempImageUrl),
      false => await _repository.deleteFavoriteTrack(event.track.trackId)
    };

    res.fold((error) {}, (success) {
      final index = (state as _LoadedTrack)
          .tracks
          .indexWhere((item) => event.track.trackId == item.trackId);

      final List<Track> updatedTracks =
          List.from((state as _LoadedTrack).tracks);
      updatedTracks[index] = updatedTracks[index].copyWith(isFavorite: true);

      emit(
        TrackState.loaded(
          tracks: updatedTracks,
          isDownloaded: (state as _LoadedTrack).isDownloaded,
        ),
      );
    });
  }

  FutureOr<void> _onSavedAllTracks(
    SavedAllTracks event,
    Emitter<TrackState> emit,
  ) async {
    if (state is _LoadedTrack) {
      final isDownloaded = (state as _LoadedTrack).isDownloaded;

      final res = await switch (!isDownloaded) {
        true => _repository.saveDownloadedPlaylist(
            Playlist(category: event.saveCategory, tracks: event.tracks),
          ),
        false => _repository.deleteDownloadedPLaylistById(event.saveCategory.id)
      };

      res.fold((error) {
        emit(TrackState.error(message: error.message));
      }, (data) {
        emit(
          TrackState.loaded(
            tracks: (state as _LoadedTrack).tracks,
            isDownloaded: !isDownloaded,
          ),
        );
      });
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
