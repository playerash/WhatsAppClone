import 'package:WhatsAppClone/compomentes/FloatingButtonChamadas.dart';
import 'package:WhatsAppClone/compomentes/FloatingButtonStatus.dart';
import 'package:WhatsAppClone/compomentes/PopUpMenuHome.dart';
import 'package:WhatsAppClone/compomentes/pesquisa.dart';
import 'package:WhatsAppClone/screens/camerascreen.dart';
import 'package:WhatsAppClone/screens/chamadascreen.dart';
import 'package:WhatsAppClone/screens/conversascreen.dart';
import 'package:WhatsAppClone/screens/statusscreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'compomentes/FloatingButtonConversas.dart';

class Home extends StatefulWidget {
  final List<CameraDescription> cameras;
  Home(this.cameras);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //Lista para barra de pesquisa de cada tab bar
  List<Widget> _telas = [
    Container(),
    ConversaScreen(),
    StatusScreen(),
    ChamadaScreen(),
  ];

  //Lista de FloatingButton que ira mudar de acordo com a tab bar
  List<Widget> _floatingButtonHome = [
    null,
    FloatingButtonConversas(),
    FloatingButtonStatus(),
    FloatingButtonChamadas()
  ];

  int _indexController = 1; // controla o botão float baseado na TabBar
  TabController _tabController; // para controlar o index inicial da TabBar
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: _indexController,
    );

    //executa o controle do floatingActionButton
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        setState(() {
          _indexController = 1;
        });
      } else if (_tabController.index == 2) {
        setState(() {
          _indexController = 2;
        });
      } else if (_tabController.index == 3) {
        setState(() {
          _indexController = 3;
        });
      } else {
        setState(() {
          _indexController = 0;
        });
      }
    });
  }

  //os 3 pontinhos da appbar
  List _popUpLista = [
    null,
    PopUpConversas(),
    PopUpStatus(),
    PopUpChamadas(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var tamanhoCamera = size / 15;
    var tamanhoTextTab = (size - tamanhoCamera) / 4;
    var tamanhoLabelPadding =
        ((size) - (tamanhoCamera + tamanhoTextTab * 3)) / 8;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text("WhatsApp"),
            actions: [
              //botão de pesquisa
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  //abrir a área de pesquisa
                  await showSearch(
                    context: context,
                    delegate: Pesquisa(_telas[_indexController]),
                  );
                },
              ),
              //executando os 3 pontinhos
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _popUpLista[_indexController],
              )
            ],
            backgroundColor: Theme.of(context).primaryColor,
            //
            bottom: TabBar(
              controller: _tabController,
              labelPadding:
                  EdgeInsets.symmetric(horizontal: tamanhoLabelPadding),
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: tamanhoCamera,
                    child: Tab(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                    )),
                Container(
                  width: tamanhoTextTab,
                  child: Tab(text: "CONVERSAS"),
                ),
                Container(
                  width: tamanhoTextTab,
                  child: Tab(text: "STATUS"),
                ),
                Container(
                  width: tamanhoTextTab,
                  child: Tab(text: "CHAMADAS"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              CameraScreen(widget.cameras),
              ConversaScreen(),
              StatusScreen(),
              ChamadaScreen(),
            ],
          ),
          //floating button baseado na tab bar
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: _floatingButtonHome[_tabController.index]),
    );
  }
}
