// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_page_deep_link_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePageDeepLinkState {
  Link get link => throw _privateConstructorUsedError;
  String? get generatedLink => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get apiErrorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)
        formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)?
        formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)?
        formData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatePageDeepLinkState value) formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreatePageDeepLinkState value)? formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatePageDeepLinkState value)? formData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreatePageDeepLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePageDeepLinkStateCopyWith<CreatePageDeepLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePageDeepLinkStateCopyWith<$Res> {
  factory $CreatePageDeepLinkStateCopyWith(CreatePageDeepLinkState value,
          $Res Function(CreatePageDeepLinkState) then) =
      _$CreatePageDeepLinkStateCopyWithImpl<$Res, CreatePageDeepLinkState>;
  @useResult
  $Res call(
      {Link link,
      String? generatedLink,
      bool isLoading,
      String? apiErrorMessage});
}

/// @nodoc
class _$CreatePageDeepLinkStateCopyWithImpl<$Res,
        $Val extends CreatePageDeepLinkState>
    implements $CreatePageDeepLinkStateCopyWith<$Res> {
  _$CreatePageDeepLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePageDeepLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? generatedLink = freezed,
    Object? isLoading = null,
    Object? apiErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Link,
      generatedLink: freezed == generatedLink
          ? _value.generatedLink
          : generatedLink // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiErrorMessage: freezed == apiErrorMessage
          ? _value.apiErrorMessage
          : apiErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePageDeepLinkStateImplCopyWith<$Res>
    implements $CreatePageDeepLinkStateCopyWith<$Res> {
  factory _$$CreatePageDeepLinkStateImplCopyWith(
          _$CreatePageDeepLinkStateImpl value,
          $Res Function(_$CreatePageDeepLinkStateImpl) then) =
      __$$CreatePageDeepLinkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Link link,
      String? generatedLink,
      bool isLoading,
      String? apiErrorMessage});
}

/// @nodoc
class __$$CreatePageDeepLinkStateImplCopyWithImpl<$Res>
    extends _$CreatePageDeepLinkStateCopyWithImpl<$Res,
        _$CreatePageDeepLinkStateImpl>
    implements _$$CreatePageDeepLinkStateImplCopyWith<$Res> {
  __$$CreatePageDeepLinkStateImplCopyWithImpl(
      _$CreatePageDeepLinkStateImpl _value,
      $Res Function(_$CreatePageDeepLinkStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePageDeepLinkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? generatedLink = freezed,
    Object? isLoading = null,
    Object? apiErrorMessage = freezed,
  }) {
    return _then(_$CreatePageDeepLinkStateImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Link,
      generatedLink: freezed == generatedLink
          ? _value.generatedLink
          : generatedLink // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiErrorMessage: freezed == apiErrorMessage
          ? _value.apiErrorMessage
          : apiErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreatePageDeepLinkStateImpl implements _CreatePageDeepLinkState {
  const _$CreatePageDeepLinkStateImpl(
      {required this.link,
      this.generatedLink,
      this.isLoading = false,
      this.apiErrorMessage});

  @override
  final Link link;
  @override
  final String? generatedLink;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? apiErrorMessage;

  @override
  String toString() {
    return 'CreatePageDeepLinkState.formData(link: $link, generatedLink: $generatedLink, isLoading: $isLoading, apiErrorMessage: $apiErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePageDeepLinkStateImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.generatedLink, generatedLink) ||
                other.generatedLink == generatedLink) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiErrorMessage, apiErrorMessage) ||
                other.apiErrorMessage == apiErrorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, link, generatedLink, isLoading, apiErrorMessage);

  /// Create a copy of CreatePageDeepLinkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePageDeepLinkStateImplCopyWith<_$CreatePageDeepLinkStateImpl>
      get copyWith => __$$CreatePageDeepLinkStateImplCopyWithImpl<
          _$CreatePageDeepLinkStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)
        formData,
  }) {
    return formData(link, generatedLink, isLoading, apiErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)?
        formData,
  }) {
    return formData?.call(link, generatedLink, isLoading, apiErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Link link, String? generatedLink, bool isLoading,
            String? apiErrorMessage)?
        formData,
    required TResult orElse(),
  }) {
    if (formData != null) {
      return formData(link, generatedLink, isLoading, apiErrorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatePageDeepLinkState value) formData,
  }) {
    return formData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreatePageDeepLinkState value)? formData,
  }) {
    return formData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatePageDeepLinkState value)? formData,
    required TResult orElse(),
  }) {
    if (formData != null) {
      return formData(this);
    }
    return orElse();
  }
}

abstract class _CreatePageDeepLinkState implements CreatePageDeepLinkState {
  const factory _CreatePageDeepLinkState(
      {required final Link link,
      final String? generatedLink,
      final bool isLoading,
      final String? apiErrorMessage}) = _$CreatePageDeepLinkStateImpl;

  @override
  Link get link;
  @override
  String? get generatedLink;
  @override
  bool get isLoading;
  @override
  String? get apiErrorMessage;

  /// Create a copy of CreatePageDeepLinkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePageDeepLinkStateImplCopyWith<_$CreatePageDeepLinkStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
