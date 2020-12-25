import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> _cameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    _cameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity
          ,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(
              
              controller,
            ),
          ),
        ),
      ],
    );
  }
}
