import 'package:WhatsAppClone/compomentes/camera_screen/botoes_camera.dart';
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
    _cameraController.initialize().then(
      (_) {
        setState(
          () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //enquanto a camera não carrega
    if (!_cameraController.value.isInitialized) {
      return Container(
        color: Colors.black,
      );
    }
    //Camera carregada
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CameraPreview(
            _cameraController,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: BotoesCamera()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Segure para vídeo, toque para foto",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
