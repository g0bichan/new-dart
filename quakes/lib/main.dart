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
              if (position.isOdd) return new Divider();
              final index = position ~/ 2;
              return new ListTile(
                title: new Text(" Mag: ${_features[position]['properties']['place']}",
                  style: new TextStyle(fontSize: 15.4,color: Colors.brown,
                  fontWeight: FontWeight.w800
                  ),
                ),
                
                subtitle: new Text("${_features[index]['properties']['place']}",
                  style: new TextStyle(
                    fontSize: 14.4,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic

                  ),
                
                ),

                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: new Text("${_features[index]['properties']['mag']}",
                      style: new TextStyle(
                          fontSize: 14.4,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                  ),
                  ),

                ),
                
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