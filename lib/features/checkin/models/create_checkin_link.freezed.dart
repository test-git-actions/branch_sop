// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_checkin_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckinLink {
  String? get lastName => throw _privateConstructorUsedError;
  String? get reservationConfirmationNumber =>
      throw _privateConstructorUsedError;
  String? get adobeDeepLinkParameter => throw _privateConstructorUsedError;

  /// Create a copy of CheckinLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinLinkCopyWith<CheckinLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinLinkCopyWith<$Res> {
  factory $CheckinLinkCopyWith(
          CheckinLink value, $Res Function(CheckinLink) then) =
      _$CheckinLinkCopyWithImpl<$Res, CheckinLink>;
  @useResult
  $Res call(
      {String? lastName,
      String? reservationConfirmationNumber,
      String? adobeDeepLinkParameter});
}

/// @nodoc
class _$CheckinLinkCopyWithImpl<$Res, $Val extends CheckinLink>
    implements $CheckinLinkCopyWith<$Res> {
  _$CheckinLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastName = freezed,
    Object? reservationConfirmationNumber = freezed,
    Object? adobeDeepLinkParameter = freezed,
  }) {
    return _then(_value.copyWith(
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationConfirmationNumber: freezed == reservationConfirmationNumber
          ? _value.reservationConfirmationNumber
          : reservationConfirmationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      adobeDeepLinkParameter: freezed == adobeDeepLinkParameter
          ? _value.adobeDeepLinkParameter
          : adobeDeepLinkParameter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckinLinkImplCopyWith<$Res>
    implements $CheckinLinkCopyWith<$Res> {
  factory _$$CheckinLinkImplCopyWith(
          _$CheckinLinkImpl value, $Res Function(_$CheckinLinkImpl) then) =
      __$$CheckinLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? lastName,
      String? reservationConfirmationNumber,
      String? adobeDeepLinkParameter});
}

/// @nodoc
class __$$CheckinLinkImplCopyWithImpl<$Res>
    extends _$CheckinLinkCopyWithImpl<$Res, _$CheckinLinkImpl>
    implements _$$CheckinLinkImplCopyWith<$Res> {
  __$$CheckinLinkImplCopyWithImpl(
      _$CheckinLinkImpl _value, $Res Function(_$CheckinLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckinLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastName = freezed,
    Object? reservationConfirmationNumber = freezed,
    Object? adobeDeepLinkParameter = freezed,
  }) {
    return _then(_$CheckinLinkImpl(
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationConfirmationNumber: freezed == reservationConfirmationNumber
          ? _value.reservationConfirmationNumber
          : reservationConfirmationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      adobeDeepLinkParameter: freezed == adobeDeepLinkParameter
          ? _value.adobeDeepLinkParameter
          : adobeDeepLinkParameter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckinLinkImpl extends _CheckinLink {
  const _$CheckinLinkImpl(
      {this.lastName,
      this.reservationConfirmationNumber,
      this.adobeDeepLinkParameter})
      : super._();

  @override
  final String? lastName;
  @override
  final String? reservationConfirmationNumber;
  @override
  final String? adobeDeepLinkParameter;

  @override
  String toString() {
    return 'CheckinLink(lastName: $lastName, reservationConfirmationNumber: $reservationConfirmationNumber, adobeDeepLinkParameter: $adobeDeepLinkParameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinLinkImpl &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.reservationConfirmationNumber,
                    reservationConfirmationNumber) ||
                other.reservationConfirmationNumber ==
                    reservationConfirmationNumber) &&
            (identical(other.adobeDeepLinkParameter, adobeDeepLinkParameter) ||
                other.adobeDeepLinkParameter == adobeDeepLinkParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastName,
      reservationConfirmationNumber, adobeDeepLinkParameter);

  /// Create a copy of CheckinLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinLinkImplCopyWith<_$CheckinLinkImpl> get copyWith =>
      __$$CheckinLinkImplCopyWithImpl<_$CheckinLinkImpl>(this, _$identity);
}

abstract class _CheckinLink extends CheckinLink {
  const factory _CheckinLink(
      {final String? lastName,
      final String? reservationConfirmationNumber,
      final String? adobeDeepLinkParameter}) = _$CheckinLinkImpl;
  const _CheckinLink._() : super._();

  @override
  String? get lastName;
  @override
  String? get reservationConfirmationNumber;
  @override
  String? get adobeDeepLinkParameter;

  /// Create a copy of CheckinLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinLinkImplCopyWith<_$CheckinLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
