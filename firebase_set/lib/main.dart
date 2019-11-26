//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'model/board.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'auth-firebase',
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
  String _imageUrl;
  // int _counter = 0;
//  List<Board> boardMessages = List();
//  Board board;
//  final FirebaseDatabase database = FirebaseDatabase.instance;
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  DatabaseReference databaseReference;
//
//  @override
//  void initState() {
//    super.initState();
//    board = Board("", "");
//    databaseReference = database.reference().child("community_board");
//    databaseReference.onChildAdded.listen(_onEntryAdded);
//    databaseReference.onChildChanged.listen(_onEntryChanged);
  //  void _incrementCounter() {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text("google-sign"),
                  onPressed: () => _googleSignin(),
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.purple,
                    child: Text("signin with email"),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.orange,
                    child: Text("create account"),
                    onPressed: () {},
                ),
              ),
              new Image.network(_imageUrl == null || _imageUrl.isEmpty ?
              )
            ],
          ),
        ));
  }

 Future<FirebaseUser> _googleSignin() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print("User is: ${user.photoUrl}");
    return user;
  }
}
