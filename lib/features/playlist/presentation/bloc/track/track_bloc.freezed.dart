// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrackEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTrack,
    required TResult Function(Track track, String tempImageUrl, bool isFavorite)
        updateFavoriteTrack,
    required TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)
        saveAllTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
    TResult? Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult? Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
    TResult Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrack value) loadTrack,
    required TResult Function(UpdateFavoriteTrack value) updateFavoriteTrack,
    required TResult Function(SavedAllTracks value) saveAllTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
    TResult? Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult? Function(SavedAllTracks value)? saveAllTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
    TResult Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult Function(SavedAllTracks value)? saveAllTracks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackEventCopyWith<$Res> {
  factory $TrackEventCopyWith(
          TrackEvent value, $Res Function(TrackEvent) then) =
      _$TrackEventCopyWithImpl<$Res, TrackEvent>;
}

/// @nodoc
class _$TrackEventCopyWithImpl<$Res, $Val extends TrackEvent>
    implements $TrackEventCopyWith<$Res> {
  _$TrackEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTrackImplCopyWith<$Res> {
  factory _$$LoadTrackImplCopyWith(
          _$LoadTrackImpl value, $Res Function(_$LoadTrackImpl) then) =
      __$$LoadTrackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTrackImplCopyWithImpl<$Res>
    extends _$TrackEventCopyWithImpl<$Res, _$LoadTrackImpl>
    implements _$$LoadTrackImplCopyWith<$Res> {
  __$$LoadTrackImplCopyWithImpl(
      _$LoadTrackImpl _value, $Res Function(_$LoadTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTrackImpl with DiagnosticableTreeMixin implements LoadTrack {
  const _$LoadTrackImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackEvent.loadTrack()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackEvent.loadTrack'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTrackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTrack,
    required TResult Function(Track track, String tempImageUrl, bool isFavorite)
        updateFavoriteTrack,
    required TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)
        saveAllTracks,
  }) {
    return loadTrack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
    TResult? Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult? Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
  }) {
    return loadTrack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
    TResult Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
    required TResult orElse(),
  }) {
    if (loadTrack != null) {
      return loadTrack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrack value) loadTrack,
    required TResult Function(UpdateFavoriteTrack value) updateFavoriteTrack,
    required TResult Function(SavedAllTracks value) saveAllTracks,
  }) {
    return loadTrack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
    TResult? Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult? Function(SavedAllTracks value)? saveAllTracks,
  }) {
    return loadTrack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
    TResult Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult Function(SavedAllTracks value)? saveAllTracks,
    required TResult orElse(),
  }) {
    if (loadTrack != null) {
      return loadTrack(this);
    }
    return orElse();
  }
}

abstract class LoadTrack implements TrackEvent {
  const factory LoadTrack() = _$LoadTrackImpl;
}

/// @nodoc
abstract class _$$UpdateFavoriteTrackImplCopyWith<$Res> {
  factory _$$UpdateFavoriteTrackImplCopyWith(_$UpdateFavoriteTrackImpl value,
          $Res Function(_$UpdateFavoriteTrackImpl) then) =
      __$$UpdateFavoriteTrackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Track track, String tempImageUrl, bool isFavorite});
}

/// @nodoc
class __$$UpdateFavoriteTrackImplCopyWithImpl<$Res>
    extends _$TrackEventCopyWithImpl<$Res, _$UpdateFavoriteTrackImpl>
    implements _$$UpdateFavoriteTrackImplCopyWith<$Res> {
  __$$UpdateFavoriteTrackImplCopyWithImpl(_$UpdateFavoriteTrackImpl _value,
      $Res Function(_$UpdateFavoriteTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = null,
    Object? tempImageUrl = null,
    Object? isFavorite = null,
  }) {
    return _then(_$UpdateFavoriteTrackImpl(
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as Track,
      tempImageUrl: null == tempImageUrl
          ? _value.tempImageUrl
          : tempImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateFavoriteTrackImpl
    with DiagnosticableTreeMixin
    implements UpdateFavoriteTrack {
  const _$UpdateFavoriteTrackImpl(
      {required this.track,
      required this.tempImageUrl,
      required this.isFavorite});

  @override
  final Track track;
  @override
  final String tempImageUrl;
  @override
  final bool isFavorite;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackEvent.updateFavoriteTrack(track: $track, tempImageUrl: $tempImageUrl, isFavorite: $isFavorite)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackEvent.updateFavoriteTrack'))
      ..add(DiagnosticsProperty('track', track))
      ..add(DiagnosticsProperty('tempImageUrl', tempImageUrl))
      ..add(DiagnosticsProperty('isFavorite', isFavorite));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFavoriteTrackImpl &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.tempImageUrl, tempImageUrl) ||
                other.tempImageUrl == tempImageUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, track, tempImageUrl, isFavorite);

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFavoriteTrackImplCopyWith<_$UpdateFavoriteTrackImpl> get copyWith =>
      __$$UpdateFavoriteTrackImplCopyWithImpl<_$UpdateFavoriteTrackImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTrack,
    required TResult Function(Track track, String tempImageUrl, bool isFavorite)
        updateFavoriteTrack,
    required TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)
        saveAllTracks,
  }) {
    return updateFavoriteTrack(track, tempImageUrl, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
    TResult? Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult? Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
  }) {
    return updateFavoriteTrack?.call(track, tempImageUrl, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
    TResult Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
    required TResult orElse(),
  }) {
    if (updateFavoriteTrack != null) {
      return updateFavoriteTrack(track, tempImageUrl, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrack value) loadTrack,
    required TResult Function(UpdateFavoriteTrack value) updateFavoriteTrack,
    required TResult Function(SavedAllTracks value) saveAllTracks,
  }) {
    return updateFavoriteTrack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
    TResult? Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult? Function(SavedAllTracks value)? saveAllTracks,
  }) {
    return updateFavoriteTrack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
    TResult Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult Function(SavedAllTracks value)? saveAllTracks,
    required TResult orElse(),
  }) {
    if (updateFavoriteTrack != null) {
      return updateFavoriteTrack(this);
    }
    return orElse();
  }
}

abstract class UpdateFavoriteTrack implements TrackEvent {
  const factory UpdateFavoriteTrack(
      {required final Track track,
      required final String tempImageUrl,
      required final bool isFavorite}) = _$UpdateFavoriteTrackImpl;

  Track get track;
  String get tempImageUrl;
  bool get isFavorite;

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFavoriteTrackImplCopyWith<_$UpdateFavoriteTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedAllTracksImplCopyWith<$Res> {
  factory _$$SavedAllTracksImplCopyWith(_$SavedAllTracksImpl value,
          $Res Function(_$SavedAllTracksImpl) then) =
      __$$SavedAllTracksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SaveCategoryDto saveCategory, List<Track> tracks});
}

/// @nodoc
class __$$SavedAllTracksImplCopyWithImpl<$Res>
    extends _$TrackEventCopyWithImpl<$Res, _$SavedAllTracksImpl>
    implements _$$SavedAllTracksImplCopyWith<$Res> {
  __$$SavedAllTracksImplCopyWithImpl(
      _$SavedAllTracksImpl _value, $Res Function(_$SavedAllTracksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveCategory = null,
    Object? tracks = null,
  }) {
    return _then(_$SavedAllTracksImpl(
      saveCategory: null == saveCategory
          ? _value.saveCategory
          : saveCategory // ignore: cast_nullable_to_non_nullable
              as SaveCategoryDto,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ));
  }
}

/// @nodoc

class _$SavedAllTracksImpl
    with DiagnosticableTreeMixin
    implements SavedAllTracks {
  const _$SavedAllTracksImpl(
      {required this.saveCategory, required final List<Track> tracks})
      : _tracks = tracks;

  @override
  final SaveCategoryDto saveCategory;
  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackEvent.saveAllTracks(saveCategory: $saveCategory, tracks: $tracks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackEvent.saveAllTracks'))
      ..add(DiagnosticsProperty('saveCategory', saveCategory))
      ..add(DiagnosticsProperty('tracks', tracks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedAllTracksImpl &&
            (identical(other.saveCategory, saveCategory) ||
                other.saveCategory == saveCategory) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saveCategory, const DeepCollectionEquality().hash(_tracks));

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedAllTracksImplCopyWith<_$SavedAllTracksImpl> get copyWith =>
      __$$SavedAllTracksImplCopyWithImpl<_$SavedAllTracksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTrack,
    required TResult Function(Track track, String tempImageUrl, bool isFavorite)
        updateFavoriteTrack,
    required TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)
        saveAllTracks,
  }) {
    return saveAllTracks(saveCategory, tracks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
    TResult? Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult? Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
  }) {
    return saveAllTracks?.call(saveCategory, tracks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
    TResult Function(Track track, String tempImageUrl, bool isFavorite)?
        updateFavoriteTrack,
    TResult Function(SaveCategoryDto saveCategory, List<Track> tracks)?
        saveAllTracks,
    required TResult orElse(),
  }) {
    if (saveAllTracks != null) {
      return saveAllTracks(saveCategory, tracks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrack value) loadTrack,
    required TResult Function(UpdateFavoriteTrack value) updateFavoriteTrack,
    required TResult Function(SavedAllTracks value) saveAllTracks,
  }) {
    return saveAllTracks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
    TResult? Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult? Function(SavedAllTracks value)? saveAllTracks,
  }) {
    return saveAllTracks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
    TResult Function(UpdateFavoriteTrack value)? updateFavoriteTrack,
    TResult Function(SavedAllTracks value)? saveAllTracks,
    required TResult orElse(),
  }) {
    if (saveAllTracks != null) {
      return saveAllTracks(this);
    }
    return orElse();
  }
}

abstract class SavedAllTracks implements TrackEvent {
  const factory SavedAllTracks(
      {required final SaveCategoryDto saveCategory,
      required final List<Track> tracks}) = _$SavedAllTracksImpl;

  SaveCategoryDto get saveCategory;
  List<Track> get tracks;

  /// Create a copy of TrackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedAllTracksImplCopyWith<_$SavedAllTracksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks, bool isDownloaded) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrack value) initial,
    required TResult Function(_LoadingTrack value) loading,
    required TResult Function(_LoadedTrack value) loaded,
    required TResult Function(_ErrorTrack value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrack value)? initial,
    TResult? Function(_LoadingTrack value)? loading,
    TResult? Function(_LoadedTrack value)? loaded,
    TResult? Function(_ErrorTrack value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrack value)? initial,
    TResult Function(_LoadingTrack value)? loading,
    TResult Function(_LoadedTrack value)? loaded,
    TResult Function(_ErrorTrack value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackStateCopyWith<$Res> {
  factory $TrackStateCopyWith(
          TrackState value, $Res Function(TrackState) then) =
      _$TrackStateCopyWithImpl<$Res, TrackState>;
}

/// @nodoc
class _$TrackStateCopyWithImpl<$Res, $Val extends TrackState>
    implements $TrackStateCopyWith<$Res> {
  _$TrackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialTrackImplCopyWith<$Res> {
  factory _$$InitialTrackImplCopyWith(
          _$InitialTrackImpl value, $Res Function(_$InitialTrackImpl) then) =
      __$$InitialTrackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialTrackImplCopyWithImpl<$Res>
    extends _$TrackStateCopyWithImpl<$Res, _$InitialTrackImpl>
    implements _$$InitialTrackImplCopyWith<$Res> {
  __$$InitialTrackImplCopyWithImpl(
      _$InitialTrackImpl _value, $Res Function(_$InitialTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialTrackImpl with DiagnosticableTreeMixin implements _InitialTrack {
  const _$InitialTrackImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialTrackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks, bool isDownloaded) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrack value) initial,
    required TResult Function(_LoadingTrack value) loading,
    required TResult Function(_LoadedTrack value) loaded,
    required TResult Function(_ErrorTrack value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrack value)? initial,
    TResult? Function(_LoadingTrack value)? loading,
    TResult? Function(_LoadedTrack value)? loaded,
    TResult? Function(_ErrorTrack value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrack value)? initial,
    TResult Function(_LoadingTrack value)? loading,
    TResult Function(_LoadedTrack value)? loaded,
    TResult Function(_ErrorTrack value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialTrack implements TrackState {
  const factory _InitialTrack() = _$InitialTrackImpl;
}

/// @nodoc
abstract class _$$LoadingTrackImplCopyWith<$Res> {
  factory _$$LoadingTrackImplCopyWith(
          _$LoadingTrackImpl value, $Res Function(_$LoadingTrackImpl) then) =
      __$$LoadingTrackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTrackImplCopyWithImpl<$Res>
    extends _$TrackStateCopyWithImpl<$Res, _$LoadingTrackImpl>
    implements _$$LoadingTrackImplCopyWith<$Res> {
  __$$LoadingTrackImplCopyWithImpl(
      _$LoadingTrackImpl _value, $Res Function(_$LoadingTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingTrackImpl with DiagnosticableTreeMixin implements _LoadingTrack {
  const _$LoadingTrackImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingTrackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks, bool isDownloaded) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrack value) initial,
    required TResult Function(_LoadingTrack value) loading,
    required TResult Function(_LoadedTrack value) loaded,
    required TResult Function(_ErrorTrack value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrack value)? initial,
    TResult? Function(_LoadingTrack value)? loading,
    TResult? Function(_LoadedTrack value)? loaded,
    TResult? Function(_ErrorTrack value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrack value)? initial,
    TResult Function(_LoadingTrack value)? loading,
    TResult Function(_LoadedTrack value)? loaded,
    TResult Function(_ErrorTrack value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingTrack implements TrackState {
  const factory _LoadingTrack() = _$LoadingTrackImpl;
}

/// @nodoc
abstract class _$$LoadedTrackImplCopyWith<$Res> {
  factory _$$LoadedTrackImplCopyWith(
          _$LoadedTrackImpl value, $Res Function(_$LoadedTrackImpl) then) =
      __$$LoadedTrackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Track> tracks, bool isDownloaded});
}

/// @nodoc
class __$$LoadedTrackImplCopyWithImpl<$Res>
    extends _$TrackStateCopyWithImpl<$Res, _$LoadedTrackImpl>
    implements _$$LoadedTrackImplCopyWith<$Res> {
  __$$LoadedTrackImplCopyWithImpl(
      _$LoadedTrackImpl _value, $Res Function(_$LoadedTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
    Object? isDownloaded = null,
  }) {
    return _then(_$LoadedTrackImpl(
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      isDownloaded: null == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedTrackImpl with DiagnosticableTreeMixin implements _LoadedTrack {
  const _$LoadedTrackImpl(
      {required final List<Track> tracks, required this.isDownloaded})
      : _tracks = tracks;

  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  final bool isDownloaded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackState.loaded(tracks: $tracks, isDownloaded: $isDownloaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackState.loaded'))
      ..add(DiagnosticsProperty('tracks', tracks))
      ..add(DiagnosticsProperty('isDownloaded', isDownloaded));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTrackImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tracks), isDownloaded);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedTrackImplCopyWith<_$LoadedTrackImpl> get copyWith =>
      __$$LoadedTrackImplCopyWithImpl<_$LoadedTrackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks, bool isDownloaded) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tracks, isDownloaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tracks, isDownloaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tracks, isDownloaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrack value) initial,
    required TResult Function(_LoadingTrack value) loading,
    required TResult Function(_LoadedTrack value) loaded,
    required TResult Function(_ErrorTrack value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrack value)? initial,
    TResult? Function(_LoadingTrack value)? loading,
    TResult? Function(_LoadedTrack value)? loaded,
    TResult? Function(_ErrorTrack value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrack value)? initial,
    TResult Function(_LoadingTrack value)? loading,
    TResult Function(_LoadedTrack value)? loaded,
    TResult Function(_ErrorTrack value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedTrack implements TrackState {
  const factory _LoadedTrack(
      {required final List<Track> tracks,
      required final bool isDownloaded}) = _$LoadedTrackImpl;

  List<Track> get tracks;
  bool get isDownloaded;

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedTrackImplCopyWith<_$LoadedTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorTrackImplCopyWith<$Res> {
  factory _$$ErrorTrackImplCopyWith(
          _$ErrorTrackImpl value, $Res Function(_$ErrorTrackImpl) then) =
      __$$ErrorTrackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorTrackImplCopyWithImpl<$Res>
    extends _$TrackStateCopyWithImpl<$Res, _$ErrorTrackImpl>
    implements _$$ErrorTrackImplCopyWith<$Res> {
  __$$ErrorTrackImplCopyWithImpl(
      _$ErrorTrackImpl _value, $Res Function(_$ErrorTrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorTrackImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorTrackImpl with DiagnosticableTreeMixin implements _ErrorTrack {
  const _$ErrorTrackImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorTrackImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorTrackImplCopyWith<_$ErrorTrackImpl> get copyWith =>
      __$$ErrorTrackImplCopyWithImpl<_$ErrorTrackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks, bool isDownloaded) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks, bool isDownloaded)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrack value) initial,
    required TResult Function(_LoadingTrack value) loading,
    required TResult Function(_LoadedTrack value) loaded,
    required TResult Function(_ErrorTrack value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrack value)? initial,
    TResult? Function(_LoadingTrack value)? loading,
    TResult? Function(_LoadedTrack value)? loaded,
    TResult? Function(_ErrorTrack value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrack value)? initial,
    TResult Function(_LoadingTrack value)? loading,
    TResult Function(_LoadedTrack value)? loaded,
    TResult Function(_ErrorTrack value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorTrack implements TrackState {
  const factory _ErrorTrack({required final String message}) = _$ErrorTrackImpl;

  String get message;

  /// Create a copy of TrackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorTrackImplCopyWith<_$ErrorTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
