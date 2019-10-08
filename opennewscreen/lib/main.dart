import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    title: 'Screens',
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new  TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter The Name'
              ),
            ),
          ),
          new ListTile(
            title:  new RaisedButton(
                child: new Text("Send  The Next Screen"),
                onPressed: () => debugPrint("Sending....")),
          )

        ],
      )



    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

