import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/util.dart' as util;
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  void showStuff() async {
    Map data = await getWeather(util.appId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: showStuff)
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/umbrella.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text(
              'Spokane',
              style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/rain.png'),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 290.0, 0.0, 0.0),
            child: updateTempWidget('chennai'),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.appId}&units=imperial';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.appId, city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(content['main']['temp'].toString(),
                        style: new TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 65.9,
                            color: Colors.green,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}
//
//class ChangeCity extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.red,
//        title: new Text(''),
//        centerTitle: true,
//      ),
//      body: new Stack(
//        children: <Widget>[
//          new ListView(
//            children: <Widget>[
//              new Image.asset(
//                'images/snow.png',
//                width: 490.0,
//                height: 1200.0,
//                fit: BoxFit.fill,
//              )
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}

TextStyle cityStyle() {
  return new TextStyle(
      color: Colors.white, fontSize: 22.9, fontStyle: FontStyle.italic);
}

TextStyle tempstyle() {
  return new TextStyle(
      color: Colors.white,
      fontSize: 49.9,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900);
}
