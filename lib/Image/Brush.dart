// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:photo_id_maker/HomePage.dart';


class BrushScreen extends StatefulWidget {
  const BrushScreen({super.key});

  @override
  _BrushScreenState createState() => _BrushScreenState();
}

class _BrushScreenState extends State<BrushScreen> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Brush Size Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image with adjustable opacity
            Opacity(
              opacity: _opacity,
              child: Image.network(
                imageSource, // Replace with your image path
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Slider to control the opacity
            Slider(
              value: _opacity,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  _opacity = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  final double brushSize;

  ImagePainter({required this.brushSize});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Set your brush color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = brushSize;

    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw a simple line as an example; you can replace this with your image drawing logic
    canvas.drawLine(center, center + const Offset(50, 50), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
