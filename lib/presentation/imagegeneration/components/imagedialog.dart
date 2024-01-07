import 'package:flutter/material.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class FullScreenImagePage extends StatelessWidget {
  final List<String> imageUrl;

  const FullScreenImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    final PageController pageController =
        PageController(); // Page controller for the PageView

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          )
        ],
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 71, 71, 215)),
        title: Text(
          'Generated Image',
          style: responsivetextstyle.getCustomTextStyle(
              color: const Color.fromARGB(255, 59, 59, 206)),
        ),
        backgroundColor: const Color.fromARGB(82, 182, 225, 10),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 220),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: imageUrl.length,
            itemBuilder: (context, index) {
              return Image.network(imageUrl[index], fit: BoxFit.contain);
            },
          ),
          // Left arrow
          Positioned(
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_left, color: Colors.white),
              onPressed: () {
                if (pageController.hasClients && pageController.page! > 0) {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
            ),
          ),
          // Right arrow
          Positioned(
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_right, color: Colors.white),
              onPressed: () {
                if (pageController.hasClients &&
                    pageController.page! < imageUrl.length - 1) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
