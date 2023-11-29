import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class ImageAdjustScreen extends StatefulWidget {
  const ImageAdjustScreen({super.key});

  @override
  State<ImageAdjustScreen> createState() => _ImageAdjustScreenState();
}

class _ImageAdjustScreenState extends State<ImageAdjustScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Adjust"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Select an image from the gallery using the [ImagePicker].
              // highlight-select-resource
              final imagePicker = ImagePicker();
              final image =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              final imagePath = image?.path;
              if (imagePath == null) return;
              // highlight-select-resource

              // Open the photo editor and handle the export as well as any occurring errors.
              // highlight-open-editor
              // final result = await PESDK.openEditor(image: imagePath);
              final result = "";
              // highlight-open-editor

              if (result != null) {
                // print(result.image);
              } else {
                return;
              }
            } catch (error) {
              print(error);
            }
          },
          child: const Text("Press"),
        ),
      ),
    );
  }
}
