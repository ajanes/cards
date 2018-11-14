import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget{
  final String titolo;

  MoreInfo({Key key, this.titolo}) : super(key: key);
  @override
  _MoreInfo createState() => new _MoreInfo();

}

class _MoreInfo extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: EdgeInsets.only(left: 35.0, top: 32.0), 
      child: Text("TITOLOTITOLOTITOLOTITOLO:",
      style: TextStyle(fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 18.0),
      ),
    );

    Widget textSection = Container(
       padding: EdgeInsets.only(left: 35, top:15.0, right: 35.0),
        child: Text(
        '''
Nell'Era degli Antichi, il mondo era amorfo, statico, avvolto in una coltre di nebbia e dominato da draghi eterni. Poi, improvvisamente e dal nulla, si accese la fiamma primordiale, che generò il fuoco e, con esso, permise la distinzione degli elementi nell'universo, generando il caldo e il freddo, la vita e la morte, la luce e le tenebre. Risvegliati dalla fiamma primordiale, si alzarono i Lord, fino ad allora rimasti immobili nell'oscurità. Quattro di essi trovarono nella fiamma quattro grandi anime, dotate di un enorme potere, a tal punto da renderli divini: Nito, il primo dei morti; la Strega di Izalith e le sue figlie del Caos; Gwyn, il Signore della luce solare; ed infine il Nano furtivo, spesso dimenticato, il quale però trovò un'anima diversa, l'Anima Oscura, con la quale generò l'umanità.

Gli altri, invece, usarono i poteri acquisiti per combattere e porre fine al regno dei draghi, i quali tuttavia possedevano scaglie che li rendevano immortali. Giunse in aiuto Seath il Senzascaglie, un drago invidioso dei suoi simili in quanto privo di scaglie, che rivelò la loro unica debolezza: il fulmine. Così i draghi si estinsero e cominciò l'Era del Fuoco, un'era di pace e di prosperità, che purtroppo non durò a lungo: la Fiamma diventava sempre più debole e andava spegnendosi. La Strega di Izalith tentò di replicare la Fiamma, ma fallì miseramente, trasformandosi in un ricettacolo dal quale nacquero tutti i demoni, la Culla del Caos. A questo punto, Gwyn partì insieme ai suoi fidati Cavalieri d'Argento e vincolò a sé la Fiamma, nel tentativo di alimentarla: essa riprese a bruciare intensamente, ma, nonostante i sacrifici, era ancora destinata a spegnersi, prima o poi.

Mille anni dopo il sacrificio di Gwyn, la fiamma sta per spegnersi e il mondo è avvolto nell'oscurità. Fra gli uomini sopravvissuti si distinguono i portatori del Segno Oscuro, marchio che identifica la maledizione dei Non Morti. Il protagonista della storia è uno di questi, un non-morto recluso con i suoi simili in una cella di un castello sperduto noto come il Rifugio dei Non Morti. Egli però non è un Non Morto qualunque: narra la leggenda di un Non Morto Prescelto il cui compito sarà di fuggire dal castello, viaggiare a Nord e raggiungere Lordran, la terra dei Lord; là, in quella terra incredibilmente ostile, affronterà infiniti nemici e pericoli e dovrà attraversare luoghi oscuri e insidiosi per poter succedere a Lord Gwyn e raggiungere la Prima Fiamma.

Arrivato a Lordran, dopo aver suonato le Campane del Risveglio, il Prescelto risveglia Frampt, uno dei serpenti primordiali, il quale afferma che egli è il Prescelto che riporterà l'Era del Fuoco e gli consiglia di raggiungere la città di Anor Londo. Nella città, il Prescelto incontra la principessa Gwynevere, la quale gli rivela che deve offrire le anime dei Lord all'Altare del Legame del Fuoco per poter accedere alla Fornace della Prima Fiamma, dove Gwyn si sacrificò per ravvivarla. Nel suo viaggio per acquisire le anime dei Lord, il Prescelto dei Non Morti si scontrerà con le varie minacce che hanno preso dimora a Lordran, riuscendo alla fine a prendere le anime di Nito e quella della Strega di Izalith all'interno della Culla del Caos e due frammenti di quella di Lord Gwin da Seath e i Quattro Re di Petite Londo. Dopo aver offerto le anime dei Lord all'Altare del Legame del Fuoco, il Prescelto dei Non Morti entra nella Fornace della Prima Fiamma dove affronta Lord Gwyn, ormai diventato un essere vuoto. A questo punto si troverà davanti a due scelte: sacrificarsi, come fece Gwyn, nella Fiamma per far ritornare l'Era del Fuoco, oppure lasciare che si spenga una volta per tutte e dare così inizio all'Era dell'Oscurità.
        ''',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: new Text("${widget.titolo}"),
      ),
      body: ListView(
        children: [
           Image.asset(
            'images/game_img.jpg',
            height: 240.0,
          fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
        ]
      ),
    );
  }
}