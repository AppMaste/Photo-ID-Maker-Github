import 'package:flutter/material.dart';
import 'package:photo_id_maker/main.dart';

class ImageRepair extends StatefulWidget {
  const ImageRepair({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageRepairState createState() => _ImageRepairState();
}

class _ImageRepairState extends State<ImageRepair> {
  int _tapCount = 0;
  Key _imageKey = UniqueKey();

  void _repairImage() {
    setState(() {
      // Change the key to force the widget to rebuild and reload the image
      _imageKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Image Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image that can be repaired
            Image(
              key: _imageKey,
              image: NetworkImage(imageSource),
              // Replace with your image path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Button to repair the image
            ElevatedButton(
              onPressed: () {
                setState(() {
                _repairImage();
                _tapCount++;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Image repaired $_tapCount times'),
                  ),
                );
              },
              child: const Text('Repair Image'),
            ),
          ],
        ),
      ),
    );
  }
}
