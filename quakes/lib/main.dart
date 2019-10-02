import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
Map _data;
List _features;
void main() async{
   _data = await getQuakes();
   _features = _data['features'];
  //print(_data);
  runApp(new MaterialApp(
    title: 'quakes',
    home: new Quakes(),
  ));
}



class Quakes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,

      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _features.length,
            padding: const EdgeInsets.all(15.0),

            itemBuilder: (BuildContext context, int position){
              return new ListTile(
                title: new Text("${_features[position]['properties']['place']}"),
              );
            }),

      ),
    );
  }

}

Future<Map> getQuakes() async{
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}