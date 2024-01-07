import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsig_flutter/presentation/imagegeneration/components/imagedialog.dart';
import 'package:vsig_flutter/state/generateimageprovider.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class ImageGenerate extends StatefulWidget {
  const ImageGenerate({super.key});

  @override
  State<ImageGenerate> createState() => _ImageGenerateState();
}

class _ImageGenerateState extends State<ImageGenerate> {
  bool _isLoading = false; // Loading state
  final TextEditingController _textController =
      TextEditingController(); //Prompt
  String _error = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key
  int _selectedNumber = 1; // No of images to generate
  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 217, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _error != ""
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _error,
                    style: responsivetextstyle.getCustomTextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 221, 43, 43)),
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Associate the form key
              child: TextFormField(
                controller: _textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image prompt';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: responsivetextstyle.getCustomTextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 214, 82, 72)),
                  errorBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 206, 66, 56))),
                  hintText: 'Enter Image Prompt',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Choose no of Images:",
                  style: responsivetextstyle.getCustomTextStyle(fontSize: 14)),
              const SizedBox(
                width: 20,
              ),
              DropdownButton<int>(
                value: _selectedNumber,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
                dropdownColor: Colors
                    .lightBlueAccent, // Background color of the dropdown menu
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(
                        color: Colors
                            .black, // Color of the text inside the dropdown menu
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedNumber = newValue!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 21, 39, 202),
              backgroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _generateImage,
            child: _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  )
                : const Text('Generate Image'),
          ),
          // const Spacer(),
          // Align(   //Tried to add a Rive animation but failed because the animation is not what I desired
          //   alignment: Alignment.bottomCenter,
          //   child: SizedBox(
          //     // decoration:
          //     //     BoxDecoration(borderRadius: BorderRadius.circular(50)),
          //     height: screenHeight(context) * 0.5,
          //     width: screenWidth(context) * 1,
          //     child: const RiveAnimation.asset(
          //       "assets/animations/sassy_cocoro.riv",
          //       animations: ['talk'],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _generateImage() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed to generate the image
      final generateimageprovider = context.read<GenerateImageProvider>();
      setState(() {
        _isLoading = true; // Start loading
        _error = "";
      });
      try {
        final generatedimageurls = await generateimageprovider
            .generateimage(
                prompt: _textController.text,
                numberofimages: _selectedNumber,
                sizes: "1080x1980")
            .then((value) => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FullScreenImagePage(imageUrl: value);
                  },
                ))
            .whenComplete(() {
          setState(() {
            _isLoading = false; // Stop loading after completion
          });
        });

        // Your existing logic to show the image
      } catch (e) {
        setState(() {
          _error =
              "Please wait 1 min because of the rate limit of OpenAPI I can only generate 1-3 image per min";
        });
      }
    }

    // Here you would typically have your logic to generate an image based on the text.
    // For demonstration, let's just use a sample image URL.
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
