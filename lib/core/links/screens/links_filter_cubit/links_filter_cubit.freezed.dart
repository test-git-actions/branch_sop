// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'links_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LinksFilterState {
  List<Link> get links => throw _privateConstructorUsedError;

  /// Create a copy of LinksFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinksFilterStateCopyWith<LinksFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksFilterStateCopyWith<$Res> {
  factory $LinksFilterStateCopyWith(
          LinksFilterState value, $Res Function(LinksFilterState) then) =
      _$LinksFilterStateCopyWithImpl<$Res, LinksFilterState>;
  @useResult
  $Res call({List<Link> links});
}

/// @nodoc
class _$LinksFilterStateCopyWithImpl<$Res, $Val extends LinksFilterState>
    implements $LinksFilterStateCopyWith<$Res> {
  _$LinksFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinksFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksFilterStateImplCopyWith<$Res>
    implements $LinksFilterStateCopyWith<$Res> {
  factory _$$LinksFilterStateImplCopyWith(_$LinksFilterStateImpl value,
          $Res Function(_$LinksFilterStateImpl) then) =
      __$$LinksFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Link> links});
}

/// @nodoc
class __$$LinksFilterStateImplCopyWithImpl<$Res>
    extends _$LinksFilterStateCopyWithImpl<$Res, _$LinksFilterStateImpl>
    implements _$$LinksFilterStateImplCopyWith<$Res> {
  __$$LinksFilterStateImplCopyWithImpl(_$LinksFilterStateImpl _value,
      $Res Function(_$LinksFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinksFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
  }) {
    return _then(_$LinksFilterStateImpl(
      null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
    ));
  }
}

/// @nodoc

class _$LinksFilterStateImpl implements _LinksFilterState {
  const _$LinksFilterStateImpl(final List<Link> links) : _links = links;

  final List<Link> _links;
  @override
  List<Link> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'LinksFilterState(links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksFilterStateImpl &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_links));

  /// Create a copy of LinksFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksFilterStateImplCopyWith<_$LinksFilterStateImpl> get copyWith =>
      __$$LinksFilterStateImplCopyWithImpl<_$LinksFilterStateImpl>(
          this, _$identity);
}

abstract class _LinksFilterState implements LinksFilterState {
  const factory _LinksFilterState(final List<Link> links) =
      _$LinksFilterStateImpl;

  @override
  List<Link> get links;

  /// Create a copy of LinksFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinksFilterStateImplCopyWith<_$LinksFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
