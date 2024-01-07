import 'dart:convert';
import 'dart:developer';
import 'package:chopper/chopper.dart';
import 'package:vsig_flutter/models/imageresponse/image_generation_response.dart';
import 'package:vsig_flutter/statemodels/imagegeneraterequest.dart';

// Part file for generated code
part 'openai_image_generation_service.chopper.dart';

@ChopperApi()
abstract class OpenAIImageService extends ChopperService {
  // ####### Generate Image #######
  @FactoryConverter(response: imageresponseconvertor)
  @Post(path: '/images/generations')
  Future<Response<ImageGenerationResponse>> generateImage(
      @Body() ImageGenerationRequest body);

  static OpenAIImageService create() {
    return _$OpenAIImageService();
  }
}

// Define a converter for a single address
Response<ImageGenerationResponse> imageresponseconvertor(Response res) {
  var bodyString = utf8.decode(res.bodyBytes);
  log("single address body response = $bodyString");
  var body = jsonDecode(bodyString);
  body = ImageGenerationResponse.fromJson(body as Map<String, dynamic>);
  return res.copyWith(body: body);
}
