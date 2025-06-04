// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
mixin _$Offer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get customCTA => throw _privateConstructorUsedError;
  ContentType get contentType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  OfferImage get image => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get customUrl => throw _privateConstructorUsedError;
  List<String>? get properties => throw _privateConstructorUsedError;

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res, Offer>;
  @useResult
  $Res call(
      {String id,
      String name,
      String customCTA,
      ContentType contentType,
      String description,
      OfferImage image,
      String? path,
      String? customUrl,
      List<String>? properties});

  $OfferImageCopyWith<$Res> get image;
}

/// @nodoc
class _$OfferCopyWithImpl<$Res, $Val extends Offer>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? customCTA = null,
    Object? contentType = null,
    Object? description = null,
    Object? image = null,
    Object? path = freezed,
    Object? customUrl = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customCTA: null == customCTA
          ? _value.customCTA
          : customCTA // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OfferImage,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      customUrl: freezed == customUrl
          ? _value.customUrl
          : customUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferImageCopyWith<$Res> get image {
    return $OfferImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfferImplCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$$OfferImplCopyWith(
          _$OfferImpl value, $Res Function(_$OfferImpl) then) =
      __$$OfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String customCTA,
      ContentType contentType,
      String description,
      OfferImage image,
      String? path,
      String? customUrl,
      List<String>? properties});

  @override
  $OfferImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$OfferImplCopyWithImpl<$Res>
    extends _$OfferCopyWithImpl<$Res, _$OfferImpl>
    implements _$$OfferImplCopyWith<$Res> {
  __$$OfferImplCopyWithImpl(
      _$OfferImpl _value, $Res Function(_$OfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? customCTA = null,
    Object? contentType = null,
    Object? description = null,
    Object? image = null,
    Object? path = freezed,
    Object? customUrl = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$OfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customCTA: null == customCTA
          ? _value.customCTA
          : customCTA // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OfferImage,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      customUrl: freezed == customUrl
          ? _value.customUrl
          : customUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$OfferImpl implements _Offer {
  const _$OfferImpl(
      {required this.id,
      required this.name,
      required this.customCTA,
      required this.contentType,
      required this.description,
      required this.image,
      required this.path,
      required this.customUrl,
      required final List<String>? properties})
      : _properties = properties;

  factory _$OfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String customCTA;
  @override
  final ContentType contentType;
  @override
  final String description;
  @override
  final OfferImage image;
  @override
  final String? path;
  @override
  final String? customUrl;
  final List<String>? _properties;
  @override
  List<String>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Offer(id: $id, name: $name, customCTA: $customCTA, contentType: $contentType, description: $description, image: $image, path: $path, customUrl: $customUrl, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customCTA, customCTA) ||
                other.customCTA == customCTA) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.customUrl, customUrl) ||
                other.customUrl == customUrl) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      customCTA,
      contentType,
      description,
      image,
      path,
      customUrl,
      const DeepCollectionEquality().hash(_properties));

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      __$$OfferImplCopyWithImpl<_$OfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferImplToJson(
      this,
    );
  }
}

abstract class _Offer implements Offer {
  const factory _Offer(
      {required final String id,
      required final String name,
      required final String customCTA,
      required final ContentType contentType,
      required final String description,
      required final OfferImage image,
      required final String? path,
      required final String? customUrl,
      required final List<String>? properties}) = _$OfferImpl;

  factory _Offer.fromJson(Map<String, dynamic> json) = _$OfferImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get customCTA;
  @override
  ContentType get contentType;
  @override
  String get description;
  @override
  OfferImage get image;
  @override
  String? get path;
  @override
  String? get customUrl;
  @override
  List<String>? get properties;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfferImage _$OfferImageFromJson(Map<String, dynamic> json) {
  return _OfferImage.fromJson(json);
}

/// @nodoc
mixin _$OfferImage {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this OfferImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferImageCopyWith<OfferImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferImageCopyWith<$Res> {
  factory $OfferImageCopyWith(
          OfferImage value, $Res Function(OfferImage) then) =
      _$OfferImageCopyWithImpl<$Res, OfferImage>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$OfferImageCopyWithImpl<$Res, $Val extends OfferImage>
    implements $OfferImageCopyWith<$Res> {
  _$OfferImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferImageImplCopyWith<$Res>
    implements $OfferImageCopyWith<$Res> {
  factory _$$OfferImageImplCopyWith(
          _$OfferImageImpl value, $Res Function(_$OfferImageImpl) then) =
      __$$OfferImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$OfferImageImplCopyWithImpl<$Res>
    extends _$OfferImageCopyWithImpl<$Res, _$OfferImageImpl>
    implements _$$OfferImageImplCopyWith<$Res> {
  __$$OfferImageImplCopyWithImpl(
      _$OfferImageImpl _value, $Res Function(_$OfferImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$OfferImageImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferImageImpl implements _OfferImage {
  const _$OfferImageImpl({required this.url});

  factory _$OfferImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferImageImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'OfferImage(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferImageImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of OfferImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferImageImplCopyWith<_$OfferImageImpl> get copyWith =>
      __$$OfferImageImplCopyWithImpl<_$OfferImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferImageImplToJson(
      this,
    );
  }
}

abstract class _OfferImage implements OfferImage {
  const factory _OfferImage({required final String url}) = _$OfferImageImpl;

  factory _OfferImage.fromJson(Map<String, dynamic> json) =
      _$OfferImageImpl.fromJson;

  @override
  String get url;

  /// Create a copy of OfferImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferImageImplCopyWith<_$OfferImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
