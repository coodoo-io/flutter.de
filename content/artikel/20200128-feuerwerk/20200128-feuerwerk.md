---
title: "Feuerwerk Animation in Flutter"
slug: "flutter-feuerwerk" 
date: 2020-01-28T09:12:14+02:00
dateOfUpdate: 2020-06-09T09:12:14+02:00
draft: false
header_image: "/artikel/20200128-feuerwerk/images/feuerwerk.jpg"
images: ["/artikel/20200128-feuerwerk/images/feuerwerk.jpg"]
description: "So könnt ihr eine Feuerwerk Animation in Flutter einbauen."
tags: ["flutter", "basics", "animation"]
categories: Anfänger * Flutter * UI
authors: ["florian-schmitz"]
link: 20200128-feuerwerk/20200128-feuerwerk.md
---

## Alles ist besser mit einem Feuerwerk!

Wolltest du schon immer mal ein Feuerwerk in Flutter programmieren?
In diesem Flutter Tutorial zeige ich dir wie du eine Feuerwerk Animation in deine Flutter App einfügen kannst.

## Wie erstelle ich eine Animation, wie das Feuerwerk?

Ich habe dazu die Website <a href="https://rive.app" target="_blank">rive.app</a> verwendet. Mit dieser Website kann man wirklich alles animieren, wenn man die Zeit und Geduld hat. Hier sieht man das Feuerwerk, das ich für die App benutzt habe.

{{< figure src="/artikel/20200128-feuerwerk/images/firework_1.png" width="650" >}}

## Die Basic App

Nun kommen wir dazu die App zu programmieren. Als erstes habe ich das “Basic Gerüst” der App programmiert. Dabei habe ich den Hintergrund schwarz gefärbt, damit man dann das Feuerwerk besser sehen kann.

{{< highlight dart >}}
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Firework',
     home: Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
         backgroundColor: Colors.black,
         title: Text('Firework'),
       ),
     ),
   );
 }
}
{{< /highlight >}}

## Wie exportiere ich das Feuerwerk?
Um das Feuerwerk von der rive.app in die App einzufügen, musste ich erst die Animation von der rive.app exportieren. Das mache ich über den Export Button:

{{< figure src="/artikel/20200128-feuerwerk/images/firework_2.png" width="250" >}}

Hier habe ich die Binarys exportiert.

{{< figure src="/artikel/20200128-feuerwerk/images/firework_3.png" width="250" >}}

## Wo füge ich die Datei ein?

In meinem Flutter Projekt erstelle ich erstmal einen `assets` Ordner und dort erstelle ich den Ordner `animation`. In den `animation` Ordner lege ich dann die ganzen, wie der Name schon sagt, Animationen rein.

Als nächstes habe ich die ganzen Feuerwerke in der `pubspec.yaml` Datei hinzugefügt und das sieht dann so aus:

{{< figure src="/artikel/20200128-feuerwerk/images/firework_4.png" width="350" >}}

## Wie programmiere ich jetzt das Feuerwerk?

Das ist eine sehr gute Frage, die ich dir jetzt beantworten werde.
Als erstes habe ich mir ein Package geholt. Es heißt `flare_flutter` und ist von der rive.app und dient dazu die Animation zu starten. Das Package  habe ich der `pubspec.yaml` Datei hinzugefügt.

{{< figure src="/artikel/20200128-feuerwerk/images/firework_5.png" width="350" >}}

Nun habe ich den Code programmiert.
Der Code setzt natürlich vorraus, dass die animations im assets Ordner genau so heißen wie in meinem Beispiel, wenn du es kopieren möchtest ; )

{{< highlight dart >}}

class Firework extends StatelessWidget {
 Widget build(BuildContext context) {
   return GestureDetector(
       child: Stack(children: <Widget>[
     Positioned(
         top: 100,
         left: 10,
         height: 200,
         width: 500,
         child: Container(
             child: FlareActor(
           "assets/animation/firework_red.flr",
           animation: "explode",
         ))),
     Positioned(
         top: 500,
         left: 10,
         height: 150,
         width: 200,
         child: Container(
             child: FlareActor(
           "assets/animation/firework_blue.flr",
           animation: "explode",
         ))),
   
   ]));
 }
 
 static void startFlare(FlareActor flare) {}
}
 {{< /highlight >}}

Du kannst diesen Code unendlich weiterführen, um ein Feuerwerk zu erstellen. Aber du solltest die Positionen vom Feuerwerk immer ändern, sonst überlappt sich alles.
Ich habe in meinem Code noch weitere Feuerwerke hinzugefügt:

{{< highlight dart >}}

Positioned(
         top: 100,
         left: 10,
         height: 200,
         width: 500,
         child: Container(
             child: FlareActor(
           "assets/animation/firework_red.flr",
           animation: "explode",
         ))),

{{< /highlight >}}

Und wie sieht das Feuerwerk am Schluss aus?

{{< figure src="/artikel/20200128-feuerwerk/images/Firework.gif" width="300" >}}

