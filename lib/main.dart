import 'package:camera/camera.dart';
import 'package:camera_assignment/screen/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(
    MyApp(
      cameras: cameras,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(cameras: cameras),
    );
  }
}
