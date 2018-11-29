import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Screen2.dart';

TextEditingController user =new TextEditingController();
String uuid;
class Screen1 extends StatefulWidget{
  @override
  _Screen1 createState() => _Screen1();
}

class _Screen1 extends State<Screen1> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: ListView(
        children: <Widget>[
          username,
          Container(
            child: Center(
              child: IconButton(
                padding: EdgeInsets.only(
                    top: 50,
                ),
                iconSize: 75,
                icon: Icon(Icons.arrow_forward),
                color: Color(0xFF42bcf4),
                onPressed: nextScreen,
              ),
            ),
          )
        ],
      ),
    );
  }

  ////   WIDGETS   ////

  Widget username = Container(
      padding: EdgeInsets.only(left: 32,right: 32,top: 200,),
      child: Center(
        child: TextFormField(
          controller: user,
          decoration: InputDecoration(labelText: "What's your name ?"),
        ),
      )
  );

  ////   FUNCTIONS   ////

  void nextScreen(){
    fetchPost().then((user) {
      print("User UUID is :"+user.id);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Screen2(uuid:user.id)),
      );
    }).whenComplete(() => setState(() {}));
  }

}

  ////   NETWORK   ////

  class UserID {
    final String id;
    UserID({this.id,});

    factory UserID.fromJson(Map<String, dynamic> json) {
      return UserID(
        id: json['id'],
      );
    }
  }

  Future<UserID> fetchPost() async {
    final response =
        await http.get('http://10.7.168.54:4000/api/register?name=${user.text}');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      //print("Username is : "+user.text);
      return UserID.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }