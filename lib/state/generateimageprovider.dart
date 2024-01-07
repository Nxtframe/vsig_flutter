import 'package:flutter/foundation.dart';
import 'package:vsig_flutter/models/imageresponse/image_generation_response.dart';
import 'package:vsig_flutter/network/network_services.dart/openai_image_generation_service.dart';
import 'package:vsig_flutter/network/vsig_chopper_client.dart';
import 'package:vsig_flutter/statemodels/imagegeneraterequest.dart';

class GenerateImageProvider extends ChangeNotifier {
  // List to store image URLs
  List<String> generatedImagesUrls =
      []; //Stroring the images here incase I want to revist them

  Future<List<String>> generateimage({
    required String prompt,
    required int numberofimages,
    required String sizes,
  }) async {
    final openaiimageapi =
        VsigClient.instance.client.getService<OpenAIImageService>();
    final ImageGenerationRequest imagerequest = ImageGenerationRequest(
        model: "dall-e-2", n: numberofimages, prompt: prompt, size: sizes);

    try {
      final imageresponse = await openaiimageapi.generateImage(imagerequest);

      if (imageresponse.isSuccessful && imageresponse.body != null) {
        final List<ImageData> imageData = imageresponse.body!.data;
        generatedImagesUrls = imageData.map((data) => data.url).toList();

        notifyListeners(); // Notify listeners after updating the list
        return generatedImagesUrls;
      } else {
        // Handle error in case it returns a response 200 but no url
        throw Exception(
            "Error in generating image either due to openai limit rate or API token are finished");
      }
    } catch (e) {
      // Handle any exceptions
      throw Exception(
          "Error in generating image either due to openai limit rate or API token are finished");
    }
  }
}
