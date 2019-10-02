import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


  Map _data;
  List _feature;
void main() async {
 _data = await getQuake();
 print(_feature[1]['properties']);


  runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.red),
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('QUAKE'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new Text('body....'),
      ),


    ),

  ));
}

Future<Map>getQuake() async{
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}