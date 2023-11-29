// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:photo_id_maker/HomePage.dart';

class SmoothnessScreen extends StatefulWidget {
  const SmoothnessScreen({super.key});

  @override
  _SmoothnessScreenState createState() => _SmoothnessScreenState();
}

class _SmoothnessScreenState extends State<SmoothnessScreen> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Smoothness Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image with blur effect based on slider value
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(imageSource),
                  // Replace with your image path
                  fit: BoxFit.cover,
                ),
                color: Colors.blue
                    .withOpacity(0.5), // Adjust the color overlay as needed
              ),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                    sigmaX: _sliderValue, sigmaY: _sliderValue),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Slider to control the smoothness
            Slider(
              value: _sliderValue,
              min: 0.0,
              max: 10.0,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
