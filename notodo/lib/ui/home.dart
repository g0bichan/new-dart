import 'package:flutter/material.dart';
import 'package:notodo/util/notodo_screen.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("NoToDo"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: new NotodoScreen(),

    );
  }
}