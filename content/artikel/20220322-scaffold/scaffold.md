---
title: "Was du über das Flutter Scaffold Widget wissen solltest"
slug: "flutter-how-to-write-files" 
date: 2022-03-22T08:00:25+02:00
draft: false
header_image: "/artikel/20220322-scaffold/flutter_scaffold.png"
images: ["/artikel/20220322-scaffold/flutter_scaffold.png"]
description: "Das Scaffold Widget ist das wichtigste Widget in Flutter. Ich erkläre dir, wozu es gut ist und wie es funktioniert."
tags: ["widget", "beginner", "scaffold"]
categories: Flutter * Beginner * Scaffold
authors: ["markus-kuehle"]
link: 20220322-scaffold/scaffold.md
---

Du fängst an deine App zu programmieren, möchtest den ersten Text ausgeben und auf deinem Bildschirm erscheint der Text in rot und ist zudem noch in gelb unterstrichen? Zwei Fragen tauchen im Kopf auf:<br>
1. Warum ist der Text so schön bunt und<br>
2. Wie kann ich die gelbe Linie unter dem Text wieder verschwinden lassen?

<img src="/artikel/20220322-scaffold/scaffold1.png" class="img-fluid">

Erscheint der Text so rot und gelb auf deiner App dann fehlt dir das <a href="https://api.flutter.dev/flutter/material/Scaffold-class.html" rel="noopener" target="blank">Scaffold Widget</a> oder ein anderer Material Container. Der Text wurde ohne Scaffold, also einfach direkt als Child in der MaterialApp, angegeben:

{{<highlight dart>}}
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      theme: ThemeData(),
      home: const Center(
        child: Text("Bunter Begrüßungstext")
      )
    );
  }
}
{{</highlight>}}

## Scaffold ist das Top-Level Widget
Das Scaffold sollte immer zentral als Top-Level-Container einer <a href="https://api.flutter.dev/flutter/material/MaterialApp-class.html" target="blank" rel="noopener">MaterialApp</a> implementiert sein, denn es ermöglicht dem Framework auf dem <a href="https://material.io/develop/flutter" rel="noopener" target="blank">Material Design</a> zu arbeiten.
Das Scaffold sollte direkt im home Attribut des MaterialApp Widgets angegeben werden:

{{<highlight dart>}}
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      theme: ThemeData(),
      home: const Scaffold(
        body: Center(
          child: Text("Normaler Begrüßungstext")
        ),
      )
    );
  }
}
{{</highlight>}}

Gibt man das Scaffold ordentlich an, kommt die gewünschte Formatierung ohne die farblichen Elemente raus.

<img src="/artikel/20220322-scaffold/scaffold2.png" class="img-fluid">

<b>Tipp: Immer nur ein einziges zentrales Scaffold Widget auf höchster Ebene verwenden.</b>

Man kann Scaffolds zwar ineinander schachteln aber das sollte man möglichst vermeiden.

## API für weitere zentrale Widgets

Gleichzeitig hat man mit dem Scaffold den direkten Zugriff auf die APIs für einen <a rel="noopener" target="blank" href="https://docs.flutter.dev/cookbook/design/drawer">Drawer</a>, <a href="https://api.flutter.dev/flutter/material/AppBar-class.html" rel="noopener" target="blank">AppBar</a> und <a rel="noopener" target="blank" href="https://api.flutter.dev/flutter/material/BottomSheet-class.html">BottomSheet</a>.


<img src="/artikel/20220322-scaffold/scaffold3.png" class="img-fluid">

So kann man seiner eigenen App schnell und ohne viel Aufwand den richtigen Rahmen geben. Ob man mit einer BottomNavigationBar oder einem Drawer arbeiten möchte — das Scaffold ist der Start dafür.

<b>Tipp: Wenn über das Flutter Routing auf neue Screens navigiert empfiehlt es sich über ein erneutes verwenden eines weiteren Scaffolds nachzudenken.</b>

Und hier noch der Vollständigkeit halber das Scaffold Widget Code-Beispiel:

{{<highlight dart>}}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scaffold Demo',
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(title: const Text('Scaffold Demo')),
          body: const Center(child: Text("Normaler Begrüßungstext")),
          drawer: const Drawer(
            child: Text('Drawer Content'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help),
                label: 'Help',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                // action on button press
              }),
        ));
  }
}
{{</highlight>}}

Und natürlich kann der Code auch im Dartpad ausprobiert werden:

<a href="https://dartpad.dev/?id=d20dae376763ac8138e3692e59e080d9" target="blank" rel="noopener"><img src="/artikel/20220322-scaffold/dartpad.png"></a>

Der ursprüngliche Artikel erschien bei <a target="blank" rel="noopener" href="https://medium.com/@markus-kuehle/was-du-über-das-flutter-scaffold-widget-wissen-solltest-9d031e3ca679">Medium</a>.