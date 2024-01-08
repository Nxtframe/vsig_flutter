import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class FullScreenImagePage extends StatefulWidget {
  final List<String> imageUrl;

  const FullScreenImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  State<FullScreenImagePage> createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  bool _isDownloading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var i = 0; i < widget.imageUrl.length && i < 5; i++) {
      precacheImage(NetworkImage(widget.imageUrl[i]), context);
    }
  }

  Future<void> _saveImage() async {
    // Check and request storage permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // Get the image URL
    String imageUrl = widget.imageUrl[currentPageIndex];

    try {
      setState(() {
        //set isDownloading to true
        _isDownloading = true;
      });

      // Get the application documents directory path
      var dir = await getApplicationDocumentsDirectory();
      String folderPath = '${dir.path}/svigdownloads';

      final uuid = const Uuid().v4();
      // Check if the svigdownloads folder exists, if not create it
      final folder = Directory(folderPath);
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }

      // Use Dio to download the image to the svigdownloads folder
      Dio dio = Dio();
      await dio.download(imageUrl, '$folderPath/image_$uuid.jpg').then((value) {
        setState(() {
          _isDownloading = false;
        });
      });

      // Check if the widget is still mounted before updating the UI
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved to $folderPath')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save image: $e')),
        );
      }
    }
  }

  int currentPageIndex = 0; // The page intial index

  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    final PageController pageController =
        PageController(); // Page controller for the PageView

    return Scaffold(
      appBar: AppBar(
        actions: [
          _isDownloading
              ? const SizedBox(
                  width: 24,
                  height: 25,
                  child: LinearProgressIndicator(),
                )
              : const SizedBox.shrink(),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _saveImage, // Save button
          ),
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
            itemCount: widget.imageUrl.length,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index; // Update index on page change
              });
            },
            itemBuilder: (context, index) {
              return _buildImageWithLoader(index);
            },
          ),
          // Left arrow
          Positioned(
              //Page index indicator
              top: 10,
              child: Text(
                '${currentPageIndex + 1}/${widget.imageUrl.length}', // Current index/Total count
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Positioned(
            //Previous button
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_left, color: Colors.black),
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
              icon: const Icon(Icons.arrow_right, color: Colors.black),
              onPressed: () {
                if (pageController.hasClients &&
                    pageController.page! < widget.imageUrl.length - 1) {
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

  Widget _buildImageWithLoader(int index) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.network(
          widget.imageUrl[index],
          fit: BoxFit.contain,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(
                  //Show progress indicator of image loading
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text('Error loading image'), // Error handling
            );
          },
        ),
      ],
    );
  }
}
