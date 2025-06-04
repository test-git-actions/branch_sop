// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiFailure {
  String? get endpoint => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get errorTitle => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiFailureCopyWith<ApiFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res, ApiFailure>;
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res, $Val extends ApiFailure>
    implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_value.copyWith(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiFailureConnectionImplCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ApiFailureConnectionImplCopyWith(_$ApiFailureConnectionImpl value,
          $Res Function(_$ApiFailureConnectionImpl) then) =
      __$$ApiFailureConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class __$$ApiFailureConnectionImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ApiFailureConnectionImpl>
    implements _$$ApiFailureConnectionImplCopyWith<$Res> {
  __$$ApiFailureConnectionImplCopyWithImpl(_$ApiFailureConnectionImpl _value,
      $Res Function(_$ApiFailureConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ApiFailureConnectionImpl(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiFailureConnectionImpl extends ApiFailureConnection {
  const _$ApiFailureConnectionImpl(
      {this.endpoint,
      this.statusCode,
      this.errorMessage,
      this.errorTitle,
      this.errorCode})
      : super._();

  @override
  final String? endpoint;
  @override
  final int? statusCode;
  @override
  final String? errorMessage;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'ApiFailure.connectionError(endpoint: $endpoint, statusCode: $statusCode, errorMessage: $errorMessage, errorTitle: $errorTitle, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureConnectionImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endpoint, statusCode, errorMessage, errorTitle, errorCode);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureConnectionImplCopyWith<_$ApiFailureConnectionImpl>
      get copyWith =>
          __$$ApiFailureConnectionImplCopyWithImpl<_$ApiFailureConnectionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) {
    return connectionError(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) {
    return connectionError?.call(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(
          endpoint, statusCode, errorMessage, errorTitle, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class ApiFailureConnection extends ApiFailure {
  const factory ApiFailureConnection(
      {final String? endpoint,
      final int? statusCode,
      final String? errorMessage,
      final String? errorTitle,
      final String? errorCode}) = _$ApiFailureConnectionImpl;
  const ApiFailureConnection._() : super._();

  @override
  String? get endpoint;
  @override
  int? get statusCode;
  @override
  String? get errorMessage;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureConnectionImplCopyWith<_$ApiFailureConnectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiFailureServerImplCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ApiFailureServerImplCopyWith(_$ApiFailureServerImpl value,
          $Res Function(_$ApiFailureServerImpl) then) =
      __$$ApiFailureServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class __$$ApiFailureServerImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ApiFailureServerImpl>
    implements _$$ApiFailureServerImplCopyWith<$Res> {
  __$$ApiFailureServerImplCopyWithImpl(_$ApiFailureServerImpl _value,
      $Res Function(_$ApiFailureServerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ApiFailureServerImpl(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiFailureServerImpl extends ApiFailureServer {
  const _$ApiFailureServerImpl(
      {this.endpoint,
      this.statusCode,
      this.errorMessage,
      this.errorTitle,
      this.errorCode})
      : super._();

  @override
  final String? endpoint;
  @override
  final int? statusCode;
  @override
  final String? errorMessage;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'ApiFailure.serverError(endpoint: $endpoint, statusCode: $statusCode, errorMessage: $errorMessage, errorTitle: $errorTitle, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureServerImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endpoint, statusCode, errorMessage, errorTitle, errorCode);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureServerImplCopyWith<_$ApiFailureServerImpl> get copyWith =>
      __$$ApiFailureServerImplCopyWithImpl<_$ApiFailureServerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) {
    return serverError(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) {
    return serverError?.call(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(
          endpoint, statusCode, errorMessage, errorTitle, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ApiFailureServer extends ApiFailure {
  const factory ApiFailureServer(
      {final String? endpoint,
      final int? statusCode,
      final String? errorMessage,
      final String? errorTitle,
      final String? errorCode}) = _$ApiFailureServerImpl;
  const ApiFailureServer._() : super._();

  @override
  String? get endpoint;
  @override
  int? get statusCode;
  @override
  String? get errorMessage;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureServerImplCopyWith<_$ApiFailureServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiFailureInvalidStatusImplCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ApiFailureInvalidStatusImplCopyWith(
          _$ApiFailureInvalidStatusImpl value,
          $Res Function(_$ApiFailureInvalidStatusImpl) then) =
      __$$ApiFailureInvalidStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class __$$ApiFailureInvalidStatusImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ApiFailureInvalidStatusImpl>
    implements _$$ApiFailureInvalidStatusImplCopyWith<$Res> {
  __$$ApiFailureInvalidStatusImplCopyWithImpl(
      _$ApiFailureInvalidStatusImpl _value,
      $Res Function(_$ApiFailureInvalidStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ApiFailureInvalidStatusImpl(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiFailureInvalidStatusImpl extends ApiFailureInvalidStatus {
  const _$ApiFailureInvalidStatusImpl(
      {this.endpoint,
      this.statusCode,
      this.errorMessage,
      this.errorTitle,
      this.errorCode})
      : super._();

  @override
  final String? endpoint;
  @override
  final int? statusCode;
  @override
  final String? errorMessage;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'ApiFailure.clientError(endpoint: $endpoint, statusCode: $statusCode, errorMessage: $errorMessage, errorTitle: $errorTitle, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureInvalidStatusImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endpoint, statusCode, errorMessage, errorTitle, errorCode);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureInvalidStatusImplCopyWith<_$ApiFailureInvalidStatusImpl>
      get copyWith => __$$ApiFailureInvalidStatusImplCopyWithImpl<
          _$ApiFailureInvalidStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) {
    return clientError(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) {
    return clientError?.call(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(
          endpoint, statusCode, errorMessage, errorTitle, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) {
    return clientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }
}

abstract class ApiFailureInvalidStatus extends ApiFailure {
  const factory ApiFailureInvalidStatus(
      {final String? endpoint,
      final int? statusCode,
      final String? errorMessage,
      final String? errorTitle,
      final String? errorCode}) = _$ApiFailureInvalidStatusImpl;
  const ApiFailureInvalidStatus._() : super._();

  @override
  String? get endpoint;
  @override
  int? get statusCode;
  @override
  String? get errorMessage;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureInvalidStatusImplCopyWith<_$ApiFailureInvalidStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiFailureUnauthorizedImplCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ApiFailureUnauthorizedImplCopyWith(
          _$ApiFailureUnauthorizedImpl value,
          $Res Function(_$ApiFailureUnauthorizedImpl) then) =
      __$$ApiFailureUnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class __$$ApiFailureUnauthorizedImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ApiFailureUnauthorizedImpl>
    implements _$$ApiFailureUnauthorizedImplCopyWith<$Res> {
  __$$ApiFailureUnauthorizedImplCopyWithImpl(
      _$ApiFailureUnauthorizedImpl _value,
      $Res Function(_$ApiFailureUnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ApiFailureUnauthorizedImpl(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiFailureUnauthorizedImpl extends ApiFailureUnauthorized {
  const _$ApiFailureUnauthorizedImpl(
      {this.endpoint,
      this.statusCode,
      this.errorMessage,
      this.errorTitle,
      this.errorCode})
      : super._();

  @override
  final String? endpoint;
  @override
  final int? statusCode;
  @override
  final String? errorMessage;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'ApiFailure.unauthorized(endpoint: $endpoint, statusCode: $statusCode, errorMessage: $errorMessage, errorTitle: $errorTitle, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureUnauthorizedImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endpoint, statusCode, errorMessage, errorTitle, errorCode);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureUnauthorizedImplCopyWith<_$ApiFailureUnauthorizedImpl>
      get copyWith => __$$ApiFailureUnauthorizedImplCopyWithImpl<
          _$ApiFailureUnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) {
    return unauthorized(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) {
    return unauthorized?.call(
        endpoint, statusCode, errorMessage, errorTitle, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(
          endpoint, statusCode, errorMessage, errorTitle, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class ApiFailureUnauthorized extends ApiFailure {
  const factory ApiFailureUnauthorized(
      {final String? endpoint,
      final int? statusCode,
      final String? errorMessage,
      final String? errorTitle,
      final String? errorCode}) = _$ApiFailureUnauthorizedImpl;
  const ApiFailureUnauthorized._() : super._();

  @override
  String? get endpoint;
  @override
  int? get statusCode;
  @override
  String? get errorMessage;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureUnauthorizedImplCopyWith<_$ApiFailureUnauthorizedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiFailureUnknownImplCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ApiFailureUnknownImplCopyWith(_$ApiFailureUnknownImpl value,
          $Res Function(_$ApiFailureUnknownImpl) then) =
      __$$ApiFailureUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endpoint,
      int? statusCode,
      String? errorMessage,
      String? errorTitle,
      String? errorCode,
      Object? error});
}

/// @nodoc
class __$$ApiFailureUnknownImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ApiFailureUnknownImpl>
    implements _$$ApiFailureUnknownImplCopyWith<$Res> {
  __$$ApiFailureUnknownImplCopyWithImpl(_$ApiFailureUnknownImpl _value,
      $Res Function(_$ApiFailureUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = freezed,
    Object? statusCode = freezed,
    Object? errorMessage = freezed,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ApiFailureUnknownImpl(
      endpoint: freezed == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ApiFailureUnknownImpl extends ApiFailureUnknown {
  const _$ApiFailureUnknownImpl(
      {this.endpoint,
      this.statusCode,
      this.errorMessage,
      this.errorTitle,
      this.errorCode,
      this.error})
      : super._();

  @override
  final String? endpoint;
  @override
  final int? statusCode;
  @override
  final String? errorMessage;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;
  @override
  final Object? error;

  @override
  String toString() {
    return 'ApiFailure.unknownError(endpoint: $endpoint, statusCode: $statusCode, errorMessage: $errorMessage, errorTitle: $errorTitle, errorCode: $errorCode, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureUnknownImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      endpoint,
      statusCode,
      errorMessage,
      errorTitle,
      errorCode,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureUnknownImplCopyWith<_$ApiFailureUnknownImpl> get copyWith =>
      __$$ApiFailureUnknownImplCopyWithImpl<_$ApiFailureUnknownImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        connectionError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        serverError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        clientError,
    required TResult Function(String? endpoint, int? statusCode,
            String? errorMessage, String? errorTitle, String? errorCode)
        unauthorized,
    required TResult Function(
            String? endpoint,
            int? statusCode,
            String? errorMessage,
            String? errorTitle,
            String? errorCode,
            Object? error)
        unknownError,
  }) {
    return unknownError(
        endpoint, statusCode, errorMessage, errorTitle, errorCode, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult? Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
  }) {
    return unknownError?.call(
        endpoint, statusCode, errorMessage, errorTitle, errorCode, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        connectionError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        serverError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        clientError,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode)?
        unauthorized,
    TResult Function(String? endpoint, int? statusCode, String? errorMessage,
            String? errorTitle, String? errorCode, Object? error)?
        unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(
          endpoint, statusCode, errorMessage, errorTitle, errorCode, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiFailureConnection value) connectionError,
    required TResult Function(ApiFailureServer value) serverError,
    required TResult Function(ApiFailureInvalidStatus value) clientError,
    required TResult Function(ApiFailureUnauthorized value) unauthorized,
    required TResult Function(ApiFailureUnknown value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiFailureConnection value)? connectionError,
    TResult? Function(ApiFailureServer value)? serverError,
    TResult? Function(ApiFailureInvalidStatus value)? clientError,
    TResult? Function(ApiFailureUnauthorized value)? unauthorized,
    TResult? Function(ApiFailureUnknown value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiFailureConnection value)? connectionError,
    TResult Function(ApiFailureServer value)? serverError,
    TResult Function(ApiFailureInvalidStatus value)? clientError,
    TResult Function(ApiFailureUnauthorized value)? unauthorized,
    TResult Function(ApiFailureUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class ApiFailureUnknown extends ApiFailure {
  const factory ApiFailureUnknown(
      {final String? endpoint,
      final int? statusCode,
      final String? errorMessage,
      final String? errorTitle,
      final String? errorCode,
      final Object? error}) = _$ApiFailureUnknownImpl;
  const ApiFailureUnknown._() : super._();

  @override
  String? get endpoint;
  @override
  int? get statusCode;
  @override
  String? get errorMessage;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;
  Object? get error;

  /// Create a copy of ApiFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureUnknownImplCopyWith<_$ApiFailureUnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
