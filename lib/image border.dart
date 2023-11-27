// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fx/simple_fx.dart';

class ImageBorder extends StatefulWidget {
  const ImageBorder({super.key});

  @override
  State<ImageBorder> createState() => _ImageBorderState();
}

class _ImageBorderState extends State<ImageBorder> {
  var Value = 5.0.obs;
  var brightnessValue = 0.0.obs;
  var contrastValue = 0.0.obs;
  var saturationValue = 100.0.obs;
  var sharpnessValue = 0.0.obs;

  var brightness = true.obs;
  var contrast = false.obs;
  var saturation = false.obs;
  var sharpness = false.obs;

  Color color = const Color(0xFFAEDEEC);

  String imageSource = "https://blmparis.files.wordpress.com/2014/07/day.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Change Image Border"),
      ),
      body: Center(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      // image: const DecorationImage(
                      //   image: NetworkImage(
                      //       "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                      //   fit: BoxFit.cover,
                      // ),
                      border: Border.all(
                    color: Colors.red,
                    width: 2,
                  )),
                  child: SimpleFX(
                    imageSource: Image.network(
                      imageSource,
                      fit: BoxFit.cover,
                    ),
                    brightness: brightnessValue.value,
                    saturation: saturationValue.value,
                    // hueRotation: contrastValue.value,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            brightness.value = true;
                            contrast.value = false;
                            saturation.value = false;
                            sharpness.value = false;
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF151515),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: brightness.value == true
                                        ? color
                                        : Colors.white,
                                    width: 1)),
                            child: Icon(
                              Icons.light_mode_sharp,
                              color:
                                  brightness.value == true ? color : Colors.white,
                            ),
                          ),
                        ),
                         const SizedBox(height: 15),
                         Text(
                          "Brightness",
                          style: TextStyle(color: brightness.value == true ? color : Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            brightness.value = false;
                            contrast.value = true;
                            saturation.value = false;
                            sharpness.value = false;
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF151515),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: contrast.value == true
                                        ? color
                                        : Colors.white,
                                    width: 1)),
                            child: Icon(
                              Icons.contrast,
                              color: contrast.value == true ? color : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                         Text(
                          "Contrast",
                          style: TextStyle(color:contrast.value == true ? color :  Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            brightness.value = false;
                            contrast.value = false;
                            saturation.value = true;
                            sharpness.value = false;
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF151515),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: saturation.value == true
                                        ? color
                                        : Colors.white,
                                    width: 1)),
                            child: Icon(
                              Icons.water_drop,
                              color:
                                  saturation.value == true ? color : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                         Text(
                          "Saturation",
                          style: TextStyle(color:saturation.value == true ? color :   Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            brightness.value = false;
                            contrast.value = false;
                            saturation.value = false;
                            sharpness.value = true;
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF151515),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: sharpness.value == true
                                        ? color
                                        : Colors.white,
                                    width: 1)),
                            child: Icon(
                              Icons.rectangle_outlined,
                              color: sharpness.value == true ? color : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                         Text(
                          "Sharpness",
                          style: TextStyle(color: sharpness.value == true ? color :  Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                brightness.value == true
                    ? Slider(
                        min: 0,
                        max: 30,
                        value: brightnessValue.value,
                        onChanged: (value) {
                          // setState(() {});
                          brightnessValue.value = value;
                          // print("brightnessValue $brightnessValue");
                        },
                      )
                    : contrast.value == true
                        ? Slider(
                            min: 0,
                            max: 30,
                            value: contrastValue.value,
                            onChanged: (value) {
                              // setState(() {});
                              contrastValue.value = value;
                              // print("contrastValue $contrastValue");
                            },
                          )
                        : saturation.value == true
                            ? Slider(
                                min: 0,
                                max: 100,
                                value: saturationValue.value,
                                onChanged: (value) {
                                  // setState(() {});
                                  saturationValue.value = value;
                                  // print("saturationValue $saturationValue");
                                },
                              )
                            : sharpness.value == true
                                ? Slider(
                                    min: 0,
                                    max: 30,
                                    value: sharpnessValue.value,
                                    onChanged: (value) {
                                      // setState(() {});
                                      sharpnessValue.value = value;
                                      // print("sharpnessValue $sharpnessValue");
                                    },
                                  )
                                : Slider(
                                    min: 0,
                                    max: 30,
                                    value: Value.value,
                                    onChanged: (value) {
                                      // setState(() {});
                                      Value.value = value;
                                      // print("Valueeeee $Value");
                                    },
                                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
