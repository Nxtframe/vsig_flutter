// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_image_generation_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OpenAIImageService extends OpenAIImageService {
  _$OpenAIImageService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OpenAIImageService;

  @override
  Future<Response<ImageGenerationResponse>> generateImage(
      ImageGenerationRequest body) {
    final Uri $url = Uri.parse('/images/generations');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ImageGenerationResponse, ImageGenerationResponse>(
      $request,
      responseConverter: imageresponseconvertor,
    );
  }
}
