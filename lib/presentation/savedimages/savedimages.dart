import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SavedImages extends StatefulWidget {
  const SavedImages({super.key});

  @override
  State<SavedImages> createState() => _SavedImagesState();
}

class _SavedImagesState extends State<SavedImages> {
  List<File> savedImages = [];
  int? selectedImageIndex; // selected image index

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    //Function to load images

    final dir = await getApplicationDocumentsDirectory();
    final imageDirectory = Directory('${dir.path}/svigdownloads');

    // Create the directory already if it doesn't exist
    if (!await imageDirectory.exists()) {
      await imageDirectory.create(recursive: true);
    }

    setState(() {
      savedImages = imageDirectory
          .listSync()
          .where((item) =>
              item.path.endsWith('.jpg') || item.path.endsWith('.png'))
          .map((item) => File(item.path))
          .toList();
    });
  }

  void _showImageDialog(File imageFile) {
    //Function to show the image in a dialog box
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Image.file(imageFile, fit: BoxFit.cover),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshImages() async {
    //WHen pulled down and refreshed
    await _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: _refreshImages,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: savedImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImageIndex =
                        index; // Update the selected image index
                    _showImageDialog(savedImages[index]);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: selectedImageIndex == index
                        ? Border.all(
                            color: Colors.blue,
                            width: 3) // Highlight selected image
                        : null,
                  ),
                  child: Image.file(savedImages[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
