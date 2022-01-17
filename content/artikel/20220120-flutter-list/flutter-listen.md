---
title: "Listen in Flutter erstellen"
slug: "flutter-list-erstellen" 
date: 2022-01-17T08:00:25+02:00
draft: false
header_image: "/artikel/20220120-flutter-list/cover-liste.png"
images: ["/artikel/20220120-flutter-list/cover-liste.png"]
description: "In Flutter eine Liste mit Text und Bildern erstellen und anzeigen."
tags: ["flutter", "list", "assets"]
categories: Flutter * Anfänger * Listen
authors: ["Nadia-Micheilis"]
link: 20220120-flutter-list/flutter-listen.md
---

Ein guter Startpunkt für alle, die Flutter lernen wollen, ist es, eine Liste in einer Flutter App anzulegen. Listen bilden das Kernstück vieler Apps, ob es nun das Inventar eines Shops ist oder eine einfache To-Do-Liste. Hier zeige ich dir wie du eine Liste in Flutter erstellen und bearbeiten kannst. In diesem Fall machen wir eine Blumenliste mit Beschreibungstext und Bild.

### Listen-Klasse erstellen
Es erscheint kontraintuitiv, aber bevor wir die Liste bauen, erstellen wir zuerst deren Inhalt. Für eine bessere Übersicht, ziehen wir den Inhalt in eine eigene Datei heraus. Gehe dazu in deine ``lib`` und erstelle dort eine neue Dart-Datei, zum Beispiel `flower.dart`. 
Erstelle dann eine `Flower-Klasse`. Diese soll einen Bildnamen und ein Bild zurückgeben.

{{<highlight dart>}}
class Flower {
  String label;
  String imageUrl;
  // TODO: Add servings and ingredients here

  Flower(
    this.label,
    this.imageUrl,
  );
}
{{</highlight>}}

### Liste mit Daten füllen
In einer normalen App würden wir die Daten jetzt von irgendeiner Api laden. Um es an dieser Stelle einfacher zu machen, schreiben wir die Daten direkt in die App herein. Hinterlege zuerst in deinem Assets-Ordner die Bilder, die du anzeigen möchtest. Wie man Assets in eine Flutter-App einfügt, erfährst du in diesem Artikel: <a href="https://flutter.de/artikel/flutter-assets-bilder-sound-verwenden.html">Assets einfügen</a>.
<br>
Wenn das erledigt ist, füge die folgende Methode ein und hinterlege dort deine Dateien.
{{<highlight dart>}}
class Flower {
  String label;
  String imageUrl;
  // TODO: Add servings and ingredients here

  Flower(
    this.label,
    this.imageUrl,
  );
  static List<Flower> samples = [
    Flower(
      'Bartblume',
      'assets/bartblume.png',
    ),
    Flower(
      'Ringelblume',
      'assets/ringelblume.png',
    ),
    Flower(
      'Narzisse',
      'assets/narzisse.png',
    ),
  ];
}
{{</highlight>}}

### Die Liste anzeigen
Gehe nun zurück in deine `main.dart` und importiere die Liste. 
{{<highlight dart>}}
import 'package:flutter/material.dart';
import 'flower.dart';{{</highlight>}}


Gehe jetzt in den `body` und füge den `ListView.builder` in einer `child-Komponente` ein. 

{{<highlight dart>}}
body: Center(
        child: ListView.builder(
          itemCount: Flower.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(Flower.samples[index].label);
          },
        ),
      ),
{{</highlight>}}

<img src="/artikel/20220120-flutter-list/liste.png" alt="Flutter unvollständige Liste">

Jetzt wird dir deine Liste immerhin schon angezeigt. Aber schön ist es nicht. Damit die Liste hübsch aussieht, lass sie uns in eine `Card` packen.

### Liste in einer Card anzeigen
Eine Card kann man ganz einfach mit dem Card-Widget erstellen. Gehe zuerst in deinen `itemBuilder` und ersetze `return Text()` durch {{<highlight dart>}}
return buildFlowerCard(Flower.samples[index]);{{</highlight>}} 

Denn du willst ja, dass die Card angezeigt wird und nicht nur der Text. 
Jetzt erstellst du unter deinem build-Widget ein `buildFlowerCard`-Widget. 
{{<highlight dart>}}
  Widget buildFlowerCard(Flower flower) {
    // 1
    return Card(
      // 2
      child: Column(
        // 3
        children: <Widget>[
          // 4
          Image(image: AssetImage(flower.imageUrl)),
          // 5
          Text(flower.label),
        ],
      ),
    );
  }
{{</highlight>}}

Und voilà! Die Card ist fertig und sollte in etwa so aussehen: 


Aber schöner geht immer. Ich habe noch ein paar Styles hinzugefügt und jetzt sehen Code und App so aus: 

<img src="/artikel/20220120-flutter-list/pink.png" alt="Flutter Liste">


{{<highlight dart>}}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Flower.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return buildFlowerCard(Flower.samples[index]);
          },
        ),
      ),
    );
  }

  Widget buildFlowerCard(Flower flower) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2.0,
        color: Colors.pink[50],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage(flower.imageUrl),
                ),
              ),
              Text(
                flower.label,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Palatino',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  {{</highlight>}}


### Die nächsten Schritte
Die erste Hürde ist genommen. Wie geht es nun weiter? Probiere es doch mit diesen Artikeln für Flutter Anfänger:

<a href="https://flutter.de/artikel/flutter-carousel.html">Karussel in Flutter erstellen</a> <br>
<a href="https://flutter.de/artikel/flutter-statusbar-farbe-ändern.html">Statusbar Farbe ändern</a> <br>
<a href="https://flutter.de/artikel/layout-cheat-sheet-flutter-deutsch.html">Layout Cheat Sheet</a>
