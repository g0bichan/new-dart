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
  double inches = 0.0;
  double result = 0.0;
void _calculateBMI(){
  setState(() {
    int age = int.parse(_agecontroller.text);
    double height = double.parse(_heightcontroller.text);
    inches = height*12;
    double weight = double.parse(_weightcontroller.text);
    if ((_agecontroller.text.isNotEmpty || age > 0)
      && ((_heightcontroller.text.isNotEmpty || inches > 0)
        &&(_weightcontroller.text.isNotEmpty || weight > 0))) {
    result = weight / (inches * inches) * 703;

    }else{
      result = 0.0;
    }



  });
}

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
                      controller: null,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Age",
                          icon: new Icon(Icons.person)
                      ),
                    ),

                    new TextField(
                      controller: null,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height In Feet",
                          icon: new Icon(Icons.accessibility_new)
                      ),
                    ),

                    new TextField(
                      controller: null,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Weight In lb",
                          icon: new Icon(Icons.accessibility_new)
                      ),
                    ),

                  new Padding(padding: new EdgeInsets.all(10.5)),
                          new Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: new RaisedButton(
                              onPressed: _calculateBMI,
                              color: Colors.red,
                              child: new Text("Calculate"),
                              textColor: Colors.white,
                            ),


                          ),

                  ],

                    ),


                ),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("BMI : $result",
                style: new TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                ),),

                new Padding(padding: const EdgeInsets.all(5.0))
              ],
            ),
            ),

],

            ),


  //  ],
    );

    //  );

  }


}


