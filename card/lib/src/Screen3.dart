import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3 createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
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
              " I am a question. ",
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
              " I am the answer. ",
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
  
  Widget cards(){  ///  <== Ritorna le " cards " con le varie domande e risposte
    return Stack(
      children: <Widget>[
        cardQuestion(),
        cardAnswer(),
      ],
    );
  }

  Widget buttons(){  ///   <== I PULSANTI X E  OK
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton( //  <== Non so la risposta
          onPressed: () {}, // Per ora, il pulsante non fa nulla
          child: Icon(
            Icons.close,
            size: 75.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
        ),
        FlatButton(  //  <== So la risposta
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