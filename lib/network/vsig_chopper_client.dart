import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:vsig_flutter/models/error/error_response.dart';
import 'package:vsig_flutter/network/header_interceptor.dart';
import 'package:vsig_flutter/network/network_services.dart/openai_image_generation_service.dart';

class VsigClient {
  static final VsigClient instance = VsigClient._();
  final String apikey = "sk-fDI0rTbi8hP4kvmU1j5QT3BlbkFJgl7TEmDqTm3tJEmd7I";
  late final ChopperClient client;

  VsigClient._() {
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
