import 'package:flutter/material.dart';

//pagina dos 3 pontinhos
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
      ],
    );
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
      ],
    );
  }
}

class PopUpChat extends StatefulWidget {
  @override
  _PopUpChatState createState() => _PopUpChatState();
}

class _PopUpChatState extends State<PopUpChat> {
  final bool _mais = false;

  List casa = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Ver contatos"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Mídia, links e docs"),
          value: 2,
        ),
        PopupMenuItem(
          child: Text("Pesquisar"),
          value: 3,
        ),
        PopupMenuItem(
          child: Text("Silenciar notificações"),
          value: 4,
        ),
        PopupMenuItem(
          child: Text("Papel de parede"),
          value: 5,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Text("Mais"),
            ],
          ),
          value: 6,
        )
      ],
    );
  }
}

class PopUpChatMais extends StatelessWidget {
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
      ],
    );
  }
}

class PopUpListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Convidar um amigo"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Contatos"),
          value: 2,
        ),
        PopupMenuItem(
          child: Text("Atualizar"),
          value: 3,
        ),
        PopupMenuItem(
          child: Text("Ajuda"),
          value: 4,
        ),
      ],
    );
  }
}
