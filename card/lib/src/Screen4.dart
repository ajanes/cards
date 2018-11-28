import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4 createState() => _Screen4();
}

class _Screen4 extends State<Screen4> {
  int score = 777;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboards')),
      body: ListView(
        children: <Widget>[
          // userScore(),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          leaderBoard(),
        ],
      ),
    );
  }

  ////   WIDGETS   ////

  Widget userScore() {
    return Container(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: 200,
        ),
        child: Center(
          child: Text(" Score : $score "),
        ));
  }

  ////   FUNCTIONS   ////
//  ANCORA DA INSERIRE  //


////       TABELLA LEADERBOARDS           ////
  Widget leaderBoard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Table(
        border: TableBorder.all(width: 1.0, color: Colors.black),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ranking',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Nome',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Luigi',
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$score',
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
