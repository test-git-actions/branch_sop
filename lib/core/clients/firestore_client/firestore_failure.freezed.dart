// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirestoreFailure {
  String get collection => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirestoreFailureCopyWith<FirestoreFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreFailureCopyWith<$Res> {
  factory $FirestoreFailureCopyWith(
          FirestoreFailure value, $Res Function(FirestoreFailure) then) =
      _$FirestoreFailureCopyWithImpl<$Res, FirestoreFailure>;
  @useResult
  $Res call({String collection});
}

/// @nodoc
class _$FirestoreFailureCopyWithImpl<$Res, $Val extends FirestoreFailure>
    implements $FirestoreFailureCopyWith<$Res> {
  _$FirestoreFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirestoreDocumentDoesNotExistImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreDocumentDoesNotExistImplCopyWith(
          _$FirestoreDocumentDoesNotExistImpl value,
          $Res Function(_$FirestoreDocumentDoesNotExistImpl) then) =
      __$$FirestoreDocumentDoesNotExistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String id});
}

/// @nodoc
class __$$FirestoreDocumentDoesNotExistImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res,
        _$FirestoreDocumentDoesNotExistImpl>
    implements _$$FirestoreDocumentDoesNotExistImplCopyWith<$Res> {
  __$$FirestoreDocumentDoesNotExistImplCopyWithImpl(
      _$FirestoreDocumentDoesNotExistImpl _value,
      $Res Function(_$FirestoreDocumentDoesNotExistImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? id = null,
  }) {
    return _then(_$FirestoreDocumentDoesNotExistImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreDocumentDoesNotExistImpl
    extends FirestoreDocumentDoesNotExist {
  const _$FirestoreDocumentDoesNotExistImpl(
      {required this.collection, required this.id})
      : super._();

  @override
  final String collection;
  @override
  final String id;

  @override
  String toString() {
    return 'FirestoreFailure.documentDoesNotExist(collection: $collection, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreDocumentDoesNotExistImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, id);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreDocumentDoesNotExistImplCopyWith<
          _$FirestoreDocumentDoesNotExistImpl>
      get copyWith => __$$FirestoreDocumentDoesNotExistImplCopyWithImpl<
          _$FirestoreDocumentDoesNotExistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return documentDoesNotExist(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return documentDoesNotExist?.call(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (documentDoesNotExist != null) {
      return documentDoesNotExist(collection, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return documentDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return documentDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (documentDoesNotExist != null) {
      return documentDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class FirestoreDocumentDoesNotExist extends FirestoreFailure {
  const factory FirestoreDocumentDoesNotExist(
      {required final String collection,
      required final String id}) = _$FirestoreDocumentDoesNotExistImpl;
  const FirestoreDocumentDoesNotExist._() : super._();

  @override
  String get collection;
  String get id;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreDocumentDoesNotExistImplCopyWith<
          _$FirestoreDocumentDoesNotExistImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreNoInternetImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreNoInternetImplCopyWith(_$FirestoreNoInternetImpl value,
          $Res Function(_$FirestoreNoInternetImpl) then) =
      __$$FirestoreNoInternetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String id});
}

/// @nodoc
class __$$FirestoreNoInternetImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res, _$FirestoreNoInternetImpl>
    implements _$$FirestoreNoInternetImplCopyWith<$Res> {
  __$$FirestoreNoInternetImplCopyWithImpl(_$FirestoreNoInternetImpl _value,
      $Res Function(_$FirestoreNoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? id = null,
  }) {
    return _then(_$FirestoreNoInternetImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreNoInternetImpl extends FirestoreNoInternet {
  const _$FirestoreNoInternetImpl({required this.collection, required this.id})
      : super._();

  @override
  final String collection;
  @override
  final String id;

  @override
  String toString() {
    return 'FirestoreFailure.noInternet(collection: $collection, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreNoInternetImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, id);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreNoInternetImplCopyWith<_$FirestoreNoInternetImpl> get copyWith =>
      __$$FirestoreNoInternetImplCopyWithImpl<_$FirestoreNoInternetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return noInternet(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return noInternet?.call(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(collection, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class FirestoreNoInternet extends FirestoreFailure {
  const factory FirestoreNoInternet(
      {required final String collection,
      required final String id}) = _$FirestoreNoInternetImpl;
  const FirestoreNoInternet._() : super._();

  @override
  String get collection;
  String get id;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreNoInternetImplCopyWith<_$FirestoreNoInternetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreFailureUnauthorizedImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreFailureUnauthorizedImplCopyWith(
          _$FirestoreFailureUnauthorizedImpl value,
          $Res Function(_$FirestoreFailureUnauthorizedImpl) then) =
      __$$FirestoreFailureUnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String id});
}

/// @nodoc
class __$$FirestoreFailureUnauthorizedImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res,
        _$FirestoreFailureUnauthorizedImpl>
    implements _$$FirestoreFailureUnauthorizedImplCopyWith<$Res> {
  __$$FirestoreFailureUnauthorizedImplCopyWithImpl(
      _$FirestoreFailureUnauthorizedImpl _value,
      $Res Function(_$FirestoreFailureUnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? id = null,
  }) {
    return _then(_$FirestoreFailureUnauthorizedImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreFailureUnauthorizedImpl extends FirestoreFailureUnauthorized {
  const _$FirestoreFailureUnauthorizedImpl(
      {required this.collection, required this.id})
      : super._();

  @override
  final String collection;
  @override
  final String id;

  @override
  String toString() {
    return 'FirestoreFailure.unauthorized(collection: $collection, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreFailureUnauthorizedImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, id);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreFailureUnauthorizedImplCopyWith<
          _$FirestoreFailureUnauthorizedImpl>
      get copyWith => __$$FirestoreFailureUnauthorizedImplCopyWithImpl<
          _$FirestoreFailureUnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return unauthorized(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return unauthorized?.call(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(collection, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class FirestoreFailureUnauthorized extends FirestoreFailure {
  const factory FirestoreFailureUnauthorized(
      {required final String collection,
      required final String id}) = _$FirestoreFailureUnauthorizedImpl;
  const FirestoreFailureUnauthorized._() : super._();

  @override
  String get collection;
  String get id;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreFailureUnauthorizedImplCopyWith<
          _$FirestoreFailureUnauthorizedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreBundleNotStoredImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreBundleNotStoredImplCopyWith(
          _$FirestoreBundleNotStoredImpl value,
          $Res Function(_$FirestoreBundleNotStoredImpl) then) =
      __$$FirestoreBundleNotStoredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection});
}

/// @nodoc
class __$$FirestoreBundleNotStoredImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res, _$FirestoreBundleNotStoredImpl>
    implements _$$FirestoreBundleNotStoredImplCopyWith<$Res> {
  __$$FirestoreBundleNotStoredImplCopyWithImpl(
      _$FirestoreBundleNotStoredImpl _value,
      $Res Function(_$FirestoreBundleNotStoredImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
  }) {
    return _then(_$FirestoreBundleNotStoredImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreBundleNotStoredImpl extends FirestoreBundleNotStored {
  const _$FirestoreBundleNotStoredImpl({required this.collection}) : super._();

  @override
  final String collection;

  @override
  String toString() {
    return 'FirestoreFailure.bundleNotStored(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreBundleNotStoredImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreBundleNotStoredImplCopyWith<_$FirestoreBundleNotStoredImpl>
      get copyWith => __$$FirestoreBundleNotStoredImplCopyWithImpl<
          _$FirestoreBundleNotStoredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return bundleNotStored(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return bundleNotStored?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (bundleNotStored != null) {
      return bundleNotStored(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return bundleNotStored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return bundleNotStored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (bundleNotStored != null) {
      return bundleNotStored(this);
    }
    return orElse();
  }
}

abstract class FirestoreBundleNotStored extends FirestoreFailure {
  const factory FirestoreBundleNotStored({required final String collection}) =
      _$FirestoreBundleNotStoredImpl;
  const FirestoreBundleNotStored._() : super._();

  @override
  String get collection;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreBundleNotStoredImplCopyWith<_$FirestoreBundleNotStoredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreFailureUnknownImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreFailureUnknownImplCopyWith(
          _$FirestoreFailureUnknownImpl value,
          $Res Function(_$FirestoreFailureUnknownImpl) then) =
      __$$FirestoreFailureUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String id, String? message, String? code});
}

/// @nodoc
class __$$FirestoreFailureUnknownImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res, _$FirestoreFailureUnknownImpl>
    implements _$$FirestoreFailureUnknownImplCopyWith<$Res> {
  __$$FirestoreFailureUnknownImplCopyWithImpl(
      _$FirestoreFailureUnknownImpl _value,
      $Res Function(_$FirestoreFailureUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? id = null,
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$FirestoreFailureUnknownImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FirestoreFailureUnknownImpl extends FirestoreFailureUnknown {
  const _$FirestoreFailureUnknownImpl(
      {required this.collection,
      required this.id,
      required this.message,
      required this.code})
      : super._();

  @override
  final String collection;
  @override
  final String id;
  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'FirestoreFailure.unknown(collection: $collection, id: $id, message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreFailureUnknownImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, id, message, code);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreFailureUnknownImplCopyWith<_$FirestoreFailureUnknownImpl>
      get copyWith => __$$FirestoreFailureUnknownImplCopyWithImpl<
          _$FirestoreFailureUnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return unknown(collection, id, message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return unknown?.call(collection, id, message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(collection, id, message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class FirestoreFailureUnknown extends FirestoreFailure {
  const factory FirestoreFailureUnknown(
      {required final String collection,
      required final String id,
      required final String? message,
      required final String? code}) = _$FirestoreFailureUnknownImpl;
  const FirestoreFailureUnknown._() : super._();

  @override
  String get collection;
  String get id;
  String? get message;
  String? get code;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreFailureUnknownImplCopyWith<_$FirestoreFailureUnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreParseFailureImplCopyWith<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  factory _$$FirestoreParseFailureImplCopyWith(
          _$FirestoreParseFailureImpl value,
          $Res Function(_$FirestoreParseFailureImpl) then) =
      __$$FirestoreParseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String id});
}

/// @nodoc
class __$$FirestoreParseFailureImplCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res, _$FirestoreParseFailureImpl>
    implements _$$FirestoreParseFailureImplCopyWith<$Res> {
  __$$FirestoreParseFailureImplCopyWithImpl(_$FirestoreParseFailureImpl _value,
      $Res Function(_$FirestoreParseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? id = null,
  }) {
    return _then(_$FirestoreParseFailureImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreParseFailureImpl extends FirestoreParseFailure {
  const _$FirestoreParseFailureImpl(
      {required this.collection, required this.id})
      : super._();

  @override
  final String collection;
  @override
  final String id;

  @override
  String toString() {
    return 'FirestoreFailure.parseFailure(collection: $collection, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreParseFailureImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, id);

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreParseFailureImplCopyWith<_$FirestoreParseFailureImpl>
      get copyWith => __$$FirestoreParseFailureImplCopyWithImpl<
          _$FirestoreParseFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection, String id)
        documentDoesNotExist,
    required TResult Function(String collection, String id) noInternet,
    required TResult Function(String collection, String id) unauthorized,
    required TResult Function(String collection) bundleNotStored,
    required TResult Function(
            String collection, String id, String? message, String? code)
        unknown,
    required TResult Function(String collection, String id) parseFailure,
  }) {
    return parseFailure(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection, String id)? documentDoesNotExist,
    TResult? Function(String collection, String id)? noInternet,
    TResult? Function(String collection, String id)? unauthorized,
    TResult? Function(String collection)? bundleNotStored,
    TResult? Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult? Function(String collection, String id)? parseFailure,
  }) {
    return parseFailure?.call(collection, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection, String id)? documentDoesNotExist,
    TResult Function(String collection, String id)? noInternet,
    TResult Function(String collection, String id)? unauthorized,
    TResult Function(String collection)? bundleNotStored,
    TResult Function(
            String collection, String id, String? message, String? code)?
        unknown,
    TResult Function(String collection, String id)? parseFailure,
    required TResult orElse(),
  }) {
    if (parseFailure != null) {
      return parseFailure(collection, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirestoreDocumentDoesNotExist value)
        documentDoesNotExist,
    required TResult Function(FirestoreNoInternet value) noInternet,
    required TResult Function(FirestoreFailureUnauthorized value) unauthorized,
    required TResult Function(FirestoreBundleNotStored value) bundleNotStored,
    required TResult Function(FirestoreFailureUnknown value) unknown,
    required TResult Function(FirestoreParseFailure value) parseFailure,
  }) {
    return parseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirestoreDocumentDoesNotExist value)?
        documentDoesNotExist,
    TResult? Function(FirestoreNoInternet value)? noInternet,
    TResult? Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult? Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult? Function(FirestoreFailureUnknown value)? unknown,
    TResult? Function(FirestoreParseFailure value)? parseFailure,
  }) {
    return parseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirestoreDocumentDoesNotExist value)? documentDoesNotExist,
    TResult Function(FirestoreNoInternet value)? noInternet,
    TResult Function(FirestoreFailureUnauthorized value)? unauthorized,
    TResult Function(FirestoreBundleNotStored value)? bundleNotStored,
    TResult Function(FirestoreFailureUnknown value)? unknown,
    TResult Function(FirestoreParseFailure value)? parseFailure,
    required TResult orElse(),
  }) {
    if (parseFailure != null) {
      return parseFailure(this);
    }
    return orElse();
  }
}

abstract class FirestoreParseFailure extends FirestoreFailure {
  const factory FirestoreParseFailure(
      {required final String collection,
      required final String id}) = _$FirestoreParseFailureImpl;
  const FirestoreParseFailure._() : super._();

  @override
  String get collection;
  String get id;

  /// Create a copy of FirestoreFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreParseFailureImplCopyWith<_$FirestoreParseFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
