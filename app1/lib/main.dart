import 'package:flutter/material.dart';
import 'src/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(          // Add the 3 lines from here... 
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}
