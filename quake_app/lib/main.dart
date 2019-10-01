import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
void main() async {
  Map _data = await getQuake();
  print(_data[1]['Depth']);

  for (int i = 0; i < _data.length; i++) {
    print(_data[i]['Depth']);
  }

  runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.red),
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('QUAKE'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new Text('parsing....'),
      ),


    ),

  ));
}

Future<Map>getQuake() async{
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/map/';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}