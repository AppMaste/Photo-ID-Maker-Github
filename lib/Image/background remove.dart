import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class BackgroundRemove extends StatefulWidget {
  const BackgroundRemove({super.key});

  @override
  State<BackgroundRemove> createState() => _BackgroundRemoveState();
}

class _BackgroundRemoveState extends State<BackgroundRemove> {
  var autoErase = true.obs;
  var manualEraser = false.obs;
  var repair = false.obs;
  var zoom = false.obs;

  var autoEraseValue = 0.0.obs;
  var manualEraserValue = 0.0.obs;
  var repairValue = 0.0.obs;
  var zoomValue = 0.0.obs;

  var threshold = 0.0.obs;
  var offset = 0.0.obs;
  var brush = 0.0.obs;

  var smoothness = 0.0.obs;
  var offset2 = 0.0.obs;
  var brush2 = 0.0.obs;


  var offset3 = 0.0.obs;
  var brush3 = 0.0.obs;

  Color color = const Color(0xFFAEDEEC);
  Color color2 = const Color(0xFFE4F8FE);

  var imageSource =
      "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
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
                  image: DecorationImage(
                    image: NetworkImage(imageSource),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                child: PhotoView(
                  imageProvider: NetworkImage(
                    imageSource,
                  ),
                ),
                // child: Image.network(
                //   imageSource,
                //   fit: BoxFit.cover,
                // ).blurred(
                //   blur: brush.value,
                //   colorOpacity: offset.value,
                //
                // ),
              ),
              const SizedBox(height: 40),
              Container(
                height: autoErase.isTrue
                    ? 120
                    : manualEraser.isTrue
                        ? 120
                        : repair.isTrue
                            ? 70
                            : zoom.isTrue
                                ? 00
                                : 00,
                width: double.maxFinite,
                color: color2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: autoErase.value == true
                      ? Column(
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text("Threshold"),
                                Container(
                                  width: 310,
                                  color: Colors.transparent,
                                  child: Slider(
                                    thumbColor: color,
                                    activeColor: color,
                                    inactiveColor: Colors.grey,
                                    min: 0,
                                    max: 100,
                                    value: threshold.value,
                                    onChanged: (value) {
                                      threshold.value = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Offset"),
                                Container(
                                  width: 175,
                                  color: Colors.transparent,
                                  child: Slider(
                                    thumbColor: color,
                                    activeColor: color,
                                    inactiveColor: Colors.grey,
                                    min: 0,
                                    max: 1,
                                    value: offset.value,
                                    onChanged: (value) {
                                      var aa;
                                      aa = value / 10;
                                      offset.value = aa;
                                    },
                                  ),
                                ),
                                const Text("Brush"),
                                Container(
                                  width: 125,
                                  color: Colors.transparent,
                                  child: Slider(
                                    thumbColor: color,
                                    activeColor: color,
                                    inactiveColor: Colors.grey,
                                    min: 0,
                                    max: 100,
                                    value: brush.value,
                                    onChanged: (value) {
                                      brush.value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : manualEraser.value == true
                          ? Column(
                              children: [
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Smoothness"),
                                    Container(
                                      width: 290,
                                      color: Colors.transparent,
                                      child: Slider(
                                        thumbColor: color,
                                        activeColor: color,
                                        inactiveColor: Colors.grey,
                                        min: 0,
                                        max: 100,
                                        value: smoothness.value,
                                        onChanged: (value) {
                                          smoothness.value = value;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Offset"),
                                    Container(
                                      width: 175,
                                      color: Colors.transparent,
                                      child: Slider(
                                        thumbColor: color,
                                        activeColor: color,
                                        inactiveColor: Colors.grey,
                                        min: 0,
                                        max: 100,
                                        value: offset2.value,
                                        onChanged: (value) {
                                          offset2.value = value;
                                        },
                                      ),
                                    ),
                                    const Text("Brush"),
                                    Container(
                                      width: 125,
                                      color: Colors.transparent,
                                      child: Slider(
                                        thumbColor: color,
                                        activeColor: color,
                                        inactiveColor: Colors.grey,
                                        min: 0,
                                        max: 100,
                                        value: brush2.value,
                                        onChanged: (value) {
                                          brush2.value = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : repair.value == true
                              ? Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text("Offset"),
                                        Container(
                                          width: 175,
                                          color: Colors.transparent,
                                          child: Slider(
                                            thumbColor: color,
                                            activeColor: color,
                                            inactiveColor: Colors.grey,
                                            min: 0,
                                            max: 100,
                                            value: offset3.value,
                                            onChanged: (value) {
                                              offset3.value = value;
                                            },
                                          ),
                                        ),
                                        const Text("Brush"),
                                        Container(
                                          width: 125,
                                          color: Colors.transparent,
                                          child: Slider(
                                            thumbColor: color,
                                            activeColor: color,
                                            inactiveColor: Colors.grey,
                                            min: 0,
                                            max: 100,
                                            value: brush3.value,
                                            onChanged: (value) {
                                              brush3.value = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : zoom.value == true
                                  ? Container()
                                  : Container(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (autoErase.isFalse) {
                            autoErase.value = true;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = false;
                          } else {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = false;
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: autoErase.value == true
                                      ? color
                                      : Colors.white,
                                  width: 1)),
                          child: Icon(
                            Icons.light_mode_sharp,
                            color:
                                autoErase.value == true ? color : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Auto Eraser",
                        style: TextStyle(
                            color:
                                autoErase.value == true ? color : Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (manualEraser.isFalse) {
                            autoErase.value = false;
                            manualEraser.value = true;
                            repair.value = false;
                            zoom.value = false;
                          } else {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = false;
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: manualEraser.value == true
                                      ? color
                                      : Colors.white,
                                  width: 1)),
                          child: Icon(
                            Icons.contrast,
                            color: manualEraser.value == true
                                ? color
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Manual Eraser",
                        style: TextStyle(
                            color: manualEraser.value == true
                                ? color
                                : Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (repair.isFalse) {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = true;
                            zoom.value = false;
                          } else {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = false;
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: repair.value == true
                                      ? color
                                      : Colors.white,
                                  width: 1)),
                          child: Icon(
                            Icons.settings,
                            color: repair.value == true ? color : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Repair",
                        style: TextStyle(
                            color: repair.value == true ? color : Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (zoom.isFalse) {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = true;
                          } else {
                            autoErase.value = false;
                            manualEraser.value = false;
                            repair.value = false;
                            zoom.value = false;
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFF151515),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:
                                      zoom.value == true ? color : Colors.white,
                                  width: 1)),
                          child: Icon(
                            Icons.zoom_in,
                            color: zoom.value == true ? color : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Zoom",
                        style: TextStyle(
                            color: zoom.value == true ? color : Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
