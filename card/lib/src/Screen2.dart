import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Screen3.dart';
import 'Screen4.dart';

class Screen2 extends StatefulWidget{
  @override
  _Screen2 createState() => _Screen2();
}

class _Screen2 extends State<Screen2> {
  Future<Post> post= fetchPost();
  List<String> lItems = [];
  
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Screen 2')
        ),
        body:_buildTodoList(),
        floatingActionButton: score(),
    );
  }
  
  ////   WIDGETS   ////
  
  // Crea una singola attività da fare
  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: new Text(todoText, textAlign: TextAlign.center,),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Screen3()),
        );
      },
    );
  }

  Widget _buildTodoList() {  ///  <==  Crea l'intera lista 
    _addTodoItem(dati('body'));
    //prova(); // DA TOGLIERE UNA VOLTA OTTENUTO I DATI DALLA RETE 
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < lItems.length) {
          return _buildTodoItem(lItems[index],index);
        }
      },
    );
  }

  Widget score(){
    return Container(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: IconButton(
        color: Colors.blue,
        iconSize: 75,
        icon: Icon(Icons.assessment),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen4()),
          );
        },
      ),
    );
  }

  ////   FUNCTIONS   ////
  
  void _addTodoItem(Text task) {  ///  <== Viene chiamata ogni volta che si preme il pulsante
    if(task.data.length > 0) {
      setState(() => lItems.add(task.data));
    }
  }

  Text dati(String opz) { // <== Ritorna i dati
    String ok='1';

    FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) { 
        ok='2';
        if (snapshot.hasData) {
          ok='3';
          return Text(snapshot.data.body);
        } else if (snapshot.hasError) {
          ok='4';
          return Text("${snapshot.error}");
        }
      },
    );
    return Text(ok);
  }

}

  ////   NETWORK   ////
  
  class Post {
    final int id;
    final String title;
    final String body;
    final String img;
    Post({this.id, this.title, this.body, this.img});

    factory Post.fromJson(Map<String, dynamic> json) {
      return Post(
        id: json['id'], 
        title: json['title'],
        body: json['body'],
        img: json['img']
      );
    }

  }

  Future<Post> fetchPost() async {

    final response =
        await http.get('https://my-json-server.typicode.com/SultnB/test/posts/6');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }