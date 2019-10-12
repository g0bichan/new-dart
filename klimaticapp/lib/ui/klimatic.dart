import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/utils.dart'as util;
import 'dart:async';
import 'package:http/http.dart' as http;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  void showStuff() async {
    Map data = await getWeather(util.appId,util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: ()=> debugPrint("Hey")
          )
        ],
      ),

      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
            width: 490.0,
            height: 1200.0,
            fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text('Spokane',
            style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/rain.png'),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 170.0, 0.0, 0.0),
            alignment: Alignment.centerLeft,
            child: updateTempWidget("chennai"),
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=imperial';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.appId, city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString()),
                )
              ],
            ),
          );
        }

    });
  }



}
TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.0
  );
}

