import 'package:flutter/material.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
              ))
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
      body: Center(
        child: Image.network(imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}
