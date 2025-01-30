import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/features/playlist/data/local/entity/entity.dart';

import 'package:spookify_v2/features/playlist/domain/model/model.dart';
import 'package:spookify_v2/features/playlist/domain/repository/repository.dart';
import 'package:spookify_v2/core/utils/utils.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/provider.dart';

part 'track_event.dart';
part 'track_state.dart';
part 'track_bloc.freezed.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final TrackBlocProvider _args;
  final PlaylistRepository _repository;

  TrackBloc({
    required TrackBlocProvider args,
    required PlaylistRepository repository,
  })  : _repository = repository,
        _args = args,
        super(const TrackState.initial()) {
    on<LoadTrack>(_onLoadTrack);
    on<UpdateFavoriteTrack>(_onAddedFavoriteTrack);
  }

  FutureOr<void> _onLoadTrack(LoadTrack event, Emitter<TrackState> emit) async {
    emit(const TrackState.loading());

    final result = await switch (_args.type) {
      TrackType.album => _repository.getAlbumTrack(_args.id),
      TrackType.artist => _repository.getArtistTopTracks(_args.id),
    };

    result.fold(
      (error) => emit(
        TrackState.error(message: error.message),
      ),
      (data) => emit(
        TrackState.loaded(tracks: data),
      ),
    );
  }

  FutureOr<void> _onAddedFavoriteTrack(
    UpdateFavoriteTrack event,
    Emitter<TrackState> emit,
  ) async {
    final res = switch (event.isFavorite) {
      true => await _repository.insertFavorite(
          FavoriteEntity(
            trackId: event.track.trackId,
            title: event.track.trackName,
            isFavorite: true,
          ),
        ),
      false => await _repository.deleteFavorite(event.track.trackId)
    };

    res.fold((error) {}, (success) {
      emit(TrackState.loaded(tracks: (state as _LoadedTrack).tracks));
      // state.maybeWhen(
      //   orElse: () {},
      //   loaded: (tracks) => emit(
      //     (state as _LoadedTrack ).copyWith(
      //       tracks: tracks.map((track) {
      //         return track.trackId == event.track.trackId
      //             ? track.copyWith(isFavorite: event.isFavorite)
      //             : track;
      //       }).toList(),
      //     ),
      //   ),
      // );
    });
  }
}
