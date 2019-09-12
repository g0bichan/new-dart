import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState ();
  }

}

class HomeState extends State<Home> {
  int radioValue = 0;
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
          print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet x"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.red,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 133.0,
            width: 200.0,),


            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight On Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline)
                    ),




                  ),
                    

                    ],

                      )
                    ],
                  )
                    

                ],
              ),
            )
          ],
    );
  }

}

