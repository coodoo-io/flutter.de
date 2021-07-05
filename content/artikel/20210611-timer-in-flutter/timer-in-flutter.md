---
title: “Timer in Flutter”
date: 2021-06-11T10:37:59+02:00
draft: true
header_image: "/artikel/20210611-timer-in-flutter/images/timerheader.png"
images: ["/artikel/20210611-timer-in-flutter/images/timerheader.png"]
authors: [“andreas-mayer”]
description: “”
tags: [“flutter”,]
categories: Anfänger * verzögerte Aktionen * Periodische Aktionen
link: 20210611-timer-in-flutter/timer-in-flutter.md
---

Manchmal möchte man gerne, dass eine Aktion erst später oder sogar periodisch ausgeführt wird. Dazu gibt es in Flutter Timer, welche nach Bedarf eingestellt werden können.

## Einfache Timer
Einen einfachen Timer zu erstellen ist nicht schwer.
{{<highlight dart>}}
var timer = Timer(duration, function);
{{</highlight>}}

Dabei ist duration eine Instanz der Durationklasse, mit der man die gewünschte Dauer bis zum Ausführen der Aktion, die durch den Timer angestoßen werden soll, festlegt. Diese kann z.B. mit Stunden, Sekunden und mehr (siehe dazu die [Dart Dokumentation Duration contructor](https://api.dart.dev/stable/2.13.3/dart-core/Duration/Duration.html "Dart Dokumentation Duration contructor")) initialisiert werden.

{{<highlight dart>}}
var duration = Duration(seconds: 3); //Duration, die einen Zeitraum von 3 Sekunden definiert
{{</highlight>}}

Die Variable function steht für die Funktion, die der Timer nach Ablauf des mit der Duration festgelegten Zeitraums ausführt. Es könnte beispielsweise die im Standardflutterprojekt mitgelieferte Funktion _incrementCounter sein.

### Beispiel für einen einfachen Timer

Man kann jetzt als Einstieg die Standardapp nehmen, den FloatingActionButton entfernen und den Timer einmal nach drei Sekunden hochzählen lassen. Das sieht dann so aus:
{{<highlight dart>}}
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Timer Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(
      () {
        _counter++;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), _incrementCounter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Der Zähler wird nach 3 Sekunden hochzählen',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
{{</highlight>}}

## Periodische Timer

Ist das zu langweilig, können auch Timer erstellt werden, die die übergebene Funktion nicht nur einmal, sondern periodisch jeden über die Duration festgelegten Zeitraum ausführen.
Hierfür genügt es, die Definition des Timers zu ändern.
{{<highlight dart>}}
Timer.periodic(
    Duration(seconds: 3),
    (timer) {
    _incrementCounter();
    },
);
{{</highlight>}}

Jetzt wird alle drei Sekunden der Wert des Zählers um Eins inkrementiert. Es sollte jedoch beachtet werden, dass periodische Timer weiterlaufen, bis ihnen der Abbruch befohlen wird. Daher sollte man möglichst immer beim Schließen des Widgets, in dem der Timer gestartet wurde, diesen auch mitbeenden. Das kann leicht über die dispose Methode realisiert werden.
{{<highlight dart>}}
@override
void dispose() {
    super.dispose();
    timer!.cancel();
}
{{</highlight>}}

### Beispiel für einen periodischen Timer

{{<highlight dart>}}
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Timer Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Timer? timer;

  void _incrementCounter() {
    setState(
      () {
        _counter++;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        _incrementCounter();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Der Zähler wird nach 3 Sekunden hochzählen',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
{{</highlight>}}