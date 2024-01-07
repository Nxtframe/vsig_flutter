// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_generation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageGenerationResponse _$ImageGenerationResponseFromJson(
    Map<String, dynamic> json) {
  return _ImageGenerationResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageGenerationResponse {
  int get created => throw _privateConstructorUsedError;
  List<ImageData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageGenerationResponseCopyWith<ImageGenerationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenerationResponseCopyWith<$Res> {
  factory $ImageGenerationResponseCopyWith(ImageGenerationResponse value,
          $Res Function(ImageGenerationResponse) then) =
      _$ImageGenerationResponseCopyWithImpl<$Res, ImageGenerationResponse>;
  @useResult
  $Res call({int created, List<ImageData> data});
}

/// @nodoc
class _$ImageGenerationResponseCopyWithImpl<$Res,
        $Val extends ImageGenerationResponse>
    implements $ImageGenerationResponseCopyWith<$Res> {
  _$ImageGenerationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ImageData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageGenerationResponseImplCopyWith<$Res>
    implements $ImageGenerationResponseCopyWith<$Res> {
  factory _$$ImageGenerationResponseImplCopyWith(
          _$ImageGenerationResponseImpl value,
          $Res Function(_$ImageGenerationResponseImpl) then) =
      __$$ImageGenerationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int created, List<ImageData> data});
}

/// @nodoc
class __$$ImageGenerationResponseImplCopyWithImpl<$Res>
    extends _$ImageGenerationResponseCopyWithImpl<$Res,
        _$ImageGenerationResponseImpl>
    implements _$$ImageGenerationResponseImplCopyWith<$Res> {
  __$$ImageGenerationResponseImplCopyWithImpl(
      _$ImageGenerationResponseImpl _value,
      $Res Function(_$ImageGenerationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? data = null,
  }) {
    return _then(_$ImageGenerationResponseImpl(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ImageData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageGenerationResponseImpl implements _ImageGenerationResponse {
  const _$ImageGenerationResponseImpl(
      {required this.created, required final List<ImageData> data})
      : _data = data;

  factory _$ImageGenerationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageGenerationResponseImplFromJson(json);

  @override
  final int created;
  final List<ImageData> _data;
  @override
  List<ImageData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ImageGenerationResponse(created: $created, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageGenerationResponseImpl &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, created, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageGenerationResponseImplCopyWith<_$ImageGenerationResponseImpl>
      get copyWith => __$$ImageGenerationResponseImplCopyWithImpl<
          _$ImageGenerationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageGenerationResponseImplToJson(
      this,
    );
  }
}

abstract class _ImageGenerationResponse implements ImageGenerationResponse {
  const factory _ImageGenerationResponse(
      {required final int created,
      required final List<ImageData> data}) = _$ImageGenerationResponseImpl;

  factory _ImageGenerationResponse.fromJson(Map<String, dynamic> json) =
      _$ImageGenerationResponseImpl.fromJson;

  @override
  int get created;
  @override
  List<ImageData> get data;
  @override
  @JsonKey(ignore: true)
  _$$ImageGenerationResponseImplCopyWith<_$ImageGenerationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ImageData _$ImageDataFromJson(Map<String, dynamic> json) {
  return _ImageData.fromJson(json);
}

/// @nodoc
mixin _$ImageData {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDataCopyWith<ImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDataCopyWith<$Res> {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) then) =
      _$ImageDataCopyWithImpl<$Res, ImageData>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ImageDataCopyWithImpl<$Res, $Val extends ImageData>
    implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ImageDataImplCopyWith<$Res>
    implements $ImageDataCopyWith<$Res> {
  factory _$$ImageDataImplCopyWith(
          _$ImageDataImpl value, $Res Function(_$ImageDataImpl) then) =
      __$$ImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ImageDataImplCopyWithImpl<$Res>
    extends _$ImageDataCopyWithImpl<$Res, _$ImageDataImpl>
    implements _$$ImageDataImplCopyWith<$Res> {
  __$$ImageDataImplCopyWithImpl(
      _$ImageDataImpl _value, $Res Function(_$ImageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$ImageDataImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDataImpl implements _ImageData {
  const _$ImageDataImpl({required this.url});

  factory _$ImageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDataImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'ImageData(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDataImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDataImplCopyWith<_$ImageDataImpl> get copyWith =>
      __$$ImageDataImplCopyWithImpl<_$ImageDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDataImplToJson(
      this,
    );
  }
}

abstract class _ImageData implements ImageData {
  const factory _ImageData({required final String url}) = _$ImageDataImpl;

  factory _ImageData.fromJson(Map<String, dynamic> json) =
      _$ImageDataImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ImageDataImplCopyWith<_$ImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
