import 'package:flutter/material.dart';

class NotodoScreen extends StatefulWidget {
  @override
  _NotodoScreenState createState() => _NotodoScreenState();
}

class _NotodoScreenState extends State<NotodoScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),
      floatingActionButton: new FloatingActionButton(
//        tooltip: "Add Item",
//          backgroundColor: Colors.blue,
//          child: new ListTile(
//            title: new Icon(Icons.add),
//          ),

          onPressed: _showFormDialog),
        
    );
  }


}

class _showFormDialog {
}



