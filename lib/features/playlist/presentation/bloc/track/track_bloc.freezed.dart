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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTrack value) loadTrack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
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

class _$LoadTrackImpl implements LoadTrack {
  const _$LoadTrackImpl();

  @override
  String toString() {
    return 'TrackEvent.loadTrack()';
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
  }) {
    return loadTrack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTrack,
  }) {
    return loadTrack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTrack,
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
  }) {
    return loadTrack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTrack value)? loadTrack,
  }) {
    return loadTrack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTrack value)? loadTrack,
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
mixin _$TrackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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

class _$InitialTrackImpl implements _InitialTrack {
  const _$InitialTrackImpl();

  @override
  String toString() {
    return 'TrackState.initial()';
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
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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

class _$LoadingTrackImpl implements _LoadingTrack {
  const _$LoadingTrackImpl();

  @override
  String toString() {
    return 'TrackState.loading()';
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
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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
  $Res call({List<Track> tracks});
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
  }) {
    return _then(_$LoadedTrackImpl(
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ));
  }
}

/// @nodoc

class _$LoadedTrackImpl implements _LoadedTrack {
  const _$LoadedTrackImpl({required final List<Track> tracks})
      : _tracks = tracks;

  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString() {
    return 'TrackState.loaded(tracks: $tracks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTrackImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tracks));

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
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tracks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tracks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tracks);
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
  const factory _LoadedTrack({required final List<Track> tracks}) =
      _$LoadedTrackImpl;

  List<Track> get tracks;

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

class _$ErrorTrackImpl implements _ErrorTrack {
  const _$ErrorTrackImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TrackState.error(message: $message)';
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
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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
