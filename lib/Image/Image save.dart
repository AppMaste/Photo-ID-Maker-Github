// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:photo_id_maker/main.dart';

Future<void> saveImageWithDifferentSizes(String imagePath) async {
  // Load the original image
  File originalFile = File(imagePath);
  Uint8List bytes = await originalFile.readAsBytes();
  img.Image originalImage = img.decodeImage(Uint8List.fromList(bytes))!;

  // Define different sizes
  List<int> targetSizes = [100, 200, 300]; // Add more sizes as needed

  for (int size in targetSizes) {
    // Resize the image
    img.Image resizedImage =
        img.copyResize(originalImage, width: size, height: size);

    // Get the documents directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String savePath = '${documentsDirectory.path}/image_$size.jpg';

    // Save the resized image
    File resizedFile = File(savePath);
    await resizedFile.writeAsBytes(img.encodeJpg(resizedImage));

    // Optionally, you can use the resized image or file as needed
    // resizedImage can be used directly or savePath for file operations
  }

  print('Images saved with different sizes.');
}

class ImageSave extends StatelessWidget {
  ImageSave({super.key}); // Replace with your image path

  String imagePath = "assets/amazon-river-basin.jpg";
  static const _url =
      'https://upload.wikimedia.org/wikipedia/en/8/86/Einstein_tongue.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Images with Different Sizes'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // await saveImageWithDifferentSizes(imagePath);
            _saveImage(context);
          },
          child: const Text('Save Images'),
        ),
      ),
    );
  }
  Future<void> _saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(_url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }
}



