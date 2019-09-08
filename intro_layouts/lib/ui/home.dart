import 'package:flutter/material.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Text("Hello Container",textDirection: TextDirection.ltr,
      style: new TextStyle(color: Colors.blue,fontWeight: FontWeight.w900),),
    );
  }

}