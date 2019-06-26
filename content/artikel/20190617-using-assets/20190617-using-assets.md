---
title: "Assets (Bilder und Sound) verwenden"
slug: "flutter-assets-bilder-sound-verwenden" 
date: 2019-06-17T10:48:22+02:00
draft: true
description: "Wie du schnell und einfach dein erstes Bild in deiner Anwendung anzeigst und deinen ersten Sound abspielst."
tags: ["flutter, sound, bild, image, assets"]
categories: []
author: Tobias Mautes
---

<!-----
Original: https://drive.google.com/open?id=1xGw86C4VOeZPd70DW9UqkMi60UNKMC_1obeFYQityC0
----->

Einfach einen Ordner anlegen, die Dateien rein legen und gut ist oder? Nunja nicht ganz, in flutter gibt es da ein-zwei Dinge zu beachten. Hier zeige ich dir welche.
<!--more-->

### Ordnerstruktur anlegen

Wie du vielleicht schon von anderen Frameworks gewohnt bist möchte Flutter Dinge wie Bilder und andere verwendete Dateien in einem "assets" folder im Stammverzeichnis des Projektes (Also auf derselben Ebene wie die `pubspec.yaml`) haben. 

Zwingend notwenig ist das nicht aber manche IDEs (Entwicklungsumgebungen) stellen, wenn das der Fall ist weitere Features zur Verfügung und es ist der allgemein bekannte Stil. 

Desweiteren erwarten manche Packages wie z.B. [Flame](https://pub.dev/packages/flame) eben genau diese Struktur: 

`/assets/images` und `/assets/audio` für jeweils die `Flame.image()` and `Flame.audio()` Methode. 

Das sieht in etwa so aus:

{{< figure src="images/file-tree.png" height="150" >}}

### Dateien deklarieren

Jetzt musst du nur noch die abgelegten Dateien als Assets deklarieren, da du sie sonst nicht nutzen kannst. 

Dazu gehst du einfach in die `pubspec.yaml` und fügst unter `assets:` so deinen Dateipfad hinzu: 

{{< highlight yaml >}}
flutter:

 # Importing assets used here
 assets:
   - assets/images/dart_bird.png
   - assets/images/dart_bird_reverse.png
   - assets/audio/flap-1.ogg
   - assets/audio/flap-2.ogg
   - assets/audio/flap-3.ogg
   - assets/audio/flap-4.ogg
   - assets/audio/explosion.mp3
{{< /highlight >}}

Ganze Ordner lassen sich auch hinzuzufügen mit z.B.: 

{{< highlight yaml >}}
flutter:

 # Importing assets used here
 assets:
   - assets/images/
   - assets/audio/
{{< /highlight >}}

Hierbei ist es allerdings wichtig, dass der angehängte forward slash (`/`) nicht vergessen wird.


##### Die `pubspec.yaml` ist übrigens indentation-sensitive, was bedeutet dass das ordentliche Einrücken des Geschriebenen wichtig ist!

### Bild verwenden

Nun kannst du ohne Probleme auf die Bilder zugreifen, hier ein Beispiel:

{{< highlight dart >}}
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("Ein Bild"),
       ),
       body: Image.asset('assets/images/dart_bird.png'),
     ),
   );
 }
}
{{< /highlight >}}

Dies sieht dann so aus:

{{< figure src="images/picture-example.png" height="500" >}}




### Sound verwenden?

Das abspielen von Sounddateien ist momentan noch nicht von Haus aus unterstützt. Dafür gibt es aber ein leicht zu verwendendes Plugin. Dafür fügst du einfach so in der `pubspec.yaml` das audioplayers Plugin hinzu:

{{< highlight yaml >}}
dependencies:
 flutter:
   sdk: flutter

 # Adds functionality to play sound files
 audioplayers: ^0.12.1
{{< /highlight >}}

    (Es ist ein gute Angewohnheit zu kommentieren wofür die imports genutzt werden)

Du kannst es nun abspielen, indem du innerhalb deines Widgets ein neues AudioCache Objekt deklarierst:

`static AudioCache player = AudioCache();`

Und dann das Abspielen innerhalb des Widgets so auslöst:

`player.play("audio/explosion.mp3")`

Hier eine weitere kleine Beispielapp. Diese setzt natürlich vorraus, dass du eine audio Datei mit dem entsprechenden namen im asset Ordner und und in der `pubspec.yaml` deklariert hast:

{{< highlight dart >}}
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 static AudioCache player = AudioCache();

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
         appBar: AppBar(
           title: Text("Sound abspielen Beispiel"),
         ),
         body: Center(
           child: RaisedButton(
             child: Text('Abspielen'),
             onPressed: () => {player.play("audio/explosion.mp3")},
           ),
         )),
   );
 }
}
{{< /highlight >}}

Die Beispielapp sieht so aus:

{{< figure src="images/sound-example.png" height="500" >}}