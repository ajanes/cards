import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {

  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {

    Widget informazioni = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('
        	
Poesie per caso

Brandisio Andolfi, poeta noto, di lunga e collaudata esperienza in ambito letterario, in cui si è sempre distinto per la serietà e la solidità del suo assunto creativo/investigativo, si ripresenta al pubblico con questa ennesima raccolta di testi poetici, in cui conferma la sua propensione a confessare pensieri, sensazioni, emozioni, a ripercorrere non senza un pizzico di nostalgia i momenti salienti dell’esistenza vissuta in stretto rapporto con la natura, prima, e poi con il mondo della scuola e della cultura. Già il titolo “Poesie per caso” è indicativo di una consuetudine all’arte poetica, che per lui rappresenta il modo più autentico per manifestare la propria libertà di pensiero, la sua dimensione individuale all’interno dell’organizzazione sociale, dov’egli si propone come attento e solerte testimone del proprio tempo.
      '),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TITOLO'),
          backgroundColor: barColor,
        ),
        body: ListView(
          children: [
            informazioni
          ],
        ),
      ),
    );

  }
}