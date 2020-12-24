import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    var tamanhoCamera = size / 15;
    var tamanhoTextTab = (size - tamanhoCamera) / 4;

    var tamanhoLabelPadding =
        ((size) - (tamanhoCamera + tamanhoTextTab*3))/8 ;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: tamanhoLabelPadding),
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
      ),
    );
  }
}
