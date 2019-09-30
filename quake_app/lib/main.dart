import 'package:flutter/material.dart';




void main(){
  runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.red),
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    ),

  ));
}