// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PropertiesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Property> properties) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Property> properties)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Property> properties)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PropertiesLoading value) loading,
    required TResult Function(PropertiesLoaded value) loaded,
    required TResult Function(PropertiesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PropertiesLoading value)? loading,
    TResult? Function(PropertiesLoaded value)? loaded,
    TResult? Function(PropertiesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PropertiesLoading value)? loading,
    TResult Function(PropertiesLoaded value)? loaded,
    TResult Function(PropertiesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesStateCopyWith<$Res> {
  factory $PropertiesStateCopyWith(
          PropertiesState value, $Res Function(PropertiesState) then) =
      _$PropertiesStateCopyWithImpl<$Res, PropertiesState>;
}

/// @nodoc
class _$PropertiesStateCopyWithImpl<$Res, $Val extends PropertiesState>
    implements $PropertiesStateCopyWith<$Res> {
  _$PropertiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PropertiesLoadingImplCopyWith<$Res> {
  factory _$$PropertiesLoadingImplCopyWith(_$PropertiesLoadingImpl value,
          $Res Function(_$PropertiesLoadingImpl) then) =
      __$$PropertiesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PropertiesLoadingImplCopyWithImpl<$Res>
    extends _$PropertiesStateCopyWithImpl<$Res, _$PropertiesLoadingImpl>
    implements _$$PropertiesLoadingImplCopyWith<$Res> {
  __$$PropertiesLoadingImplCopyWithImpl(_$PropertiesLoadingImpl _value,
      $Res Function(_$PropertiesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PropertiesLoadingImpl implements PropertiesLoading {
  const _$PropertiesLoadingImpl();

  @override
  String toString() {
    return 'PropertiesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PropertiesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Property> properties) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Property> properties)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Property> properties)? loaded,
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
    required TResult Function(PropertiesLoading value) loading,
    required TResult Function(PropertiesLoaded value) loaded,
    required TResult Function(PropertiesError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PropertiesLoading value)? loading,
    TResult? Function(PropertiesLoaded value)? loaded,
    TResult? Function(PropertiesError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PropertiesLoading value)? loading,
    TResult Function(PropertiesLoaded value)? loaded,
    TResult Function(PropertiesError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PropertiesLoading implements PropertiesState {
  const factory PropertiesLoading() = _$PropertiesLoadingImpl;
}

/// @nodoc
abstract class _$$PropertiesLoadedImplCopyWith<$Res> {
  factory _$$PropertiesLoadedImplCopyWith(_$PropertiesLoadedImpl value,
          $Res Function(_$PropertiesLoadedImpl) then) =
      __$$PropertiesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Property> properties});
}

/// @nodoc
class __$$PropertiesLoadedImplCopyWithImpl<$Res>
    extends _$PropertiesStateCopyWithImpl<$Res, _$PropertiesLoadedImpl>
    implements _$$PropertiesLoadedImplCopyWith<$Res> {
  __$$PropertiesLoadedImplCopyWithImpl(_$PropertiesLoadedImpl _value,
      $Res Function(_$PropertiesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_$PropertiesLoadedImpl(
      null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ));
  }
}

/// @nodoc

class _$PropertiesLoadedImpl implements PropertiesLoaded {
  const _$PropertiesLoadedImpl(final List<Property> properties)
      : _properties = properties;

  final List<Property> _properties;
  @override
  List<Property> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'PropertiesState.loaded(properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertiesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_properties));

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertiesLoadedImplCopyWith<_$PropertiesLoadedImpl> get copyWith =>
      __$$PropertiesLoadedImplCopyWithImpl<_$PropertiesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Property> properties) loaded,
    required TResult Function() error,
  }) {
    return loaded(properties);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Property> properties)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(properties);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Property> properties)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(properties);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PropertiesLoading value) loading,
    required TResult Function(PropertiesLoaded value) loaded,
    required TResult Function(PropertiesError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PropertiesLoading value)? loading,
    TResult? Function(PropertiesLoaded value)? loaded,
    TResult? Function(PropertiesError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PropertiesLoading value)? loading,
    TResult Function(PropertiesLoaded value)? loaded,
    TResult Function(PropertiesError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PropertiesLoaded implements PropertiesState {
  const factory PropertiesLoaded(final List<Property> properties) =
      _$PropertiesLoadedImpl;

  List<Property> get properties;

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertiesLoadedImplCopyWith<_$PropertiesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PropertiesErrorImplCopyWith<$Res> {
  factory _$$PropertiesErrorImplCopyWith(_$PropertiesErrorImpl value,
          $Res Function(_$PropertiesErrorImpl) then) =
      __$$PropertiesErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PropertiesErrorImplCopyWithImpl<$Res>
    extends _$PropertiesStateCopyWithImpl<$Res, _$PropertiesErrorImpl>
    implements _$$PropertiesErrorImplCopyWith<$Res> {
  __$$PropertiesErrorImplCopyWithImpl(
      _$PropertiesErrorImpl _value, $Res Function(_$PropertiesErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertiesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PropertiesErrorImpl implements PropertiesError {
  const _$PropertiesErrorImpl();

  @override
  String toString() {
    return 'PropertiesState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PropertiesErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Property> properties) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Property> properties)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Property> properties)? loaded,
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
    required TResult Function(PropertiesLoading value) loading,
    required TResult Function(PropertiesLoaded value) loaded,
    required TResult Function(PropertiesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PropertiesLoading value)? loading,
    TResult? Function(PropertiesLoaded value)? loaded,
    TResult? Function(PropertiesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PropertiesLoading value)? loading,
    TResult Function(PropertiesLoaded value)? loaded,
    TResult Function(PropertiesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PropertiesError implements PropertiesState {
  const factory PropertiesError() = _$PropertiesErrorImpl;
}
