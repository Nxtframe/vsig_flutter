import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vsig_flutter/models/error/error_response.dart';
import 'package:vsig_flutter/network/header_interceptor.dart';
import 'package:vsig_flutter/network/network_services.dart/openai_image_generation_service.dart';

class VsigClient {
  late final String apikey;
  static final VsigClient instance = VsigClient._();
  final envapikey = dotenv.env['openaiApiKey']; //Environment Api key
  late final ChopperClient client;

  VsigClient._() {
    final envapikey =
        dotenv.env['openaiApiKey']; // Accessing environment variable
    apikey = envapikey ?? "";
    client = ChopperClient(
        baseUrl: Uri.parse('https://api.openai.com/v1/'),
        services: [OpenAIImageService.create()],
        converter: const JsonConverter(),
        interceptors: [
          HeaderInterceptor(apikey)
        ], //Header Interceptor with API Key
        errorConverter: ErrorResponseConvertor());
  }
}

class ErrorResponseConvertor implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    var errorObject = jsonDecode(response.bodyString);
    ErrorResponse errorResponse = ErrorResponse.fromJson(errorObject);
    return response.copyWith(body: errorResponse);
  }
}
