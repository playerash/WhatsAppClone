import 'package:flutter/material.dart';

class ConversaScreen extends StatefulWidget {
  @override
  _ConversaScreenState createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: (){},
          color: Colors.white,
          icon: Icon(Icons.chat),
        ),
        //backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }
}
