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
  Future<Games> game= fetchPost();
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
    
    fetchPost().then((game) {
      game.deck.forEach((game) => _addTodoItem(game.description));
    });
    
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
  
  void _addTodoItem(String task) {  ///  <== Viene chiamata ogni volta che si preme il pulsante
    setState(() => lItems.add(task));
  }
 
}
  ////   NETWORK   ////
 
  class Games {
    final List<Deck> deck;

    Games({this.deck,});

    factory Games.fromJson(Map<String, dynamic> json) {
      var list = json['decks'] as List;
      print(list.runtimeType);
      List<Deck> deckList = list.map((i) => Deck.fromJson(i)).toList();

      return Games(
        deck: deckList,
      );
    }

  }

  Future<Games> fetchPost() async {

    final response =
        await http.get('http://10.7.168.54:4000/api/decks');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Games.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }

  class Deck {
    final String id;
    final String description;

    Deck({this.id, this.description});

    factory Deck.fromJson(Map<String, dynamic> json) {
      return Deck(
        id: json['id'],
        description: json['description'],
      );
    }

  }