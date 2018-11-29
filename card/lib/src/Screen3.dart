import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Screen3 extends StatefulWidget {
  @override
  _Screen3 createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
  String answer;
  String question;
  bool _visible = true;
  bool _invisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Screen3"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.0),
            ),
            cards(), // <==  Domanda e risposta con opacita
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            buttons(), // <==  Pulsanti X e OK
          ],
        ),
      ),
    );
  }

  ////   WIDGETS   ////

  Widget cardQuestion() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        child: Container(
          width: 350.0,
          height: 480.0,
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
          ),
          child: Center(
            child: Text(
              question,
              textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
    );
  }

  Widget cardAnswer() {
    return AnimatedOpacity(
      opacity: _invisible ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        child: Container(
          width: 350.0,
          height: 480.0,
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
          ),
          child: Center(
            child: Text(
              answer,
              textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _invisible = !_invisible;
          });
        },
      ),
    );
  }

  ////   FUNCTIONS   ////

  void initState(){
    super.initState();

    fetchPost().then((post) {
      answer=post.answer;
      question=post.statement;
    }).whenComplete(() => setState(() {}));
  }

  Widget cards() {
    ///  <== Ritorna le " cards " con le varie domande e risposte
    return Stack(
      children: <Widget>[
        cardQuestion(),
        cardAnswer(),
      ],
    );
  }

  Widget buttons() {
    ///   <== I PULSANTI X E  OK
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          //  <== Non so la risposta
          onPressed: () {}, // Per ora, il pulsante non fa nulla
          child: Icon(
            Icons.close,
            size: 75.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
        ),
        FlatButton(
          //  <== So la risposta
          onPressed: () {}, // Per ora, il pulsante non fa nulla
          child: Icon(
            Icons.done,
            size: 75.0,
          ),
        ),
      ],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(
      'http://10.7.168.54:4000/api/card/053787f2-d0ae-470d-8a0b-273ea880b682');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  var category;
  final String answer;
  final String statement;

  Post({this.category, this.answer, this.statement});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      answer: json['answer'],
      category: json['category'],
      statement: json['statement'],
    );
  }
}
