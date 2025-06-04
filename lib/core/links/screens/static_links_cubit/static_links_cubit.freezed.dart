// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'static_links_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaticLinksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Link> filteredLinks) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Link> filteredLinks)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Link> filteredLinks)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StaticLinkLoading value) loading,
    required TResult Function(StaticLinkDataLoaded value) loaded,
    required TResult Function(StaticLinkError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StaticLinkLoading value)? loading,
    TResult? Function(StaticLinkDataLoaded value)? loaded,
    TResult? Function(StaticLinkError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StaticLinkLoading value)? loading,
    TResult Function(StaticLinkDataLoaded value)? loaded,
    TResult Function(StaticLinkError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaticLinksStateCopyWith<$Res> {
  factory $StaticLinksStateCopyWith(
          StaticLinksState value, $Res Function(StaticLinksState) then) =
      _$StaticLinksStateCopyWithImpl<$Res, StaticLinksState>;
}

/// @nodoc
class _$StaticLinksStateCopyWithImpl<$Res, $Val extends StaticLinksState>
    implements $StaticLinksStateCopyWith<$Res> {
  _$StaticLinksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StaticLinkLoadingImplCopyWith<$Res> {
  factory _$$StaticLinkLoadingImplCopyWith(_$StaticLinkLoadingImpl value,
          $Res Function(_$StaticLinkLoadingImpl) then) =
      __$$StaticLinkLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StaticLinkLoadingImplCopyWithImpl<$Res>
    extends _$StaticLinksStateCopyWithImpl<$Res, _$StaticLinkLoadingImpl>
    implements _$$StaticLinkLoadingImplCopyWith<$Res> {
  __$$StaticLinkLoadingImplCopyWithImpl(_$StaticLinkLoadingImpl _value,
      $Res Function(_$StaticLinkLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StaticLinkLoadingImpl implements StaticLinkLoading {
  const _$StaticLinkLoadingImpl();

  @override
  String toString() {
    return 'StaticLinksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StaticLinkLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Link> filteredLinks) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Link> filteredLinks)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Link> filteredLinks)? loaded,
    TResult Function()? error,
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
    required TResult Function(StaticLinkLoading value) loading,
    required TResult Function(StaticLinkDataLoaded value) loaded,
    required TResult Function(StaticLinkError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StaticLinkLoading value)? loading,
    TResult? Function(StaticLinkDataLoaded value)? loaded,
    TResult? Function(StaticLinkError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StaticLinkLoading value)? loading,
    TResult Function(StaticLinkDataLoaded value)? loaded,
    TResult Function(StaticLinkError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StaticLinkLoading implements StaticLinksState {
  const factory StaticLinkLoading() = _$StaticLinkLoadingImpl;
}

/// @nodoc
abstract class _$$StaticLinkDataLoadedImplCopyWith<$Res> {
  factory _$$StaticLinkDataLoadedImplCopyWith(_$StaticLinkDataLoadedImpl value,
          $Res Function(_$StaticLinkDataLoadedImpl) then) =
      __$$StaticLinkDataLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Link> filteredLinks});
}

/// @nodoc
class __$$StaticLinkDataLoadedImplCopyWithImpl<$Res>
    extends _$StaticLinksStateCopyWithImpl<$Res, _$StaticLinkDataLoadedImpl>
    implements _$$StaticLinkDataLoadedImplCopyWith<$Res> {
  __$$StaticLinkDataLoadedImplCopyWithImpl(_$StaticLinkDataLoadedImpl _value,
      $Res Function(_$StaticLinkDataLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredLinks = null,
  }) {
    return _then(_$StaticLinkDataLoadedImpl(
      null == filteredLinks
          ? _value._filteredLinks
          : filteredLinks // ignore: cast_nullable_to_non_nullable
              as List<Link>,
    ));
  }
}

/// @nodoc

class _$StaticLinkDataLoadedImpl implements StaticLinkDataLoaded {
  const _$StaticLinkDataLoadedImpl(final List<Link> filteredLinks)
      : _filteredLinks = filteredLinks;

  final List<Link> _filteredLinks;
  @override
  List<Link> get filteredLinks {
    if (_filteredLinks is EqualUnmodifiableListView) return _filteredLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredLinks);
  }

  @override
  String toString() {
    return 'StaticLinksState.loaded(filteredLinks: $filteredLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaticLinkDataLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._filteredLinks, _filteredLinks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filteredLinks));

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaticLinkDataLoadedImplCopyWith<_$StaticLinkDataLoadedImpl>
      get copyWith =>
          __$$StaticLinkDataLoadedImplCopyWithImpl<_$StaticLinkDataLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Link> filteredLinks) loaded,
    required TResult Function() error,
  }) {
    return loaded(filteredLinks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Link> filteredLinks)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(filteredLinks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Link> filteredLinks)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(filteredLinks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StaticLinkLoading value) loading,
    required TResult Function(StaticLinkDataLoaded value) loaded,
    required TResult Function(StaticLinkError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StaticLinkLoading value)? loading,
    TResult? Function(StaticLinkDataLoaded value)? loaded,
    TResult? Function(StaticLinkError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StaticLinkLoading value)? loading,
    TResult Function(StaticLinkDataLoaded value)? loaded,
    TResult Function(StaticLinkError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StaticLinkDataLoaded implements StaticLinksState {
  const factory StaticLinkDataLoaded(final List<Link> filteredLinks) =
      _$StaticLinkDataLoadedImpl;

  List<Link> get filteredLinks;

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaticLinkDataLoadedImplCopyWith<_$StaticLinkDataLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StaticLinkErrorImplCopyWith<$Res> {
  factory _$$StaticLinkErrorImplCopyWith(_$StaticLinkErrorImpl value,
          $Res Function(_$StaticLinkErrorImpl) then) =
      __$$StaticLinkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StaticLinkErrorImplCopyWithImpl<$Res>
    extends _$StaticLinksStateCopyWithImpl<$Res, _$StaticLinkErrorImpl>
    implements _$$StaticLinkErrorImplCopyWith<$Res> {
  __$$StaticLinkErrorImplCopyWithImpl(
      _$StaticLinkErrorImpl _value, $Res Function(_$StaticLinkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaticLinksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StaticLinkErrorImpl implements StaticLinkError {
  const _$StaticLinkErrorImpl();

  @override
  String toString() {
    return 'StaticLinksState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StaticLinkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Link> filteredLinks) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Link> filteredLinks)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Link> filteredLinks)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StaticLinkLoading value) loading,
    required TResult Function(StaticLinkDataLoaded value) loaded,
    required TResult Function(StaticLinkError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StaticLinkLoading value)? loading,
    TResult? Function(StaticLinkDataLoaded value)? loaded,
    TResult? Function(StaticLinkError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StaticLinkLoading value)? loading,
    TResult Function(StaticLinkDataLoaded value)? loaded,
    TResult Function(StaticLinkError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StaticLinkError implements StaticLinksState {
  const factory StaticLinkError() = _$StaticLinkErrorImpl;
}
