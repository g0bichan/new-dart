import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _weightcontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _agecontroller = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset("images/bmi.png",
              height: 144,
              width: 200,),

            new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Age",
                          icon: new Icon(Icons.person)
                      ),
                    ),

                    new TextField(
                      controller: _heightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height In Feet",
                          icon: new Icon(Icons.accessibility_new)
                      ),
                    ),

                    new TextField(
                      controller: _weightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Weight In lb",
                          icon: new Icon(Icons.accessibility_new)
                      ),
                    ),

                  new Padding(padding: new EdgeInsets.all(10.5)),
            //        new Center(
                 //     child: new Row(
                    //    children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: new RaisedButton(
                              onPressed: () => debugPrint("Your Weight Is"),
                              color: Colors.red,
                              child: new Text("Calculate",
                              style: new TextStyle(color: Colors.white,
                              fontSize: 16.9))),


                          ),
                     //   ],
                    //  ),

                  //    ),

                  ],

                    ),


                ),
          ],
            ),




      ),
    );
  }


}


