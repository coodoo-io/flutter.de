---
title: "Logging mit Flutter"
slug: "logging-mit-flutter" 
date: 2019-10-14T11:26:53+02:00
draft: true
header_image: "/artikel/20191001-logging-mit-flutter/images/notebook.jpg"
images: ["/artikel/20191001-logging-mit-flutter/images/notebook.jpg"]
description: "In diesem Flutter Artikel wird erklärt, wie man einen Logger einbauen kann."
tags: ["flutter-logging","flutter","Logger"]
categories: Anfänger * Logging
authors: ["tristan-schuller"]
link: 20191001-logging-mit-flutter/20191001-logging-mit-flutter.md
author: Tristan Schuller
---

Einen Logger zu nutzen ist praktisch – auch bei Flutter.
In diesem Artikel möchte ich eine Möglichkeit aufzeigen einen Logger in neue, oder bestehende Projekte zu implementieren. 

## Den Logger in Flutter einbauen

<div class="alert alert-info">Hinweis: Das Flutter Tutorial bezieht sich auf das <a href="https://pub.dev/packages/logger#-readme-tab-" target="_blank" rel="noopener">logger</a> Dart Package. Wir verwenden ein neu erstelltes Projekt, wie man es auch auf <a href="" target="_blank" rel="noopener">flutter.dev/docs/get-started/test-drive</a> findet. Das Hinzufügen des Loggers in bestehende Projekte verhält sich allerdings gleich.</div>

##### Unsere `main.dart` sieht zu Beginn so aus:

{{< highlight dart >}}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: exampleMethod,
          child: Text(
            "Log-Nachricht ausgeben.",
            style: TextStyle(fontSize: 20.0),
          ),
        )),
      ),
    );
  }

  exampleMethod() {}
}
{{< /highlight >}}

Eine Seite mit einem `FlatButton` Widget in der Mitte, welcher eine Methode auslöst, in der allerdings noch nichts passiert.

##### 1. Füge das <a href="https://pub.dev/packages/logger#-readme-tab-" target="_blank" rel="noopener">logger</a> Package zu der `pubspec.yaml` Datei hinzu.

{{< highlight console >}}
dependencies:
  flutter:
    sdk: flutter

  logger: ^0.7.0+2
{{< /highlight >}}

##### 2. Im Projekt `flutter pub get` aufrufen, um das Package zum Projekt hinzuzufügen.

##### 3. Wir lagern den Logger aus. Erstelle eine Datei `logger.util.dart`.

{{< figure src="/artikel/20191001-logging-mit-flutter/images/logger-in-file-tree.png" width="320" >}}

##### Füge folgenden Code in die neu erstellte Datei ein.

{{< highlight dart >}}
import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(
      lineLength: 90,
      colors: false,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
{{< /highlight >}}

Das Auslagern machen wir, um uns etwas Schreibarbeit zu sparen und einheitliche Logging-Ausgaben zu erreichen. Der `PrettyPrinter` hat viele verschiedene Einstellungsmöglichkeiten. Wir definieren hier erst mal ein paar Grundeinstellungen für unsere Logging-Ausgabe. Dass wir `colors: false` einstellen müssen, liegt daran, dass momentan die Farbausgabe nur bei Android Geräten funktioniert.

##### 4. Nun die `main.dart` öffnen und die Packages importieren.
{{< highlight dart >}}
import 'package:logger/logger.dart';
import 'package:logging_with_flutter/logger.util.dart';
{{< /highlight >}}

##### 5. Dann in der `main()` das Level des Loggers einstellen.
{{< highlight dart >}}
void main() {
  Logger.level = Level.debug;
  runApp(MyApp());
}
{{< /highlight >}}

Der Logger bietet, wie auch bei anderen Loggern üblich, mehrere Logging-Level an, um die Logs in Kategorien zu unterteilen. Das logger Package besteht aus den Leveln *verbose, debug, info, warning, error, wtf, nothing* und sollte damit so ziemlich jeden Fall abdecken, für den man Logs erstellen möchte. In unserem Projekt beschränken wir uns auf die Stufen `debug, info` und `error`. Stellt man, so wie hier, das Level auf *debug*, so werden alle Logs der Stufe debug abwärts angezeigt, also debug, info und error. Stellt man die Stufe auf info, so werden nur die Logs für info und error angezeigt usw. Somit hat man die Möglichkeit z.B. in der Produktionsumgebung nur bestimmte Levels anzuzeigen.

##### 6. Nun kann man in der Klasse, in der man den Logger benutzen möchte, eine Instanz des Loggers erstellen. In unserem Beispiel ist dies die Klasse `MyApp`.
{{< highlight dart >}}
class MyApp extends StatelessWidget {
  final log = getLogger();
{{< /highlight >}}

##### 7. Jetzt den Logger wie auch normale `print()` Ausgaben benutzen.
Die Log-Ausgaben, wie hier im Beispiel, an den gewünschten Stellen einfügen.

{{< highlight dart >}}
class MyApp extends StatelessWidget {
  final log = getLogger();

  @override
  Widget build(BuildContext context) {
    log.d('Debug-Nachricht aus der build-Methode.');
    log.i('Info-Nachricht aus der build-Methode.');
    log.e('Error-Nachricht aus der build-Methode.');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: exampleMethod,
          child: Text(
            "Log-Nachricht ausgeben.",
            style: TextStyle(fontSize: 20.0),
          ),
        )),
      ),
    );
  }

  exampleMethod() {
    log.d('Eine Debug-Nachricht aus einer anderen Methode.');
  }
}
{{< /highlight >}}

Wir haben hier drei Log-Ausgaben in der `build` Methode erstellt und eine weitere in einer Methode `exampleMethod()`, die durch ein `FlatButton` Widget ausgelöst wird. Man schreibt `log.i('')` für das Level **info**, `log.d('')` für **debug** und `log.e('')` für das Level **error**. 


##### 8. Nun das Projekt mit `flutter run` starten.
Die Ausgabe im `Terminal`, hier in **Visaul Studio Code** sieht dann so aus:

{{< highlight console >}}
┌──────────────────────────────────────────────────────────────────────────────
│ #0   MyApp.build (package:logging_with_flutter/main.dart:15:9)
├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
│ 🐛 Debug-Nachricht aus der build-Methode. 
└──────────────────────────────────────────────────────────────────────────────
┌──────────────────────────────────────────────────────────────────────────────
│ #0   MyApp.build (package:logging_with_flutter/main.dart:16:9)
├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
│ 💡 Info-Nachricht aus der build-Methode.
└──────────────────────────────────────────────────────────────────────────────
┌──────────────────────────────────────────────────────────────────────────────
│ #0   MyApp.build (package:logging_with_flutter/main.dart:17:9)
├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
│ ⛔ Error-Nachricht aus der build-Methode.
└──────────────────────────────────────────────────────────────────────────────
┌──────────────────────────────────────────────────────────────────────────────
│ #0   MyApp.exampleMethod (package:logging_with_flutter/main.dart:36:9)
├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
│ 🐛 Eine Debug-Nachricht aus einer anderen Methode.
└──────────────────────────────────────────────────────────────────────────────
{{< /highlight >}}

Hier sieht man in welcher *Klasse* und in welcher *Methode*, sowie in welcher *Datei*, die Log-Nachricht ausgegeben wurde. Um die verschiedenen Level des Logs unterscheiden zu können, werden Emojis genutzt.<br/> Hier also 🐛(debug), 💡(info) und ⛔(error).


#### Hier der vollständige Code für unser Logging-Beispiel:

`logger.util.dart`

{{< highlight dart >}}
import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(
      lineLength: 90,
      colors: false,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
{{< /highlight >}}
<br/>
`main.dart`

{{< highlight dart >}}
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logging_with_flutter/logger.util.dart';

void main() {
  Logger.level = Level.debug;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = getLogger();

  @override
  Widget build(BuildContext context) {
    log.d('Debug-Nachricht aus der build-Methode.');
    log.i('Info-Nachricht aus der build-Methode.');
    log.e('Error-Nachricht aus der build-Methode.');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: exampleMethod,
          child: Text(
            "Log-Nachricht ausgeben.",
            style: TextStyle(fontSize: 20.0),
          ),
        )),
      ),
    );
  }

  exampleMethod() {
    log.d('Eine Debug-Nachricht aus einer anderen Methode.');
  }
}
{{< /highlight >}}

##### Du findest dieses Flutter Projekt und alle anderen Projekte aus unseren Artikeln auch <a href="https://github.com/coodoo-io/flutter-samples" target="_blank" rel="noopener">hier</a> auf Github.