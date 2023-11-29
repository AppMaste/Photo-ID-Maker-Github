import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_id_maker/Image/repair.dart';
import 'package:photo_id_maker/Image/smoothness.dart';
import 'Image/Adjust.dart';
import 'Image/Brush.dart';
import 'HomePage.dart';
import 'Image/Image save.dart';
import 'Image/background remove.dart';
import 'Image/image border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          highlightColor: const Color(0xFFD0996F),
          canvasColor: const Color(0xFFFDF5EC),
          textTheme: TextTheme(
            headlineSmall: ThemeData.light()
                .textTheme
                .headlineSmall!
                .copyWith(color: const Color(0xFFBC764A)),
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[600],
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFBC764A),
            centerTitle: false,
            foregroundColor: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFFBC764A)),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFFBC764A),
              ),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: Color(0xFFBC764A))),
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: const Color(0xFFFDF5EC))),
      home: const Data(),
    );
  }
}

class Data extends StatelessWidget {
  const Data({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const BrushScreen());
              },
              child: const Text("Brush"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ImageRepair());
              },
              child: const Text("Repair"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ImageBorder());
              },
              child: const Text("Add Border"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HomePage());
              },
              child: const Text("Image Crop"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ImageSave());
              },
              child: const Text("Image Save"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ImageAdjustScreen());
                // Get.to(
                //   () => const ImageBackgroundRemoval(
                //       imagePath: "assets/Lion_d'Afrique.jpg"),
                // );
              },
              child: const Text("Image Adjust"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SmoothnessScreen());
              },
              child: const Text("Image Smoothness"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const BackgroundRemove());
              },
              child: const Text("Remove Background"),
            ),
          ],
        ),
      ),
    );
  }
}
