import 'dart:async';

import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor {
  final String apiKey;

  HeaderInterceptor(this.apiKey);

  @override
  FutureOr<Request> onRequest(Request request) async {
    // Add the 'Authorization' header to the request
    return applyHeader(request, 'Authorization', 'Bearer $apiKey');
  }
}
