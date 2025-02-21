// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  Track get track => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get prevId => throw _privateConstructorUsedError;
  String get currId => throw _privateConstructorUsedError;
  String get nextId => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isPlaying,
      Track track,
      String error,
      String prevId,
      String currId,
      String nextId,
      bool hasNext});
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPlaying = null,
    Object? track = null,
    Object? error = null,
    Object? prevId = null,
    Object? currId = null,
    Object? nextId = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as Track,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      prevId: null == prevId
          ? _value.prevId
          : prevId // ignore: cast_nullable_to_non_nullable
              as String,
      currId: null == currId
          ? _value.currId
          : currId // ignore: cast_nullable_to_non_nullable
              as String,
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as String,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStateImplCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$PlayerStateImplCopyWith(
          _$PlayerStateImpl value, $Res Function(_$PlayerStateImpl) then) =
      __$$PlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isPlaying,
      Track track,
      String error,
      String prevId,
      String currId,
      String nextId,
      bool hasNext});
}

/// @nodoc
class __$$PlayerStateImplCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$PlayerStateImpl>
    implements _$$PlayerStateImplCopyWith<$Res> {
  __$$PlayerStateImplCopyWithImpl(
      _$PlayerStateImpl _value, $Res Function(_$PlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPlaying = null,
    Object? track = null,
    Object? error = null,
    Object? prevId = null,
    Object? currId = null,
    Object? nextId = null,
    Object? hasNext = null,
  }) {
    return _then(_$PlayerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as Track,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      prevId: null == prevId
          ? _value.prevId
          : prevId // ignore: cast_nullable_to_non_nullable
              as String,
      currId: null == currId
          ? _value.currId
          : currId // ignore: cast_nullable_to_non_nullable
              as String,
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as String,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerStateImpl implements _PlayerState {
  const _$PlayerStateImpl(
      {required this.isLoading,
      required this.isPlaying,
      required this.track,
      required this.error,
      required this.prevId,
      required this.currId,
      required this.nextId,
      required this.hasNext});

  @override
  final bool isLoading;
  @override
  final bool isPlaying;
  @override
  final Track track;
  @override
  final String error;
  @override
  final String prevId;
  @override
  final String currId;
  @override
  final String nextId;
  @override
  final bool hasNext;

  @override
  String toString() {
    return 'PlayerState(isLoading: $isLoading, isPlaying: $isPlaying, track: $track, error: $error, prevId: $prevId, currId: $currId, nextId: $nextId, hasNext: $hasNext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.prevId, prevId) || other.prevId == prevId) &&
            (identical(other.currId, currId) || other.currId == currId) &&
            (identical(other.nextId, nextId) || other.nextId == nextId) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isPlaying, track,
      error, prevId, currId, nextId, hasNext);

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      __$$PlayerStateImplCopyWithImpl<_$PlayerStateImpl>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required final bool isLoading,
      required final bool isPlaying,
      required final Track track,
      required final String error,
      required final String prevId,
      required final String currId,
      required final String nextId,
      required final bool hasNext}) = _$PlayerStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isPlaying;
  @override
  Track get track;
  @override
  String get error;
  @override
  String get prevId;
  @override
  String get currId;
  @override
  String get nextId;
  @override
  bool get hasNext;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
