import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:vsig_flutter/models/error/error_response.dart';
import 'package:vsig_flutter/network/header_interceptor.dart';

class VsigClient {
  static final VsigClient instance = VsigClient._();
  final String apikey = "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";
  late final ChopperClient client;

  VsigClient._() {
    client = ChopperClient(
        baseUrl: Uri.parse('https://api.openai.com/v1/'),
        services: [],
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
