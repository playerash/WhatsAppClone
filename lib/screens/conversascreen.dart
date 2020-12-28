import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:flutter/material.dart';

class ConversaScreen extends StatefulWidget {
  @override
  _ConversaScreenState createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  bool _conversaSelecionada = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                ? ConversaSelecionada(): ConversaNaoSelecionada(),
                 
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Diego Saburi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "25/12/2020",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            subtitle: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.check,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
                Text(
                  "Eu te amo",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
