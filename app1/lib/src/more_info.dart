import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget{
  final String titolo;
                                                //////////////
  MoreInfo({Key key, this.titolo}) : super (key: key);    /////////
  @override                                               /////////   NON HO IDEA DI COME FUNZIONI MA FUNZIONA 
  _MoreInfo createState() => new _MoreInfo();             /////////
                                                //////////////
}

class _MoreInfo extends State<MoreInfo> {

  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {

    Widget informazioni = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''
        Dark Souls[b] is an action role-playing game developed by FromSoftware and published by Namco Bandai Games. A spiritual successor to FromSoftware's Demon's Souls, the game is the second installment in the Souls series. It was released for the PlayStation 3 and Xbox 360 in Japan by FromSoftware in September 2011 and worldwide by Namco Bandai Games in the following month. Dark Souls takes place in the fictional kingdom of Lordran, where players assume the role of a cursed undead character who begins a pilgrimage to discover the fate of their kind.

Dark Souls received critical acclaim upon its release and is considered to be one of the best video games ever released, with critics praising the depth of its combat, intricate level design, and world lore. However, the game's difficulty received mixed reviews. While some praised the challenge it provides, others criticized it for being unnecessarily unforgiving. The Windows version of the game was less well received, with criticism directed at numerous technical issues.

In August 2012, a version of Dark Souls for Microsoft Windows, Dark Souls: Prepare To Die Edition, was released. It featured additional content not seen in the PlayStation 3 and Xbox 360 versions. In October 2012, the additional content was released as downloadable content for consoles under the subtitle Artorias of the Abyss. By April 2013, the game had sold over two million copies worldwide. A s
      '''),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: new Text("${widget.titolo}"),
          backgroundColor: barColor,
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/game_img.jpg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
            informazioni
          ],
        ),
      ),
    );

  }
}