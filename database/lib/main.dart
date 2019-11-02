import 'package:database/models/user.dart';
import 'package:database/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
List _users;
void main() async {
  var db = new DatabaseHelper();

  await db.saveUser(new User("go", "bi"));
  int count = await db.getCount();
  print("Count: $count");
 User ana = await db.getUser(1);
 User anaUpdate = User.fromMap({
   "Username": "UpdateAna",
   "Password": "UpdatePassword",
   "id":2
 });

 await
 db.updateUser(anaUpdate);
 //int userdelected = await db.deleteUser(2);

 //print("Delete User: $userdelected");

  //print("User saved $saveduser");

  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++){
    User user = User.map(_users[i]);
    print("username: ${user.username},User: ${user.id}");
  }



  runApp(new MaterialApp(
    title: "Database",
    home: new Home(),
  ));

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
    body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_ , int position){
          return new Card(
            color: Colors.white,
            elevation: 2.0,
            child: new ListTile(
              leading: new CircleAvatar(
                child: new Text("${User.fromMap(_users[position]).username}"),
              ),
              title: new Text("User: ${User.fromMap(_users[position]).username}"),
              subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),

              onTap: () => debugPrint("${User.fromMap(_users[position]).password}"),

            ),
          );
        })
    );
  }
}

