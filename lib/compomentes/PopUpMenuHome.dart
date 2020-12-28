import 'package:flutter/material.dart';

class PopUpConversas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Novo grupo"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Nova transmissão"),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("WhatsApp web"),
                value: 3,
              ),
              PopupMenuItem(
                child: Text("Mensagens favoritas"),
                value: 4,
              ),
              PopupMenuItem(
                child: Text("Configurações"),
                value: 5,
              ),
            ]);
  }
}

class PopUpStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Privacidade do status"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Configurações"),
          value: 2,
        ),
      ],
    );
  }
}

class PopUpChamadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Limpar registro de chamadas"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Configurações"),
                value: 2,
              ),
            ]);
  }
}
