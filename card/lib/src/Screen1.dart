import 'package:flutter/material.dart';
import 'Screen2.dart';

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
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ////   WIDGETS   ////

  Widget username = Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 200,
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(labelText: "What's your name ?"),
        ),
      )
  );

  ////   FUNCTIONS   ////
//  ANCORA DA INSERIRE  //
}
