---
title: "Flame in Flutter anwenden"
slug: "flame-in-flutter" 
date: 2019-06-21T15:56:45+02:00
draft: true
description: "Mobile Spiele entwickeln mit Flame"
tags: ["flutter","flame","game"]
categories: []
author: Leon Adam
---


<!-----
Original Google Doc Post: https://medium.com/@leon.adam/flame-in-flutter-nutzen-68dc4643482
----->

Um Mobile-Games in Flutter umzusetzen, kann die Bibliothek Flame genutzt werden. Dieser Artikel zeigt beispielhaft das Benutzen von Flame in Flutter. Wir werden eine kleine Flame-Anwendung bauen. Für die Voraussetzung um Flame zu installieren, sollte Flutter vorher installiert sein. Das Beispiel wurde inVisualStudioCode umgesetzt.

Zu Beginn erstellen wir eine leeres Projekt mit einem Konsolen-Befehl in einem beliebigen Verzeichnis. Wir geben folgendem Befehl ein:

{{< highlight bash >}}
create flutter_and_flame
{{< /highlight >}}

Danach öffnen wir das neue Projekt im VSC und führen es aus, indem wir auf das linke Symbol für "Debug" klicken..

{{< figure src="images/debug.png" height="50" >}}

..und ein Device auswählen z.B den IOS Simulator. Der Simulator kann rechts neben dem Start-Button ausgewählt werden.

{{< figure src="images/start-button.png" height="50" >}}

Danach fügen wir in der `pubspec.yaml` Flame zu den Dependencies hinzu.

{{< figure src="images/pubspec.png" height="150" >}}

Nach dem Speichern wird Flame automatisch zum Projekt hinzugefügt. Dann erstellen wir im Verzeichnis `./lib`  eine neue Datei mit dem Namen `test-game.dart` und füllen sie wie folgt:

{{< figure src="images/test-game-leer.png" height="500" >}}

Das ist unsere Grundlage für das Spiel. Die Methoden haben folgende Aufgaben:

ender(): Zeichnet Objekte z.B. Rechtecke und Texte.

update(): Nach jedem Frame wird diese Methode aufgerufen.

resize(): Bestimmt die Größe des Bildschirms, in dem das Spiel abläuft.

In der main.dart definieren wir oberhalb der Klasse eine Methode zum Starten unserer Spiels.

{{< figure src="images/main-start.png" height="500" >}}

Innerhalb unserer generierten Klasse MyApp reduzieren wir den Code auf einen Button und etwas Style.

{{< figure src="images/main-myapp.png" height="500" >}}

{{< figure src="images/main-myhomepagestate.png" height="865" >}}

Jetzt haben wir eine Flutter-Anwendung gebaut mit einem Start-Button, der beim Drücken zum Flame-Spiel führt.

{{< figure src="images/menu.png" height="600" >}}

Jetzt fehlt nur noch das Spiel.

Wir fügen dem Spiel ein Rechteck hinzu.

{{< figure src="images/test-game-render.png" height="500" >}}

Mit den privaten Variablen bewegen wir das Rechteck bewegen. Innerhalb von update() werden die Werte gesetzt.

{{< figure src="images/test-game-update.png" height="850" >}}

Nach jedem Frame wird in update() der x- oder y-Parameter vom Rechteck um 1 erhöht oder gesenkt, je nach Fall. Danach sollte nach dem Drücken von Start ein rotes Rechteck zu sehen sein, das sich im Uhrzeigersinn am Rand des Bildschirms bewegt.

{{< figure src="images/game.png" height="600" >}}

Und so haben wir Flame zu unserem Flutter-Projekt hinzugefügt!
<!-- Docs to Markdown version 1.0β17 -->
