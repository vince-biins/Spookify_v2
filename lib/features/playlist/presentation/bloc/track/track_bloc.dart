import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';
import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/track_bloc_provider.dart';

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
}
