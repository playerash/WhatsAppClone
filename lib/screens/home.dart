import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 4,
          child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:15),
              child: Icon(Icons.search),
            ),
            
            Icon(Icons.more_vert),
            
          ],
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 19),
            isScrollable: true,
            indicatorColor: Colors.white,
           
            
            tabs: [
              Tab(icon: Icon(Icons.camera_alt,), ),
              Tab(text: "CONVERSAS"),
              Tab(text: "STATUS"),
              Tab(text: "CHAMADAS"),
            ],
          ),
        ),
        
      ),
    );
  }
}
