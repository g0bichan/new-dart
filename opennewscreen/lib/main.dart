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
  Future _gotToNextScreen(BuildContext context) async {
  Map results = await Navigator.of(context).push(
    new  MaterialPageRoute (
        builder: (BuildContext context) {
          return new  NextScreen(name: _nameFieldController.text);
        })
  );

  if (results != null && results.containsKey("info")) {
    print(results['info'].toString());
    _nameFieldController.text = results['info'].toString();
  } else {
    print('Nothing!');
  }
}
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
                child: new Text("Send To Next Screen"),
                onPressed: () {_gotToNextScreen(context);}
            ),
          )

        ],
      )



    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;


  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Second Screen'),
        centerTitle: true,
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),
            new ListTile(
              title: new TextField(
                controller: _backTextFieldController,
              ),
            ),
            new ListTile(
              title: new FlatButton(
                  onPressed: (){
                    Navigator.pop(context, {
                      'info': _backTextFieldController.text
                    });
                  },
                  child: new Text('Send Data Back')),
            )
          ],
        ),
      ),


    );
  }
}

