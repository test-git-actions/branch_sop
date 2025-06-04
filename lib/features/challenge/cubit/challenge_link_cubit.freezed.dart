// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_link_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengeLinkState {
  ChallengeLink get deepLink => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get generatedDeepLink => throw _privateConstructorUsedError;
  String? get apiErrorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeLinkStateCopyWith<ChallengeLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeLinkStateCopyWith<$Res> {
  factory $ChallengeLinkStateCopyWith(
          ChallengeLinkState value, $Res Function(ChallengeLinkState) then) =
      _$ChallengeLinkStateCopyWithImpl<$Res, ChallengeLinkState>;
  @useResult
  $Res call(
      {ChallengeLink deepLink,
      bool isLoading,
      String? generatedDeepLink,
      String? apiErrorMessage});

  $ChallengeLinkCopyWith<$Res> get deepLink;
}

/// @nodoc
class _$ChallengeLinkStateCopyWithImpl<$Res, $Val extends ChallengeLinkState>
    implements $ChallengeLinkStateCopyWith<$Res> {
  _$ChallengeLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deepLink = null,
    Object? isLoading = null,
    Object? generatedDeepLink = freezed,
    Object? apiErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as ChallengeLink,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      generatedDeepLink: freezed == generatedDeepLink
          ? _value.generatedDeepLink
          : generatedDeepLink // ignore: cast_nullable_to_non_nullable
              as String?,
      apiErrorMessage: freezed == apiErrorMessage
          ? _value.apiErrorMessage
          : apiErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChallengeLinkCopyWith<$Res> get deepLink {
    return $ChallengeLinkCopyWith<$Res>(_value.deepLink, (value) {
      return _then(_value.copyWith(deepLink: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormLoadedImplCopyWith<$Res>
    implements $ChallengeLinkStateCopyWith<$Res> {
  factory _$$FormLoadedImplCopyWith(
          _$FormLoadedImpl value, $Res Function(_$FormLoadedImpl) then) =
      __$$FormLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChallengeLink deepLink,
      bool isLoading,
      String? generatedDeepLink,
      String? apiErrorMessage});

  @override
  $ChallengeLinkCopyWith<$Res> get deepLink;
}

/// @nodoc
class __$$FormLoadedImplCopyWithImpl<$Res>
    extends _$ChallengeLinkStateCopyWithImpl<$Res, _$FormLoadedImpl>
    implements _$$FormLoadedImplCopyWith<$Res> {
  __$$FormLoadedImplCopyWithImpl(
      _$FormLoadedImpl _value, $Res Function(_$FormLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deepLink = null,
    Object? isLoading = null,
    Object? generatedDeepLink = freezed,
    Object? apiErrorMessage = freezed,
  }) {
    return _then(_$FormLoadedImpl(
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as ChallengeLink,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      generatedDeepLink: freezed == generatedDeepLink
          ? _value.generatedDeepLink
          : generatedDeepLink // ignore: cast_nullable_to_non_nullable
              as String?,
      apiErrorMessage: freezed == apiErrorMessage
          ? _value.apiErrorMessage
          : apiErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FormLoadedImpl implements _FormLoaded {
  const _$FormLoadedImpl(
      {this.deepLink = const ChallengeLink(),
      this.isLoading = false,
      this.generatedDeepLink,
      this.apiErrorMessage});

  @override
  @JsonKey()
  final ChallengeLink deepLink;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? generatedDeepLink;
  @override
  final String? apiErrorMessage;

  @override
  String toString() {
    return 'ChallengeLinkState(deepLink: $deepLink, isLoading: $isLoading, generatedDeepLink: $generatedDeepLink, apiErrorMessage: $apiErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormLoadedImpl &&
            (identical(other.deepLink, deepLink) ||
                other.deepLink == deepLink) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.generatedDeepLink, generatedDeepLink) ||
                other.generatedDeepLink == generatedDeepLink) &&
            (identical(other.apiErrorMessage, apiErrorMessage) ||
                other.apiErrorMessage == apiErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, deepLink, isLoading, generatedDeepLink, apiErrorMessage);

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormLoadedImplCopyWith<_$FormLoadedImpl> get copyWith =>
      __$$FormLoadedImplCopyWithImpl<_$FormLoadedImpl>(this, _$identity);
}

abstract class _FormLoaded implements ChallengeLinkState {
  const factory _FormLoaded(
      {final ChallengeLink deepLink,
      final bool isLoading,
      final String? generatedDeepLink,
      final String? apiErrorMessage}) = _$FormLoadedImpl;

  @override
  ChallengeLink get deepLink;
  @override
  bool get isLoading;
  @override
  String? get generatedDeepLink;
  @override
  String? get apiErrorMessage;

  /// Create a copy of ChallengeLinkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormLoadedImplCopyWith<_$FormLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
