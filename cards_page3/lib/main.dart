import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';
    return MaterialApp(
      title: appTitle,
      home: Homepage(title: appTitle),
    );
  }
}

class Homepage extends StatefulWidget {
  final String title;
  Homepage({Key key, this.title}) : super(key: key);
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  bool _visible = true;
  bool _invisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ), 
            //Freccia per tornare alla home
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 60.0,),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            //Domanda e risposta con opacita
            Stack(
              children: <Widget>[
                opacity(),
                opacity2(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            //Pulsanti X e OK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.close,
                    size: 75.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.done,
                    size: 75.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //Opacita domanda
  Widget opacity() {
    return Container(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: 350.0,
          height: 270.0,
          color: Colors.lightBlueAccent,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _visible = !_visible;
              });
            },
          ),
        ),
      ),
    );
  }
  //Opacita risposta
  Widget opacity2() {
    return Container(
      child: AnimatedOpacity(
        opacity: _invisible ? 0.0 : 1.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: 350.0,
          height: 270.0,
          color: Colors.red,
          child: GestureDetector(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
            ),
            onTap: () {
              setState(() {
                _invisible = !_invisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
