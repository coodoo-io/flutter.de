---
title: "Flame in Flutter anwenden"
slug: "flame-in-flutter-mobile-game" 
date: 2019-06-17T07:56:45+02:00
draft: true
header_image: "/artikel/20190717-flutter-and-flame/images/flutter_flame.png"
images: ["/artikel/20190717-flutter-and-flame/images/flutter_flame.png"]
description: "Flame in Flutter einbinden und mobile Spiele entwickeln."
tags: ["flutter","flame","game"]
categories: Fortgeschrittene * Flame * Mobile Game * Framework
author: Leon Adam
link: 20190717-flutter-and-flame/220190717-flutter-and-flame.md
---

Wer Mobile-Games in Flutter umzusetzen möchte, kann sich der `Flame` Bibliothek bedienen, die sehr einfach zu nutzen ist und schnelle Ergebnisse liefert. Dieser Artikel zeigt euch, wie ihr Flame zu Flutter hinzufügt und eine kleine Anwendung baut. Vorher solltet ihr natürlich Flutter installieren. Eine Anleitung findet ihr [hier] (https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten.html). Dieses Beispiel wurde in VisualStudioCode umgesetzt.

## 1. Projekt erstellen 
Zu Beginn erstellen wir eine leeres Projekt mit einem Konsolen-Befehl in einem beliebigen Verzeichnis. Wir geben folgenden Befehl ein:

{{< highlight bash >}}
create flutter_and_flame
{{< /highlight >}}

Danach öffnen wir das neue Projekt im VSC und führen es aus, indem wir auf das linke Symbol für "Debug" klicken..

{{< figure src="/artikel/20190717-flutter-and-flame/images/debug.png" height="50" >}}

..und ein Device auswählen z.B den IOS Simulator. Der Simulator kann rechts neben dem Start-Button ausgewählt werden.

{{< figure src="/artikel/20190717-flutter-and-flame/images/start-button.png" height="50" >}}

## 2. Flame zu Dependencies hinzufügen

Danach fügen wir in der `pubspec.yaml` Flame zu den Dependencies hinzu.

{{< figure src="/artikel/20190717-flutter-and-flame/images/pubspec.png" height="150" >}}

Nach dem Speichern wird Flame automatisch zum Projekt hinzugefügt. 

## 3. Verzeichnis
Dann erstellen wir im Verzeichnis `./lib`  eine neue Datei mit dem Namen `test-game.dart` und füllen sie wie folgt:

{{< figure src="/artikel/20190717-flutter-and-flame/images/test-game-leer.png" height="500" >}}

Das ist unsere Grundlage für das Spiel. Die Methoden haben folgende Aufgaben:

ender(): Zeichnet Objekte z.B. Rechtecke und Texte.

update(): Nach jedem Frame wird diese Methode aufgerufen.

resize(): Bestimmt die Größe des Bildschirms, in dem das Spiel abläuft.

## 4. Starten des Spiels

In der `main.dart` definieren wir oberhalb der Klasse eine Methode zum Starten unserer Spiels.

{{< figure src="/artikel/20190717-flutter-and-flame/images/main-start.png" height="500" >}}

Innerhalb unserer generierten Klasse MyApp reduzieren wir den Code auf einen Button und etwas Style.

{{< figure src="/artikel/20190717-flutter-and-flame/images/main-myapp.png" height="500" >}}

{{< figure src="/artikel/20190717-flutter-and-flame/images/main-myhomepagestate.png" height="865" >}}

Jetzt haben wir eine Flutter-Anwendung gebaut mit einem Start-Button, der beim Drücken zum Flame-Spiel führt.

{{< figure src="/artikel/20190717-flutter-and-flame/images/menu.png" height="600" >}}

Jetzt fehlt nur noch das Spiel.

## 5. Spiel erstellen

Wir fügen dem Spiel ein Rechteck hinzu.

{{< figure src="/artikel/20190717-flutter-and-flame/images/test-game-render.png" height="500" >}}

Mit den privaten Variablen bewegen wir das Rechteck. Innerhalb von update() werden die Werte gesetzt.

{{< figure src="/artikel/20190717-flutter-and-flame/images/test-game-update.png" height="850" >}}

Nach jedem Frame wird in update() der x- oder y-Parameter vom Rechteck um 1 erhöht oder gesenkt, je nach Fall. Danach sollte nach dem Drücken von Start ein rotes Rechteck zu sehen sein, das sich im Uhrzeigersinn am Rand des Bildschirms bewegt.

{{< figure src="/artikel/20190717-flutter-and-flame/images/game.png" height="600" >}}

Und so haben wir Flame zu unserem Flutter-Projekt hinzugefügt!

