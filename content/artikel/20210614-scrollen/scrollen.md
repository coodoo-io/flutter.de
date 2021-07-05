---
title: "Wie scrolle ich in meiner Flutter App?"
date: 2021-06-14T13:40:32+02:00
draft: true
header_image: "/artikel/20210614-scrollen/images/mouse.jpg"
images: ["/artikel/20210614-scrollen/images/mouse.jpg"]
authors: ["florian-schmitz"]
description: "Lerne, wie du in der Flutter App scrollen kannst"
tags: ["flutter", "entwickeln", "basics"]
categories: Anfänger * Flutter * UI
link: 20210614-scrollen/20210614-scrollen.md
---

Muss deine Flutter App Scrollen können? Dann bist du hier genau richtig. Es gibt mehrere Arten und Wege, wie man in deiner App scrollen kann. Die wichtigsten 2, lernst du jetzt kennen.

# ListView
Wenn du eine Liste an Widgets scrollen willst, ist die ListView eine gute Wahl. Du kannst der ListView entweder eine Liste von Widgets übergeben oder auch die Widgets direkt einfügen. Im folgenden Beispiel siehst du, wie man die ListView verwenden kann.

{{< highlight dart >}}
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll example"),
      ),
      body: ListView(
        children: [
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
        ],
      ),
    );
  }
}
{{< /highlight >}}

# SingleChildScrollView
Die SingleChildScrollView solltest du dann verwenden, wenn du komplexere Layouts verwenden möchtest, da die ListView weniger flexibel ist. Da du wahrscheinlich mehr als ein Widget scrollen möchtest, kannst du einfach in der SingleChildScrollView eine Column beziehungsweise eine Row verwenden. Hier in dem Beispiel habe ich eine Column verwendet. Von dieser aus kannst du so viele Widgets einfügen, wie du möchtest.

{{< highlight dart >}}
import 'package:flutter/material.dart';

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
              color: Colors.red,
            ),
            Container(
              height: 500,
              width: 500,
              color: Colors.green,
            ),
            Container(
              height: 500,
              width: 500,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
{{< /highlight >}}