---
title: "Bottom Navigation Bar in Flutter"
date: 2021-06-14T14:15:59+02:00
draft: true
header_image: "/artikel/20210614-bottom-navigation-bar/images/compass.png"
images: ["/artikel/20210614-bottom-navigation-bar/images/compass.png"]
authors: ["andreas-mayer"]
description: "Bottom Navigation Bar in Flutter"
tags: ["flutter",]
categories: Anfänger * Flutter
link: 20210614-bottom-navigation-bar/20210614-bottom-navigation-bar.md
---

Wenn man in Flutter schnell und oft zwischen wenigen verschiedenen Ansichten wechseln will oder muss, ist eine Möglichkeit dies leicht zu realisieren eine Bottom Navigation Bar. Diese befindet sich, wie der Name schon sagt, unten in der Anwendung in Fingernähe und somit leicht erreichbar.

Eine Bottom Navigation Bar kann leicht ins Projekt eingebaut werden, indem das entsprechende Attribut, also bottomNavigationBar, beim Scaffold gefüttert wird.
{{<highlight dart>}}
bottomNavigationBar: BottomNavigationBar(
items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.hot_tub),
    label: "Seite 1",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.play_arrow),
    label: "Seite 2",
    ),
],
currentIndex: _selectedIndex,
onTap: _onItemTapped,
), 
{{</highlight>}}

Das Attribut currentIndex zeigt an, welches Feld der Bottom Navigation Box gerade aktiv ist. 
Das Attribut onTap ist die Methode, die durch einen Tap auf die Navigation Bar ausgeführt wird. Dabei gibt es die Besonderheit, dass diese mit einem Index mit Typ int aufgerufen wird, der den Index des aufgerufenen Elements angibt.

Die einfachst mögliche onTap Methode sollte dabei mindestens die dem currentIndex zugewiesene Variable aktualisieren, um eine Änderung zu signalisieren
{{<highlight dart>}}
void _onItemTapped(int index) {
    setState(
        () {
        _selectedIndex = index;
        },
    );
}
{{</highlight>}}

Jetzt, da die Bottom Navigation Bar den Status aktualisiert, sollte die Seite selbst sich natürlich auch verändern. Dazu ist es am leichtesten eine Liste mit passenden Widgets zu erstellen und auf diese über den currentIndex zuzugreifen. Diese könnte beispielsweise so aussehen:
{{<highlight dart>}}
static List<Widget> _pages = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Seite 1"),
          Icon(Icons.hot_tub),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Seite 2"),
          Icon(Icons.play_arrow),
        ],
      ),
    ),
  ];
{{</highlight>}}

Nun fehlt nur noch der Zugriff, der dem Attribut body beim Scaffold hinzugefügt wird und wir sind fertig.
{{<highlight dart>}}
body: _pages[_selectedIndex],
{{</highlight>}}

Insgesamt sieht der Code dann so aus:
{{<highlight dart>}}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter BottomNavigationBar Demo Home Page'),
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
  var _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Seite 1"),
          Icon(Icons.hot_tub),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Seite 2"),
          Icon(Icons.play_arrow),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hot_tub),
            label: "Seite 1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: "Seite 2",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
{{</highlight>}}

Und das Endprodukt sieht dann so aus:
{{< figure src="/artikel/20210614-bottom-navigation-bar/images/beispiel.png" width="250" >}}



