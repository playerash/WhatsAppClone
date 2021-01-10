import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardPerfilStatus extends StatefulWidget {
  @override
  _CardPerfilStatusState createState() => _CardPerfilStatusState();
}

class _CardPerfilStatusState extends State<CardPerfilStatus> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth firebaseUser = FirebaseAuth.instance;

  var _image;

  Future _recuperarImagem() async {
    var snapshot =
        await db.collection("usuarios").doc(firebaseUser.currentUser.uid).get();
    _image = snapshot.data()["urlImagem"];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarImagem();
  }

  @override
  Widget build(BuildContext context) {
    //_recuperarImagem();
    //print(snapshot.parent);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 0,
      child: ListTile(
        //foto do perfil
        leading: Container(
          child: Stack( 
            children: [
              CircleAvatar(
                backgroundImage: _image==null? null: NetworkImage(_image),
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 40),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: 10,
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),

        title: Text(
          "Meu status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Toque para atualizar seu status",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
