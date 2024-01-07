import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';

part 'error_response.g.dart';

@Freezed()
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @Default("") String code,
    @Default("") String message,
    @Default("") String param,
    @Default("") String type,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
