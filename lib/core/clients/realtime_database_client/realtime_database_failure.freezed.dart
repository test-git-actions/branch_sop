// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_database_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RealtimeDatabaseFailure {
  String get reference => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeDatabaseFailureCopyWith<RealtimeDatabaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeDatabaseFailureCopyWith<$Res> {
  factory $RealtimeDatabaseFailureCopyWith(RealtimeDatabaseFailure value,
          $Res Function(RealtimeDatabaseFailure) then) =
      _$RealtimeDatabaseFailureCopyWithImpl<$Res, RealtimeDatabaseFailure>;
  @useResult
  $Res call({String reference, String id});
}

/// @nodoc
class _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        $Val extends RealtimeDatabaseFailure>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  _$RealtimeDatabaseFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealtimeDatabaseDocumentDoesNotExistImplCopyWith<$Res>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  factory _$$RealtimeDatabaseDocumentDoesNotExistImplCopyWith(
          _$RealtimeDatabaseDocumentDoesNotExistImpl value,
          $Res Function(_$RealtimeDatabaseDocumentDoesNotExistImpl) then) =
      __$$RealtimeDatabaseDocumentDoesNotExistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String id});
}

/// @nodoc
class __$$RealtimeDatabaseDocumentDoesNotExistImplCopyWithImpl<$Res>
    extends _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        _$RealtimeDatabaseDocumentDoesNotExistImpl>
    implements _$$RealtimeDatabaseDocumentDoesNotExistImplCopyWith<$Res> {
  __$$RealtimeDatabaseDocumentDoesNotExistImplCopyWithImpl(
      _$RealtimeDatabaseDocumentDoesNotExistImpl _value,
      $Res Function(_$RealtimeDatabaseDocumentDoesNotExistImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? id = null,
  }) {
    return _then(_$RealtimeDatabaseDocumentDoesNotExistImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeDatabaseDocumentDoesNotExistImpl
    implements RealtimeDatabaseDocumentDoesNotExist {
  const _$RealtimeDatabaseDocumentDoesNotExistImpl(
      {required this.reference, required this.id});

  @override
  final String reference;
  @override
  final String id;

  @override
  String toString() {
    return 'RealtimeDatabaseFailure.documentDoesNotExist(reference: $reference, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeDatabaseDocumentDoesNotExistImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, id);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeDatabaseDocumentDoesNotExistImplCopyWith<
          _$RealtimeDatabaseDocumentDoesNotExistImpl>
      get copyWith => __$$RealtimeDatabaseDocumentDoesNotExistImplCopyWithImpl<
          _$RealtimeDatabaseDocumentDoesNotExistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) {
    return documentDoesNotExist(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) {
    return documentDoesNotExist?.call(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (documentDoesNotExist != null) {
      return documentDoesNotExist(reference, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) {
    return documentDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) {
    return documentDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (documentDoesNotExist != null) {
      return documentDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class RealtimeDatabaseDocumentDoesNotExist
    implements RealtimeDatabaseFailure {
  const factory RealtimeDatabaseDocumentDoesNotExist(
      {required final String reference,
      required final String id}) = _$RealtimeDatabaseDocumentDoesNotExistImpl;

  @override
  String get reference;
  @override
  String get id;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeDatabaseDocumentDoesNotExistImplCopyWith<
          _$RealtimeDatabaseDocumentDoesNotExistImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeDatabaseUnauthorizedImplCopyWith<$Res>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  factory _$$RealtimeDatabaseUnauthorizedImplCopyWith(
          _$RealtimeDatabaseUnauthorizedImpl value,
          $Res Function(_$RealtimeDatabaseUnauthorizedImpl) then) =
      __$$RealtimeDatabaseUnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String id});
}

/// @nodoc
class __$$RealtimeDatabaseUnauthorizedImplCopyWithImpl<$Res>
    extends _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        _$RealtimeDatabaseUnauthorizedImpl>
    implements _$$RealtimeDatabaseUnauthorizedImplCopyWith<$Res> {
  __$$RealtimeDatabaseUnauthorizedImplCopyWithImpl(
      _$RealtimeDatabaseUnauthorizedImpl _value,
      $Res Function(_$RealtimeDatabaseUnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? id = null,
  }) {
    return _then(_$RealtimeDatabaseUnauthorizedImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeDatabaseUnauthorizedImpl
    implements RealtimeDatabaseUnauthorized {
  const _$RealtimeDatabaseUnauthorizedImpl(
      {required this.reference, required this.id});

  @override
  final String reference;
  @override
  final String id;

  @override
  String toString() {
    return 'RealtimeDatabaseFailure.unauthorized(reference: $reference, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeDatabaseUnauthorizedImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, id);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeDatabaseUnauthorizedImplCopyWith<
          _$RealtimeDatabaseUnauthorizedImpl>
      get copyWith => __$$RealtimeDatabaseUnauthorizedImplCopyWithImpl<
          _$RealtimeDatabaseUnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) {
    return unauthorized(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) {
    return unauthorized?.call(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(reference, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class RealtimeDatabaseUnauthorized implements RealtimeDatabaseFailure {
  const factory RealtimeDatabaseUnauthorized(
      {required final String reference,
      required final String id}) = _$RealtimeDatabaseUnauthorizedImpl;

  @override
  String get reference;
  @override
  String get id;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeDatabaseUnauthorizedImplCopyWith<
          _$RealtimeDatabaseUnauthorizedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeDatabaseUnknownImplCopyWith<$Res>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  factory _$$RealtimeDatabaseUnknownImplCopyWith(
          _$RealtimeDatabaseUnknownImpl value,
          $Res Function(_$RealtimeDatabaseUnknownImpl) then) =
      __$$RealtimeDatabaseUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String message, String id, String code});
}

/// @nodoc
class __$$RealtimeDatabaseUnknownImplCopyWithImpl<$Res>
    extends _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        _$RealtimeDatabaseUnknownImpl>
    implements _$$RealtimeDatabaseUnknownImplCopyWith<$Res> {
  __$$RealtimeDatabaseUnknownImplCopyWithImpl(
      _$RealtimeDatabaseUnknownImpl _value,
      $Res Function(_$RealtimeDatabaseUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? message = null,
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_$RealtimeDatabaseUnknownImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeDatabaseUnknownImpl implements RealtimeDatabaseUnknown {
  const _$RealtimeDatabaseUnknownImpl(
      {required this.reference,
      required this.message,
      required this.id,
      required this.code});

  @override
  final String reference;
  @override
  final String message;
  @override
  final String id;
  @override
  final String code;

  @override
  String toString() {
    return 'RealtimeDatabaseFailure.unknown(reference: $reference, message: $message, id: $id, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeDatabaseUnknownImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, message, id, code);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeDatabaseUnknownImplCopyWith<_$RealtimeDatabaseUnknownImpl>
      get copyWith => __$$RealtimeDatabaseUnknownImplCopyWithImpl<
          _$RealtimeDatabaseUnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) {
    return unknown(reference, message, id, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) {
    return unknown?.call(reference, message, id, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(reference, message, id, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class RealtimeDatabaseUnknown implements RealtimeDatabaseFailure {
  const factory RealtimeDatabaseUnknown(
      {required final String reference,
      required final String message,
      required final String id,
      required final String code}) = _$RealtimeDatabaseUnknownImpl;

  @override
  String get reference;
  String get message;
  @override
  String get id;
  String get code;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeDatabaseUnknownImplCopyWith<_$RealtimeDatabaseUnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeDatabaseNoInternetImplCopyWith<$Res>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  factory _$$RealtimeDatabaseNoInternetImplCopyWith(
          _$RealtimeDatabaseNoInternetImpl value,
          $Res Function(_$RealtimeDatabaseNoInternetImpl) then) =
      __$$RealtimeDatabaseNoInternetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String id});
}

/// @nodoc
class __$$RealtimeDatabaseNoInternetImplCopyWithImpl<$Res>
    extends _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        _$RealtimeDatabaseNoInternetImpl>
    implements _$$RealtimeDatabaseNoInternetImplCopyWith<$Res> {
  __$$RealtimeDatabaseNoInternetImplCopyWithImpl(
      _$RealtimeDatabaseNoInternetImpl _value,
      $Res Function(_$RealtimeDatabaseNoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? id = null,
  }) {
    return _then(_$RealtimeDatabaseNoInternetImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeDatabaseNoInternetImpl implements RealtimeDatabaseNoInternet {
  const _$RealtimeDatabaseNoInternetImpl(
      {required this.reference, required this.id});

  @override
  final String reference;
  @override
  final String id;

  @override
  String toString() {
    return 'RealtimeDatabaseFailure.noInternet(reference: $reference, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeDatabaseNoInternetImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, id);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeDatabaseNoInternetImplCopyWith<_$RealtimeDatabaseNoInternetImpl>
      get copyWith => __$$RealtimeDatabaseNoInternetImplCopyWithImpl<
          _$RealtimeDatabaseNoInternetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) {
    return noInternet(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) {
    return noInternet?.call(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(reference, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class RealtimeDatabaseNoInternet implements RealtimeDatabaseFailure {
  const factory RealtimeDatabaseNoInternet(
      {required final String reference,
      required final String id}) = _$RealtimeDatabaseNoInternetImpl;

  @override
  String get reference;
  @override
  String get id;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeDatabaseNoInternetImplCopyWith<_$RealtimeDatabaseNoInternetImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeDatabaseParseFailureImplCopyWith<$Res>
    implements $RealtimeDatabaseFailureCopyWith<$Res> {
  factory _$$RealtimeDatabaseParseFailureImplCopyWith(
          _$RealtimeDatabaseParseFailureImpl value,
          $Res Function(_$RealtimeDatabaseParseFailureImpl) then) =
      __$$RealtimeDatabaseParseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String id});
}

/// @nodoc
class __$$RealtimeDatabaseParseFailureImplCopyWithImpl<$Res>
    extends _$RealtimeDatabaseFailureCopyWithImpl<$Res,
        _$RealtimeDatabaseParseFailureImpl>
    implements _$$RealtimeDatabaseParseFailureImplCopyWith<$Res> {
  __$$RealtimeDatabaseParseFailureImplCopyWithImpl(
      _$RealtimeDatabaseParseFailureImpl _value,
      $Res Function(_$RealtimeDatabaseParseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? id = null,
  }) {
    return _then(_$RealtimeDatabaseParseFailureImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeDatabaseParseFailureImpl
    implements RealtimeDatabaseParseFailure {
  const _$RealtimeDatabaseParseFailureImpl(
      {required this.reference, required this.id});

  @override
  final String reference;
  @override
  final String id;

  @override
  String toString() {
    return 'RealtimeDatabaseFailure.parseFailure(reference: $reference, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeDatabaseParseFailureImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, id);

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeDatabaseParseFailureImplCopyWith<
          _$RealtimeDatabaseParseFailureImpl>
      get copyWith => __$$RealtimeDatabaseParseFailureImplCopyWithImpl<
          _$RealtimeDatabaseParseFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reference, String id) documentDoesNotExist,
    required TResult Function(String reference, String id) unauthorized,
    required TResult Function(
            String reference, String message, String id, String code)
        unknown,
    required TResult Function(String reference, String id) noInternet,
    required TResult Function(String reference, String id) parseFailure,
  }) {
    return parseFailure(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reference, String id)? documentDoesNotExist,
    TResult? Function(String reference, String id)? unauthorized,
    TResult? Function(String reference, String message, String id, String code)?
        unknown,
    TResult? Function(String reference, String id)? noInternet,
    TResult? Function(String reference, String id)? parseFailure,
  }) {
    return parseFailure?.call(reference, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reference, String id)? documentDoesNotExist,
    TResult Function(String reference, String id)? unauthorized,
    TResult Function(String reference, String message, String id, String code)?
        unknown,
    TResult Function(String reference, String id)? noInternet,
    TResult Function(String reference, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (parseFailure != null) {
      return parseFailure(reference, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeDatabaseDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(RealtimeDatabaseUnauthorized value) unauthorized,
    required TResult Function(RealtimeDatabaseUnknown value) unknown,
    required TResult Function(RealtimeDatabaseNoInternet value) noInternet,
    required TResult Function(RealtimeDatabaseParseFailure value) parseFailure,
  }) {
    return parseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult? Function(RealtimeDatabaseUnknown value)? unknown,
    TResult? Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult? Function(RealtimeDatabaseParseFailure value)? parseFailure,
  }) {
    return parseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeDatabaseDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult Function(RealtimeDatabaseUnauthorized value)? unauthorized,
    TResult Function(RealtimeDatabaseUnknown value)? unknown,
    TResult Function(RealtimeDatabaseNoInternet value)? noInternet,
    TResult Function(RealtimeDatabaseParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (parseFailure != null) {
      return parseFailure(this);
    }
    return orElse();
  }
}

abstract class RealtimeDatabaseParseFailure implements RealtimeDatabaseFailure {
  const factory RealtimeDatabaseParseFailure(
      {required final String reference,
      required final String id}) = _$RealtimeDatabaseParseFailureImpl;

  @override
  String get reference;
  @override
  String get id;

  /// Create a copy of RealtimeDatabaseFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeDatabaseParseFailureImplCopyWith<
          _$RealtimeDatabaseParseFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
