import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generation_response.freezed.dart';
part 'image_generation_response.g.dart';

@freezed
class ImageGenerationResponse with _$ImageGenerationResponse {
  const factory ImageGenerationResponse({
    required int created,
    required List<ImageData> data,
  }) = _ImageGenerationResponse;

  factory ImageGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationResponseFromJson(json);
}

@freezed
class ImageData with _$ImageData {
  const factory ImageData({
    required String url,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}
