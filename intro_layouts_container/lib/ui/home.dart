import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.deepOrange,
      alignment: Alignment.center,

child: new Stack(
  alignment: Alignment.bottomCenter,
  children: <Widget>[
    const Text("hello"),
    const Text("there"),
    const Text("1")
  ],
),





//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text(
//            "Item 1",
//            textDirection: TextDirection.ltr,
//            style: new TextStyle(fontSize: 12.9),
//          ),
//
//          new Text(
//            "Item 2",
//            textDirection: TextDirection.ltr,
//            style: new TextStyle(fontSize: 12.9),
//          ),
//
//          new Text(
//            "Item 3",
//            textDirection: TextDirection.ltr,
//            style: new TextStyle(fontSize: 12.9),
//          ),
//
//          const Expanded(child: const Text("item 3"))

//          new Text("first item", textDirection: TextDirection.ltr,
//          style: new TextStyle(color: Colors.blueGrey),),
//
//
//          new Text("second item", textDirection: TextDirection.ltr,
//            style: new TextStyle(color: Colors.deepPurple),),
//
//
//          new Container(
//            color: Colors.amber,
//            alignment: Alignment.bottomLeft,
//
//            child:new Text("third item", textDirection: TextDirection.ltr,
//              style: new TextStyle(color: Colors.deepPurple),),
//
//          )
//
//        ],
//      ),
    );
  }
}
