import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
//import 'Screen3.dart';
import 'Screen4.dart';
String uuid2;
String id;
String card;

class Screen2 extends StatefulWidget{
  final String uuid;
  Screen2({Key key, @required this.uuid}) : super(key: key);
  @override
  _Screen2 createState() => _Screen2(uuid:uuid);
}

class _Screen2 extends State<Screen2> {
  List<String> lItems = [];
  List<String> lIDs = [];
  
  final String uuid;
  _Screen2({@required this.uuid});

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
    String temp;
    return new ListTile(
      title: new Text(todoText, textAlign: TextAlign.center,),
      onTap: (){
        id=lIDs[index];
        print("ID : "+id);
        print("UUID : "+uuid2);
        fetchPlay().then((play) {
          print("Card : ${play.card}");
          if(play.card==null){
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text("NO MORE CARDS TO PLAY"),
                );
              },
            );
          }else{
            temp=play.card;
            print("temp : $temp");
          }
          print("Game :  ${play.game}");
          print("Score : ${play.score} ");
        }).whenComplete(() => setState(() {
          card=temp;
          print("card inside setState : $card");
        }));
        print("card outside fetch : $card");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Screen3()),
        // );
      },
    );
  }

  void initState(){
    super.initState();

    fetchPost().then((game) {
      game.deck.forEach((game){
        lItems.add(game.description);
        lIDs.add(game.id);
      });
    }).whenComplete(() => setState(() {uuid2=uuid;}));
  }

  Widget _buildTodoList() {  ///  <==  Crea l'intera lista 
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

  class Play {
    final String card;
    final String game;
    final int score;

    Play({this.card, this.game, this.score});

    factory Play.fromJson(Map<String, dynamic> json) {
      return Play(
        card: json['card'],
        game: json['game'],
        score: json['score'],
      );
    }
  }

  Future<Play> fetchPlay() async {
    final response = await http.get(
        'http://10.7.168.54:4000/api/play?user=$uuid2&deck=$id');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Play.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Play');
    }
  }