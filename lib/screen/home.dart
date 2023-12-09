import 'package:camera/camera.dart';
import 'package:camera_assignment/screen/camera.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: IconButton(
        onPressed: () async {
          await availableCameras().then((value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CameraScreen(cameras: cameras),
                ),
              ));
        },
        icon: Container(
          alignment: Alignment.center,
          child: const Icon(
            Icons.camera_alt,
            size: 50,
          ),
        ),
      ),
    );
  }
}
