// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengeLink {
  String? get challengeId => throw _privateConstructorUsedError;
  String? get memberId => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeLinkCopyWith<ChallengeLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeLinkCopyWith<$Res> {
  factory $ChallengeLinkCopyWith(
          ChallengeLink value, $Res Function(ChallengeLink) then) =
      _$ChallengeLinkCopyWithImpl<$Res, ChallengeLink>;
  @useResult
  $Res call({String? challengeId, String? memberId});
}

/// @nodoc
class _$ChallengeLinkCopyWithImpl<$Res, $Val extends ChallengeLink>
    implements $ChallengeLinkCopyWith<$Res> {
  _$ChallengeLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? memberId = freezed,
  }) {
    return _then(_value.copyWith(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeLinkImplCopyWith<$Res>
    implements $ChallengeLinkCopyWith<$Res> {
  factory _$$ChallengeLinkImplCopyWith(
          _$ChallengeLinkImpl value, $Res Function(_$ChallengeLinkImpl) then) =
      __$$ChallengeLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? challengeId, String? memberId});
}

/// @nodoc
class __$$ChallengeLinkImplCopyWithImpl<$Res>
    extends _$ChallengeLinkCopyWithImpl<$Res, _$ChallengeLinkImpl>
    implements _$$ChallengeLinkImplCopyWith<$Res> {
  __$$ChallengeLinkImplCopyWithImpl(
      _$ChallengeLinkImpl _value, $Res Function(_$ChallengeLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? memberId = freezed,
  }) {
    return _then(_$ChallengeLinkImpl(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChallengeLinkImpl extends _ChallengeLink {
  const _$ChallengeLinkImpl({this.challengeId, this.memberId}) : super._();

  @override
  final String? challengeId;
  @override
  final String? memberId;

  @override
  String toString() {
    return 'ChallengeLink(challengeId: $challengeId, memberId: $memberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeLinkImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, challengeId, memberId);

  /// Create a copy of ChallengeLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeLinkImplCopyWith<_$ChallengeLinkImpl> get copyWith =>
      __$$ChallengeLinkImplCopyWithImpl<_$ChallengeLinkImpl>(this, _$identity);
}

abstract class _ChallengeLink extends ChallengeLink {
  const factory _ChallengeLink(
      {final String? challengeId,
      final String? memberId}) = _$ChallengeLinkImpl;
  const _ChallengeLink._() : super._();

  @override
  String? get challengeId;
  @override
  String? get memberId;

  /// Create a copy of ChallengeLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeLinkImplCopyWith<_$ChallengeLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
