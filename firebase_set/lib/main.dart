import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'model/board.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Board',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // int _counter = 0;
  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    board = Board("","");
    databaseReference = database.reference().child("community_board");
    databaseReference.onChildAdded.listen(_onEntryAdded);
  } //  void _incrementCounter() {
//
////    database.reference().child("Message").set({
////      "firstname" : "gobi",
////      "lastname" : "nath",
////      "age" : 21});
//    setState(() {
//database.reference().child("message").once().then((DataSnapshot snapshot){
//  Map<dynamic, dynamic> data = snapshot.value;
//
//  print("values from db: ${data.values}" );
//
//});
//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Board"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex:0,
            child: Form(
              key: formKey,
              child: Flex(direction: Axis.vertical,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.subject),
                  title: TextFormField(
                    initialValue: "",
                    onSaved: (val) => board.subject = val,
                    validator: (val) => val == "" ? val : null,

                  ),
                ),
                ListTile(
              leading: Icon(Icons.message),
          title: TextFormField(
            initialValue: "",
            onSaved: (val) => board.body = val,
            validator: (val) => val == "" ? val : null,
          ),
                ),

                FlatButton(
                  child: Text("post"),
                  color: Colors.redAccent ,
                  onPressed: (){
                    handlesubmit();
                  },
                )


              ],
              ),
            ),
          )
        ],
      )
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.formSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
   final FormState form = formKey.currentState;
   if(form.validate()){
     form.save();
     form.reset();
     databaseReference.push().set(board.toJson());
   }
  }
}
