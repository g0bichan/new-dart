import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _onPress() {
    print("search tapped!");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("fancy day"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => debugPrint("icon tapped!")),
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPress)
        ],
      ),
      backgroundColor: Colors.blueGrey.shade300,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "gobi",
              style: new TextStyle(
                  fontSize: 20.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepOrange),
            ),
            new InkWell(
              child: new Text("button!"),
              onTap: () => debugPrint("button tapped"),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("pressed!"),
        backgroundColor: Colors.red,
        tooltip: 'Going Up',
        child: new Icon(Icons.call_missed),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Hey")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.print), title: new Text("Nope")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.mail), title: new Text("Hello"))
        ],
        onTap: (int i) => debugPrint("Hey Touched $i"),
      ),
    );
  }
}
