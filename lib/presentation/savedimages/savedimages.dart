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
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ]),
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
