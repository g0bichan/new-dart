import 'package:flutter/material.dart';
void main() {
  runApp(
    new MaterialApp (
      color: Colors.blue,
      title: "Welcome App",
      home: new Welcome(),

    )
  );
}









class Welcome extends StatefulWidget {


  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new Center(     child: new Text(
        "Welcome Home !",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 34.5
        ),
      )

      ),

    )

    );
  }
}



}









