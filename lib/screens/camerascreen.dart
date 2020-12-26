import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  CameraScreen(this.cameras);
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController; //declarando um controlador de camera

  @override
  void initState() {
    super.initState();
    //escolhendo qual camera usar e inicializando a camera
    _cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.medium);
    _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    //enquanto a camera não carrega
    if (!_cameraController.value.isInitialized) {
      return Container(
        color: Colors.black,
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: _cameraController.value.aspectRatio,
            child: CameraPreview(
              _cameraController,
            ),
          ),
        ),
      ],
    );
  }
}
