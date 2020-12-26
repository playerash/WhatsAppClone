import 'package:flutter/material.dart';

class ChamadaScreen extends StatefulWidget {
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();
}

class _ChamadaScreenState extends State<ChamadaScreen> {
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
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/saburi.jpg"),
                radius: 30,
              ),
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