import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget{
  @override
  _Screen4 createState() => _Screen4();
}

class _Screen4 extends State<Screen4> {
  
  int score = 777 ;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: ListView(
        children: <Widget>[
          userScore(),
        ],
      ),
    );
  }

  ////   WIDGETS   ////

  Widget userScore(){
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 200,
      ),
      child: Center(
        child: Text(" Score : $score "),
      )
    );
  }

  ////   FUNCTIONS   ////
//  ANCORA DA INSERIRE  //
}
