---
title: "SliverAppBar in Flutter"
date: 2021-06-16T13:30:03+02:00
draft: true
header_image: "/artikel/20210616-sliverappbar/images/splitter.jpg"
images: ["/artikel/20210616-sliverappbar/images/splitter.jpg"]
authors: ["florian-schmitz"]
description: "Wie verwende ich die SliverAppBar in Flutter"
tags: ["flutter", "anfänger", "UI"]
categories: Anfänger * UI/UX * Flutter
link: 20210616-sliverappbar/20210616-sliverappbar.md
---

Kennst du diese Apps, wo die Appbar beim Herunterscrollen verschwindet? Das kannst du in Flutter auch machen. Das Widget hierfür heißt SliverAppBar und das schauen wir uns jetzt genauer an.

# Wie verwende man die SliverAppBar?
Die SliverAppBar kannst du ganz einfach in einem Scaffold einbauen, die als body eine CustomScrollView hat. Das sieht dann so aus:

{{< highlight dart >}}
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: false,
        snap: true,
        floating: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Das ist eine SliverAppBar'),
        ),
      ),
      SliverList(delegate: SliverChildListDelegate(widgetList))
    ]));
  }
}

{{< /highlight >}}

In der SliverAppBar musst du die `boolean pinned, snap und floating` noch einstellen, damit das Ganze funktioniert. Wenn du willst, dass die AppBar dauerhaft zu sehen ist, setzte pinned auf true. Möchtest du aber eine fancy AppBar, die automatisch beim Scrollen verschwindet, dann solltest du pinned auf false lassen und die anderen zwei auf true.

# Wie sieht das ganze jetzt aus?
Um das Ganze zu testen, habe ich noch eine SliverList hinzugefügt, die drei Container beinhaltet. Das sieht so aus:

{{< figure src="/artikel/20210616-sliverappbar/images/animatedAppBar.gif">}}

# Den gesamten Code findest du hier

{{< highlight dart >}}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Widget> widgetList = [
    Container(
      height: 500,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 500,
      width: 200,
      color: Colors.green,
    ),
    Container(
      height: 500,
      width: 200,
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: false,
        snap: true,
        floating: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Das ist eine SliverAppBar'),
        ),
      ),
      SliverList(delegate: SliverChildListDelegate(widgetList))
    ]));
  }
}
{{< /highlight >}}

Wer wissen möchte, wie man die Farbe über der SliverAppBar verändern kann, der wird hier fündig:             
 [Die Statusbar Farbe in Flutter ändern] (https://flutter.de/artikel/flutter-statusbar-farbe-%C3%A4ndern.html)