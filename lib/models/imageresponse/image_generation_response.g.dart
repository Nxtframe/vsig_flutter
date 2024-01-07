// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageGenerationResponseImpl _$$ImageGenerationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageGenerationResponseImpl(
      created: json['created'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageGenerationResponseImplToJson(
        _$ImageGenerationResponseImpl instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data,
    };

_$ImageDataImpl _$$ImageDataImplFromJson(Map<String, dynamic> json) =>
    _$ImageDataImpl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ImageDataImplToJson(_$ImageDataImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
