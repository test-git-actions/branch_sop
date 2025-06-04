// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entertainment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntertainmentState {
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get deepLinkURL => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  OGMetadata? get metadata => throw _privateConstructorUsedError;
  Set<Filter> get selectedCategoriesFilters =>
      throw _privateConstructorUsedError;
  Set<Property> get selectedProperties => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)
        formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)?
        formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)?
        formData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FormData value) formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FormData value)? formData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FormData value)? formData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of EntertainmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntertainmentStateCopyWith<EntertainmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntertainmentStateCopyWith<$Res> {
  factory $EntertainmentStateCopyWith(
          EntertainmentState value, $Res Function(EntertainmentState) then) =
      _$EntertainmentStateCopyWithImpl<$Res, EntertainmentState>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? deepLinkURL,
      String? errorMessage,
      OGMetadata? metadata,
      Set<Filter> selectedCategoriesFilters,
      Set<Property> selectedProperties,
      bool isLoading});
}

/// @nodoc
class _$EntertainmentStateCopyWithImpl<$Res, $Val extends EntertainmentState>
    implements $EntertainmentStateCopyWith<$Res> {
  _$EntertainmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntertainmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deepLinkURL = freezed,
    Object? errorMessage = freezed,
    Object? metadata = freezed,
    Object? selectedCategoriesFilters = null,
    Object? selectedProperties = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deepLinkURL: freezed == deepLinkURL
          ? _value.deepLinkURL
          : deepLinkURL // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as OGMetadata?,
      selectedCategoriesFilters: null == selectedCategoriesFilters
          ? _value.selectedCategoriesFilters
          : selectedCategoriesFilters // ignore: cast_nullable_to_non_nullable
              as Set<Filter>,
      selectedProperties: null == selectedProperties
          ? _value.selectedProperties
          : selectedProperties // ignore: cast_nullable_to_non_nullable
              as Set<Property>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormDataImplCopyWith<$Res>
    implements $EntertainmentStateCopyWith<$Res> {
  factory _$$FormDataImplCopyWith(
          _$FormDataImpl value, $Res Function(_$FormDataImpl) then) =
      __$$FormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? deepLinkURL,
      String? errorMessage,
      OGMetadata? metadata,
      Set<Filter> selectedCategoriesFilters,
      Set<Property> selectedProperties,
      bool isLoading});
}

/// @nodoc
class __$$FormDataImplCopyWithImpl<$Res>
    extends _$EntertainmentStateCopyWithImpl<$Res, _$FormDataImpl>
    implements _$$FormDataImplCopyWith<$Res> {
  __$$FormDataImplCopyWithImpl(
      _$FormDataImpl _value, $Res Function(_$FormDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntertainmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deepLinkURL = freezed,
    Object? errorMessage = freezed,
    Object? metadata = freezed,
    Object? selectedCategoriesFilters = null,
    Object? selectedProperties = null,
    Object? isLoading = null,
  }) {
    return _then(_$FormDataImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deepLinkURL: freezed == deepLinkURL
          ? _value.deepLinkURL
          : deepLinkURL // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as OGMetadata?,
      selectedCategoriesFilters: null == selectedCategoriesFilters
          ? _value._selectedCategoriesFilters
          : selectedCategoriesFilters // ignore: cast_nullable_to_non_nullable
              as Set<Filter>,
      selectedProperties: null == selectedProperties
          ? _value._selectedProperties
          : selectedProperties // ignore: cast_nullable_to_non_nullable
              as Set<Property>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormDataImpl implements _FormData {
  const _$FormDataImpl(
      {this.startDate,
      this.endDate,
      this.deepLinkURL,
      this.errorMessage,
      this.metadata,
      final Set<Filter> selectedCategoriesFilters = const {},
      final Set<Property> selectedProperties = const {},
      this.isLoading = false})
      : _selectedCategoriesFilters = selectedCategoriesFilters,
        _selectedProperties = selectedProperties;

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? deepLinkURL;
  @override
  final String? errorMessage;
  @override
  final OGMetadata? metadata;
  final Set<Filter> _selectedCategoriesFilters;
  @override
  @JsonKey()
  Set<Filter> get selectedCategoriesFilters {
    if (_selectedCategoriesFilters is EqualUnmodifiableSetView)
      return _selectedCategoriesFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedCategoriesFilters);
  }

  final Set<Property> _selectedProperties;
  @override
  @JsonKey()
  Set<Property> get selectedProperties {
    if (_selectedProperties is EqualUnmodifiableSetView)
      return _selectedProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedProperties);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'EntertainmentState.formData(startDate: $startDate, endDate: $endDate, deepLinkURL: $deepLinkURL, errorMessage: $errorMessage, metadata: $metadata, selectedCategoriesFilters: $selectedCategoriesFilters, selectedProperties: $selectedProperties, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormDataImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.deepLinkURL, deepLinkURL) ||
                other.deepLinkURL == deepLinkURL) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(
                other._selectedCategoriesFilters, _selectedCategoriesFilters) &&
            const DeepCollectionEquality()
                .equals(other._selectedProperties, _selectedProperties) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      deepLinkURL,
      errorMessage,
      metadata,
      const DeepCollectionEquality().hash(_selectedCategoriesFilters),
      const DeepCollectionEquality().hash(_selectedProperties),
      isLoading);

  /// Create a copy of EntertainmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormDataImplCopyWith<_$FormDataImpl> get copyWith =>
      __$$FormDataImplCopyWithImpl<_$FormDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)
        formData,
  }) {
    return formData(startDate, endDate, deepLinkURL, errorMessage, metadata,
        selectedCategoriesFilters, selectedProperties, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)?
        formData,
  }) {
    return formData?.call(startDate, endDate, deepLinkURL, errorMessage,
        metadata, selectedCategoriesFilters, selectedProperties, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? startDate,
            DateTime? endDate,
            String? deepLinkURL,
            String? errorMessage,
            OGMetadata? metadata,
            Set<Filter> selectedCategoriesFilters,
            Set<Property> selectedProperties,
            bool isLoading)?
        formData,
    required TResult orElse(),
  }) {
    if (formData != null) {
      return formData(startDate, endDate, deepLinkURL, errorMessage, metadata,
          selectedCategoriesFilters, selectedProperties, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FormData value) formData,
  }) {
    return formData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FormData value)? formData,
  }) {
    return formData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FormData value)? formData,
    required TResult orElse(),
  }) {
    if (formData != null) {
      return formData(this);
    }
    return orElse();
  }
}

abstract class _FormData implements EntertainmentState {
  const factory _FormData(
      {final DateTime? startDate,
      final DateTime? endDate,
      final String? deepLinkURL,
      final String? errorMessage,
      final OGMetadata? metadata,
      final Set<Filter> selectedCategoriesFilters,
      final Set<Property> selectedProperties,
      final bool isLoading}) = _$FormDataImpl;

  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get deepLinkURL;
  @override
  String? get errorMessage;
  @override
  OGMetadata? get metadata;
  @override
  Set<Filter> get selectedCategoriesFilters;
  @override
  Set<Property> get selectedProperties;
  @override
  bool get isLoading;

  /// Create a copy of EntertainmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormDataImplCopyWith<_$FormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
