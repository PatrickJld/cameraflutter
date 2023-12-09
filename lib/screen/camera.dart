import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;

        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera errror $e");
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras[0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          (_cameraController.value.isInitialized)
              ? CameraPreview(_cameraController)
              : Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isRearCameraSelected = !_isRearCameraSelected;
                    });
                  },
                  icon: Icon(_isRearCameraSelected
                      ? Icons.switch_camera
                      : Icons.switch_camera_sharp),
                  iconSize: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                  iconSize: 70,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
