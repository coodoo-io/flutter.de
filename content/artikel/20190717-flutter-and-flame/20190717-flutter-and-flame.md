---
title: "Flame in Flutter anwenden"
slug: "flame-in-flutter-mobile-game" 
date: 2019-07-17T07:56:45+02:00
dateOfUpdate: 2021-06-08T08:38:00+02:00
draft: false
header_image: "/artikel/20190717-flutter-and-flame/images/flutter_flame.png"
images: ["/artikel/20190717-flutter-and-flame/images/flutter_flame.png"]
description: "Flame in Flutter einbinden und mobile Spiele entwickeln."
tags: ["flutter","flame","game"]
categories: Fortgeschrittene * Flame * Mobile Game * Framework
authors: ["leon-adam"]
link: 20190717-flutter-and-flame/20190717-flutter-and-flame.md
---

Wer Mobile-Games in Flutter umzusetzen möchte, kann sich der `Flame` Bibliothek bedienen, die sehr einfach zu nutzen ist und schnelle Ergebnisse liefert. Dieser Artikel zeigt euch, wie ihr Flame zu Flutter hinzufügt und eine kleine Anwendung baut. Vorher solltet ihr natürlich Flutter installieren. Eine Anleitung findet ihr [hier] (https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten.html). Dieses Beispiel wurde in VisualStudioCode umgesetzt.

## 1. Projekt erstellen 
Zu Beginn erstellen wir eine leeres Projekt mit einem Konsolen-Befehl in einem beliebigen Verzeichnis. Wir geben folgenden Befehl ein:

{{< highlight bash >}}
create flutter_and_flame
{{< /highlight >}}

## 2. Flame zu Dependencies hinzufügen
Danach fügen wir in der `pubspec.yaml` Flame zu den Dependencies hinzu.

{{< highlight dart >}}
dependencies:
  flutter:
    sdk: flutter
  flame: ^0.29.4
{{< /highlight >}}

Nach dem Speichern wird Flame automatisch zum Projekt hinzugefügt. 

## 3. Verzeichnis
Dann erstellen wir im Verzeichnis `./lib`  eine neue Datei mit dem Namen `test-game.dart` und füllen sie wie folgt:

{{< highlight dart >}}
import 'package:flame/game.dart';
import 'dart:ui';

class TestGame extends Game {
  Size screenSize;

  void render(Canvas canvas) {}

  void update(double t) {
}

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
{{< /highlight >}}

Das ist unsere Grundlage für das Spiel. Die Methoden haben folgende Aufgaben:

render(): Zeichnet Objekte z.B. Rechtecke und Texte.

update(): Nach jedem Frame wird diese Methode aufgerufen.

resize(): Bestimmt die Größe des Bildschirms, in dem das Spiel abläuft.

## 4. Starten des Spiels

In der `main.dart` definieren wir oberhalb der Klasse eine Methode zum Starten unserer Spiels.

{{< highlight dart >}}
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testen/test-game.dart.dart';

void main() => runApp(MyApp());

void startGame() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TestGame game = TestGame();
  runApp(game.widget);
}
{{< /highlight >}}

Innerhalb unserer generierten Klasse MyApp reduzieren wir den Code auf einen Button und etwas Style.

{{< highlight dart >}}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TestGame",
      theme: ThemeData(
        canvasColor: Colors.black,
      ),
      home: MyHomePage(title: "Test my new awesome Game"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: ElevatedButton(
              onPressed: () {
                startGame();
              },
              child: Text(
                "start",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.black,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
{{< /highlight >}}

Jetzt haben wir eine Flutter-Anwendung gebaut mit einem Start-Button, der beim Drücken zum Flame-Spiel führt.

{{< figure src="/artikel/20190717-flutter-and-flame/images/menu.png" height="600" >}}

Jetzt fehlt nur noch das Spiel.

## 5. Spiel erstellen

Wir fügen dem Spiel ein Rechteck hinzu.

{{< highlight dart >}}
import 'package:flame/game.dart';
import 'dart:ui';

class TestGame extends Game {
  Size screenSize;
  double _moveX = 0.0;
  double _moveY = 0.0;
  int _richtung = 0;
  double rectSizeWidth = 50;
  double rectSizeHeight = 50;

  void render(Canvas canvas) {
    Rect boxRect =
        Rect.fromLTWH(0 + _moveX, 0 + _moveY, rectSizeWidth, rectSizeHeight);
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffff0000);
    canvas.drawRect(boxRect, boxPaint);
  }
{{< /highlight >}}

Mit den privaten Variablen bewegen wir das Rechteck. Innerhalb von update() werden die Werte gesetzt.

{{< highlight dart >}}
void update(double t) {
    switch (_richtung) {
      case 0:
        if (screenSize.width - rectSizeWidth > _moveX) {
          _moveY++;
        } else {
          _richtung = 1;
        }
        break;
      case 1:
        if (screenSize.height - rectSizeHeight > _moveY) {
          _moveY++;
        }
        break;
      case 2:
        if (_moveX >= 0) {
          _moveX--;
        } else {
          _richtung = 3;
        }
        break;
      case 3:
        if (_moveY >= 0) {
          _moveY--;
        } else {
          _richtung = 0;
        }
        break;
      default:
    }
  }
{{< /highlight >}}

Nach jedem Frame wird in update() der x- oder y-Parameter vom Rechteck um 1 erhöht oder gesenkt, je nach Fall. Danach sollte nach dem Drücken von Start ein rotes Rechteck zu sehen sein, das sich im Uhrzeigersinn am Rand des Bildschirms bewegt.

{{< figure src="/artikel/20190717-flutter-and-flame/images/game.png" height="600" >}}

Und so haben wir Flame zu unserem Flutter-Projekt hinzugefügt!
