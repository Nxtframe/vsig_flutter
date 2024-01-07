class ImageGenerationRequest {
  final String model;
  final String prompt;
  final int n;
  final String size;

  ImageGenerationRequest({
    required this.model,
    required this.prompt,
    required this.n,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'prompt': prompt,
      'n': n,
      'size': size,
    };
  }
}
