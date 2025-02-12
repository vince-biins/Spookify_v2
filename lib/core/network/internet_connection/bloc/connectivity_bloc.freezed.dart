// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectivityEvent {
  List<ConnectivityResult> get result => throw _privateConstructorUsedError;
  bool get hasInternetConnection => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConnectivityResult> result, bool hasInternetConnection)
        changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<ConnectivityResult> result, bool hasInternetConnection)?
        changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConnectivityResult> result, bool hasInternetConnection)?
        changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangedConnectivity value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangedConnectivity value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangedConnectivity value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectivityEventCopyWith<ConnectivityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityEventCopyWith<$Res> {
  factory $ConnectivityEventCopyWith(
          ConnectivityEvent value, $Res Function(ConnectivityEvent) then) =
      _$ConnectivityEventCopyWithImpl<$Res, ConnectivityEvent>;
  @useResult
  $Res call({List<ConnectivityResult> result, bool hasInternetConnection});
}

/// @nodoc
class _$ConnectivityEventCopyWithImpl<$Res, $Val extends ConnectivityEvent>
    implements $ConnectivityEventCopyWith<$Res> {
  _$ConnectivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? hasInternetConnection = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ConnectivityResult>,
      hasInternetConnection: null == hasInternetConnection
          ? _value.hasInternetConnection
          : hasInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangedConnectivityImplCopyWith<$Res>
    implements $ConnectivityEventCopyWith<$Res> {
  factory _$$ChangedConnectivityImplCopyWith(_$ChangedConnectivityImpl value,
          $Res Function(_$ChangedConnectivityImpl) then) =
      __$$ChangedConnectivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ConnectivityResult> result, bool hasInternetConnection});
}

/// @nodoc
class __$$ChangedConnectivityImplCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$ChangedConnectivityImpl>
    implements _$$ChangedConnectivityImplCopyWith<$Res> {
  __$$ChangedConnectivityImplCopyWithImpl(_$ChangedConnectivityImpl _value,
      $Res Function(_$ChangedConnectivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? hasInternetConnection = null,
  }) {
    return _then(_$ChangedConnectivityImpl(
      null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ConnectivityResult>,
      null == hasInternetConnection
          ? _value.hasInternetConnection
          : hasInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangedConnectivityImpl implements ChangedConnectivity {
  const _$ChangedConnectivityImpl(
      final List<ConnectivityResult> result, this.hasInternetConnection)
      : _result = result;

  final List<ConnectivityResult> _result;
  @override
  List<ConnectivityResult> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final bool hasInternetConnection;

  @override
  String toString() {
    return 'ConnectivityEvent.changed(result: $result, hasInternetConnection: $hasInternetConnection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangedConnectivityImpl &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.hasInternetConnection, hasInternetConnection) ||
                other.hasInternetConnection == hasInternetConnection));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_result), hasInternetConnection);

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangedConnectivityImplCopyWith<_$ChangedConnectivityImpl> get copyWith =>
      __$$ChangedConnectivityImplCopyWithImpl<_$ChangedConnectivityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConnectivityResult> result, bool hasInternetConnection)
        changed,
  }) {
    return changed(result, hasInternetConnection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<ConnectivityResult> result, bool hasInternetConnection)?
        changed,
  }) {
    return changed?.call(result, hasInternetConnection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConnectivityResult> result, bool hasInternetConnection)?
        changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(result, hasInternetConnection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangedConnectivity value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangedConnectivity value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangedConnectivity value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class ChangedConnectivity implements ConnectivityEvent {
  const factory ChangedConnectivity(final List<ConnectivityResult> result,
      final bool hasInternetConnection) = _$ChangedConnectivityImpl;

  @override
  List<ConnectivityResult> get result;
  @override
  bool get hasInternetConnection;

  /// Create a copy of ConnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangedConnectivityImplCopyWith<_$ChangedConnectivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConnectivityState {
  bool get isLoading => throw _privateConstructorUsedError;
  ConnectivityStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of ConnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectivityStateCopyWith<ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res, ConnectivityState>;
  @useResult
  $Res call({bool isLoading, ConnectivityStatus status});
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res, $Val extends ConnectivityState>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectivityStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectivityStateImplCopyWith<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  factory _$$ConnectivityStateImplCopyWith(_$ConnectivityStateImpl value,
          $Res Function(_$ConnectivityStateImpl) then) =
      __$$ConnectivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, ConnectivityStatus status});
}

/// @nodoc
class __$$ConnectivityStateImplCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res, _$ConnectivityStateImpl>
    implements _$$ConnectivityStateImplCopyWith<$Res> {
  __$$ConnectivityStateImplCopyWithImpl(_$ConnectivityStateImpl _value,
      $Res Function(_$ConnectivityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? status = null,
  }) {
    return _then(_$ConnectivityStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectivityStatus,
    ));
  }
}

/// @nodoc

class _$ConnectivityStateImpl implements _ConnectivityState {
  const _$ConnectivityStateImpl(
      {required this.isLoading, required this.status});

  @override
  final bool isLoading;
  @override
  final ConnectivityStatus status;

  @override
  String toString() {
    return 'ConnectivityState(isLoading: $isLoading, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, status);

  /// Create a copy of ConnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityStateImplCopyWith<_$ConnectivityStateImpl> get copyWith =>
      __$$ConnectivityStateImplCopyWithImpl<_$ConnectivityStateImpl>(
          this, _$identity);
}

abstract class _ConnectivityState implements ConnectivityState {
  const factory _ConnectivityState(
      {required final bool isLoading,
      required final ConnectivityStatus status}) = _$ConnectivityStateImpl;

  @override
  bool get isLoading;
  @override
  ConnectivityStatus get status;

  /// Create a copy of ConnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectivityStateImplCopyWith<_$ConnectivityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
