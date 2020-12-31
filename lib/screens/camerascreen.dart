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
    _cameraController.initialize().then((_) {
      setState(() {});
    });
  }
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          Container(
            width: double.infinity,
            height: size.height,
            child: AspectRatio(
              aspectRatio: _cameraController.value.aspectRatio,
              // Faz com que a camera seja visualizada na tela
              child: CameraPreview(
                _cameraController,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {}),
                    Container(
                      height: size.width / 5,
                      width: size.height / 5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.switch_camera,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
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
