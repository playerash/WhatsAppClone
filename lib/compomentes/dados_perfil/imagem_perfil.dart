import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagemPerfil extends StatefulWidget {
  @override
  _ImagemPerfilState createState() => _ImagemPerfilState();
}

class _ImagemPerfilState extends State<ImagemPerfil> {
  File _image;
  String _statusUpload;

  final picker = ImagePicker();
  //String idUsuarioLogado = FirebaseAuth.instance.currentUser.uid;
  FirebaseAuth firebaseUser = FirebaseAuth.instance;

  Future _uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    var pastaRaiz = storage.ref();
    var arquivo =
        pastaRaiz.child("perfil").child("${firebaseUser.currentUser.uid}.jpg");
    UploadTask task = arquivo.putFile(_image);
    task.snapshotEvents.listen(
      (event) {
        if (event.state == TaskState.running) {
          setState(() {
            _statusUpload = "em progresso";
          });
        } else if (event.state == TaskState.success) {
          setState(() {
            _statusUpload = "sucessinho bb";
          });
        }
        task.then((snapshot) {
          print("completou");
        });
      },
    );
  }

  Future _pegarPhoto() async {
    print('aqui oh');
    final arquivoPego = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        _image = File(arquivoPego.path);
      },
    );
    _uploadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Stack(
        children: [
          _image == null
              ? GestureDetector(
                  onTap: _pegarPhoto,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[350],
                    foregroundColor: Colors.grey,
                    radius: 50,
                    child: Container(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: _pegarPhoto,
                  onLongPress: _uploadImage,
                  child: CircleAvatar(
                    backgroundImage: FileImage(_image),
                    radius: 80,
                  ),
                ),
        ],
      ),
    );
  }
}
