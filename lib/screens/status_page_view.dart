import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'status_screen.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class StatusPageView extends StatefulWidget {
  final ContatoStatus _contato;
  StatusPageView(this._contato);
  @override
  _StatusPageViewState createState() => _StatusPageViewState();
}

class _StatusPageViewState extends State<StatusPageView> {
  final _statusController = StoryController();

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> _storyItens = [
      ...widget._contato.imagens
          .map((contato) => StoryItem.inlineProviderImage(AssetImage(contato)))
    ];
    return Material(
        child: Stack(children: [
      StoryView(
        storyItems: _storyItens,
        controller: _statusController,
        inline: true,
        repeat: false,
        progressPosition: ProgressPosition.top,
        onStoryShow: (s) {
          print("mostrando story");
        },
        onComplete: () {
          Navigator.pop(context);
        },
      ),
    ]));
  }
}
