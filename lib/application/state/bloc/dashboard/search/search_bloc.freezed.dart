// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadedSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedSearch value) loadedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedSearch value)? loadedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedSearch value)? loadedSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadedSearchImplCopyWith<$Res> {
  factory _$$LoadedSearchImplCopyWith(
          _$LoadedSearchImpl value, $Res Function(_$LoadedSearchImpl) then) =
      __$$LoadedSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedSearchImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadedSearchImpl>
    implements _$$LoadedSearchImplCopyWith<$Res> {
  __$$LoadedSearchImplCopyWithImpl(
      _$LoadedSearchImpl _value, $Res Function(_$LoadedSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadedSearchImpl implements LoadedSearch {
  const _$LoadedSearchImpl();

  @override
  String toString() {
    return 'SearchEvent.loadedSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadedSearch,
  }) {
    return loadedSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadedSearch,
  }) {
    return loadedSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadedSearch,
    required TResult orElse(),
  }) {
    if (loadedSearch != null) {
      return loadedSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedSearch value) loadedSearch,
  }) {
    return loadedSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedSearch value)? loadedSearch,
  }) {
    return loadedSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedSearch value)? loadedSearch,
    required TResult orElse(),
  }) {
    if (loadedSearch != null) {
      return loadedSearch(this);
    }
    return orElse();
  }
}

abstract class LoadedSearch implements SearchEvent {
  const factory LoadedSearch() = _$LoadedSearchImpl;
}

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$SearchLoading value) loading,
    required TResult Function(_$SearchLoaded value) loaded,
    required TResult Function(_$SearchError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$SearchLoading value)? loading,
    TResult? Function(_$SearchLoaded value)? loaded,
    TResult? Function(_$SearchError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$SearchLoading value)? loading,
    TResult Function(_$SearchLoaded value)? loaded,
    TResult Function(_$SearchError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$$SearchLoadingImplCopyWith<$Res> {
  factory _$$$SearchLoadingImplCopyWith(_$$SearchLoadingImpl value,
          $Res Function(_$$SearchLoadingImpl) then) =
      __$$$SearchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$$SearchLoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$$SearchLoadingImpl>
    implements _$$$SearchLoadingImplCopyWith<$Res> {
  __$$$SearchLoadingImplCopyWithImpl(
      _$$SearchLoadingImpl _value, $Res Function(_$$SearchLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$$SearchLoadingImpl implements _$SearchLoading {
  const _$$SearchLoadingImpl();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$$SearchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loaded,
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
    required TResult Function(_$SearchLoading value) loading,
    required TResult Function(_$SearchLoaded value) loaded,
    required TResult Function(_$SearchError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$SearchLoading value)? loading,
    TResult? Function(_$SearchLoaded value)? loaded,
    TResult? Function(_$SearchError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$SearchLoading value)? loading,
    TResult Function(_$SearchLoaded value)? loaded,
    TResult Function(_$SearchError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _$SearchLoading implements SearchState {
  const factory _$SearchLoading() = _$$SearchLoadingImpl;
}

/// @nodoc
abstract class _$$$SearchLoadedImplCopyWith<$Res> {
  factory _$$$SearchLoadedImplCopyWith(
          _$$SearchLoadedImpl value, $Res Function(_$$SearchLoadedImpl) then) =
      __$$$SearchLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$$SearchLoadedImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$$SearchLoadedImpl>
    implements _$$$SearchLoadedImplCopyWith<$Res> {
  __$$$SearchLoadedImplCopyWithImpl(
      _$$SearchLoadedImpl _value, $Res Function(_$$SearchLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$$SearchLoadedImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$$SearchLoadedImpl implements _$SearchLoaded {
  const _$$SearchLoadedImpl({required final List<Category> categories})
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'SearchState.loaded(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$SearchLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$SearchLoadedImplCopyWith<_$$SearchLoadedImpl> get copyWith =>
      __$$$SearchLoadedImplCopyWithImpl<_$$SearchLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$SearchLoading value) loading,
    required TResult Function(_$SearchLoaded value) loaded,
    required TResult Function(_$SearchError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$SearchLoading value)? loading,
    TResult? Function(_$SearchLoaded value)? loaded,
    TResult? Function(_$SearchError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$SearchLoading value)? loading,
    TResult Function(_$SearchLoaded value)? loaded,
    TResult Function(_$SearchError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _$SearchLoaded implements SearchState {
  const factory _$SearchLoaded({required final List<Category> categories}) =
      _$$SearchLoadedImpl;

  List<Category> get categories;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$SearchLoadedImplCopyWith<_$$SearchLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$SearchErrorImplCopyWith<$Res> {
  factory _$$$SearchErrorImplCopyWith(
          _$$SearchErrorImpl value, $Res Function(_$$SearchErrorImpl) then) =
      __$$$SearchErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$$SearchErrorImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$$SearchErrorImpl>
    implements _$$$SearchErrorImplCopyWith<$Res> {
  __$$$SearchErrorImplCopyWithImpl(
      _$$SearchErrorImpl _value, $Res Function(_$$SearchErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$$SearchErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$$SearchErrorImpl implements _$SearchError {
  const _$$SearchErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SearchState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$SearchErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$SearchErrorImplCopyWith<_$$SearchErrorImpl> get copyWith =>
      __$$$SearchErrorImplCopyWithImpl<_$$SearchErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loaded,
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
    required TResult Function(_$SearchLoading value) loading,
    required TResult Function(_$SearchLoaded value) loaded,
    required TResult Function(_$SearchError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$SearchLoading value)? loading,
    TResult? Function(_$SearchLoaded value)? loaded,
    TResult? Function(_$SearchError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$SearchLoading value)? loading,
    TResult Function(_$SearchLoaded value)? loaded,
    TResult Function(_$SearchError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _$SearchError implements SearchState {
  const factory _$SearchError({required final String message}) =
      _$$SearchErrorImpl;

  String get message;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$SearchErrorImplCopyWith<_$$SearchErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
