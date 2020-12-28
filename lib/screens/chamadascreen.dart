import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:flutter/material.dart';

class ChamadaScreen extends StatefulWidget {
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();
}

class _ChamadaScreenState extends State<ChamadaScreen> {
  bool _conversaSelecionada = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              selectedTileColor: Color(0xfff2f2f2),
            selected: _conversaSelecionada,
            onLongPress: () {
              setState(() {
                _conversaSelecionada = true;
              });
            },
            onTap: _conversaSelecionada
                ? () {
                    setState(() {
                      _conversaSelecionada = false;
                    });
                  }
                : () {},
            leading: _conversaSelecionada
                ? ConversaSelecionada("images/saburi.jpg"): ConversaNaoSelecionada("images/saburi.jpg"),
              title: Text(
                "Diego Saburi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.call_made,
                      color: Colors.green,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Hoje 15:00",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
                
              ),
              trailing: Icon(Icons.videocam_sharp, color: Theme.of(context).primaryColor,),
            );
          },
        ),
      ),
      
    );
  }
}