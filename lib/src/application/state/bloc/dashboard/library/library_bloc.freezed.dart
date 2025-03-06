// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadLibrary,
    required TResult Function(TrackParam track) navigateToTrackListPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadLibrary,
    TResult? Function(TrackParam track)? navigateToTrackListPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadLibrary,
    TResult Function(TrackParam track)? navigateToTrackListPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadLibrary value) loadLibrary,
    required TResult Function(NavigateToTrackListPage value)
        navigateToTrackListPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadLibrary value)? loadLibrary,
    TResult? Function(NavigateToTrackListPage value)? navigateToTrackListPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadLibrary value)? loadLibrary,
    TResult Function(NavigateToTrackListPage value)? navigateToTrackListPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryEventCopyWith<$Res> {
  factory $LibraryEventCopyWith(
          LibraryEvent value, $Res Function(LibraryEvent) then) =
      _$LibraryEventCopyWithImpl<$Res, LibraryEvent>;
}

/// @nodoc
class _$LibraryEventCopyWithImpl<$Res, $Val extends LibraryEvent>
    implements $LibraryEventCopyWith<$Res> {
  _$LibraryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadLibraryImplCopyWith<$Res> {
  factory _$$LoadLibraryImplCopyWith(
          _$LoadLibraryImpl value, $Res Function(_$LoadLibraryImpl) then) =
      __$$LoadLibraryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadLibraryImplCopyWithImpl<$Res>
    extends _$LibraryEventCopyWithImpl<$Res, _$LoadLibraryImpl>
    implements _$$LoadLibraryImplCopyWith<$Res> {
  __$$LoadLibraryImplCopyWithImpl(
      _$LoadLibraryImpl _value, $Res Function(_$LoadLibraryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadLibraryImpl implements _LoadLibrary {
  const _$LoadLibraryImpl();

  @override
  String toString() {
    return 'LibraryEvent.loadLibrary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadLibraryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadLibrary,
    required TResult Function(TrackParam track) navigateToTrackListPage,
  }) {
    return loadLibrary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadLibrary,
    TResult? Function(TrackParam track)? navigateToTrackListPage,
  }) {
    return loadLibrary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadLibrary,
    TResult Function(TrackParam track)? navigateToTrackListPage,
    required TResult orElse(),
  }) {
    if (loadLibrary != null) {
      return loadLibrary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadLibrary value) loadLibrary,
    required TResult Function(NavigateToTrackListPage value)
        navigateToTrackListPage,
  }) {
    return loadLibrary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadLibrary value)? loadLibrary,
    TResult? Function(NavigateToTrackListPage value)? navigateToTrackListPage,
  }) {
    return loadLibrary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadLibrary value)? loadLibrary,
    TResult Function(NavigateToTrackListPage value)? navigateToTrackListPage,
    required TResult orElse(),
  }) {
    if (loadLibrary != null) {
      return loadLibrary(this);
    }
    return orElse();
  }
}

abstract class _LoadLibrary implements LibraryEvent {
  const factory _LoadLibrary() = _$LoadLibraryImpl;
}

/// @nodoc
abstract class _$$NavigateToTrackListPageImplCopyWith<$Res> {
  factory _$$NavigateToTrackListPageImplCopyWith(
          _$NavigateToTrackListPageImpl value,
          $Res Function(_$NavigateToTrackListPageImpl) then) =
      __$$NavigateToTrackListPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TrackParam track});
}

/// @nodoc
class __$$NavigateToTrackListPageImplCopyWithImpl<$Res>
    extends _$LibraryEventCopyWithImpl<$Res, _$NavigateToTrackListPageImpl>
    implements _$$NavigateToTrackListPageImplCopyWith<$Res> {
  __$$NavigateToTrackListPageImplCopyWithImpl(
      _$NavigateToTrackListPageImpl _value,
      $Res Function(_$NavigateToTrackListPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = freezed,
  }) {
    return _then(_$NavigateToTrackListPageImpl(
      freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as TrackParam,
    ));
  }
}

/// @nodoc

class _$NavigateToTrackListPageImpl implements NavigateToTrackListPage {
  const _$NavigateToTrackListPageImpl(this.track);

  @override
  final TrackParam track;

  @override
  String toString() {
    return 'LibraryEvent.navigateToTrackListPage(track: $track)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToTrackListPageImpl &&
            const DeepCollectionEquality().equals(other.track, track));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(track));

  /// Create a copy of LibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateToTrackListPageImplCopyWith<_$NavigateToTrackListPageImpl>
      get copyWith => __$$NavigateToTrackListPageImplCopyWithImpl<
          _$NavigateToTrackListPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadLibrary,
    required TResult Function(TrackParam track) navigateToTrackListPage,
  }) {
    return navigateToTrackListPage(track);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadLibrary,
    TResult? Function(TrackParam track)? navigateToTrackListPage,
  }) {
    return navigateToTrackListPage?.call(track);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadLibrary,
    TResult Function(TrackParam track)? navigateToTrackListPage,
    required TResult orElse(),
  }) {
    if (navigateToTrackListPage != null) {
      return navigateToTrackListPage(track);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadLibrary value) loadLibrary,
    required TResult Function(NavigateToTrackListPage value)
        navigateToTrackListPage,
  }) {
    return navigateToTrackListPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadLibrary value)? loadLibrary,
    TResult? Function(NavigateToTrackListPage value)? navigateToTrackListPage,
  }) {
    return navigateToTrackListPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadLibrary value)? loadLibrary,
    TResult Function(NavigateToTrackListPage value)? navigateToTrackListPage,
    required TResult orElse(),
  }) {
    if (navigateToTrackListPage != null) {
      return navigateToTrackListPage(this);
    }
    return orElse();
  }
}

abstract class NavigateToTrackListPage implements LibraryEvent {
  const factory NavigateToTrackListPage(final TrackParam track) =
      _$NavigateToTrackListPageImpl;

  TrackParam get track;

  /// Create a copy of LibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigateToTrackListPageImplCopyWith<_$NavigateToTrackListPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LibraryState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  List<Downloads> get saveCategories => throw _privateConstructorUsedError;
  LibraryEvent get event => throw _privateConstructorUsedError;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryStateCopyWith<LibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
          LibraryState value, $Res Function(LibraryState) then) =
      _$LibraryStateCopyWithImpl<$Res, LibraryState>;
  @useResult
  $Res call(
      {bool isLoading,
      String error,
      List<Downloads> saveCategories,
      LibraryEvent event});

  $LibraryEventCopyWith<$Res> get event;
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? saveCategories = null,
    Object? event = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      saveCategories: null == saveCategories
          ? _value.saveCategories
          : saveCategories // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as LibraryEvent,
    ) as $Val);
  }

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LibraryEventCopyWith<$Res> get event {
    return $LibraryEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LibraryStateImplCopyWith<$Res>
    implements $LibraryStateCopyWith<$Res> {
  factory _$$LibraryStateImplCopyWith(
          _$LibraryStateImpl value, $Res Function(_$LibraryStateImpl) then) =
      __$$LibraryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String error,
      List<Downloads> saveCategories,
      LibraryEvent event});

  @override
  $LibraryEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$LibraryStateImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryStateImpl>
    implements _$$LibraryStateImplCopyWith<$Res> {
  __$$LibraryStateImplCopyWithImpl(
      _$LibraryStateImpl _value, $Res Function(_$LibraryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? saveCategories = null,
    Object? event = null,
  }) {
    return _then(_$LibraryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      saveCategories: null == saveCategories
          ? _value._saveCategories
          : saveCategories // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as LibraryEvent,
    ));
  }
}

/// @nodoc

class _$LibraryStateImpl implements _LibraryState {
  const _$LibraryStateImpl(
      {required this.isLoading,
      required this.error,
      required final List<Downloads> saveCategories,
      required this.event})
      : _saveCategories = saveCategories;

  @override
  final bool isLoading;
  @override
  final String error;
  final List<Downloads> _saveCategories;
  @override
  List<Downloads> get saveCategories {
    if (_saveCategories is EqualUnmodifiableListView) return _saveCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saveCategories);
  }

  @override
  final LibraryEvent event;

  @override
  String toString() {
    return 'LibraryState(isLoading: $isLoading, error: $error, saveCategories: $saveCategories, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._saveCategories, _saveCategories) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_saveCategories), event);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      __$$LibraryStateImplCopyWithImpl<_$LibraryStateImpl>(this, _$identity);
}

abstract class _LibraryState implements LibraryState {
  const factory _LibraryState(
      {required final bool isLoading,
      required final String error,
      required final List<Downloads> saveCategories,
      required final LibraryEvent event}) = _$LibraryStateImpl;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  List<Downloads> get saveCategories;
  @override
  LibraryEvent get event;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
