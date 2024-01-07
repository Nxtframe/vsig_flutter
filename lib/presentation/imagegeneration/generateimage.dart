import 'package:flutter/material.dart';
import 'package:vsig_flutter/presentation/imagegeneration/components/imagedialog.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class ImageGenerate extends StatefulWidget {
  const ImageGenerate({super.key});

  @override
  State<ImageGenerate> createState() => _ImageGenerateState();
}

class _ImageGenerateState extends State<ImageGenerate> {
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key
  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 217, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generateImage,
            child: const Text('Generate Image'),
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

      String imageUrl =
          'https://i.seadn.io/gae/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc?auto=format&dpr=1&w=1000'; // Replace with actual image generation logic

      // Now showing the dialog with the image
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FullScreenImagePage(imageUrl: imageUrl);
        },
      );
      // Your existing logic to show the image
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
