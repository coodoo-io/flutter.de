---
title: "Taschenrechner in Flutter"
slug: "flutter-calculator" 
date: 2020-04-24T09:46:56+02:00
draft: false
header_image: "/artikel/20200424-flutter-calculator/images/numbers.jpg"
images: ["/artikel/20200424-flutter-calculator/images/numbers.jpg"]
description: "In diesem Flutter Tutorial bauen wir eine Taschenrechner App."
tags: ["taschenrechner","flutter"]
categories: Anfänger * Taschenrechner * UI
authors: ["nadia-micheilis"]
link: 20200424-flutter-calculator/20200424-flutter-calculator.md
author: Nadia Micheilis
---

Wer Flutter Anfänger ist und erst einmal mit den Basics von Flutter anfangen will, kann mit einem Flutter Taschenrechner beginnen. Dieses Flutter Tutorial zeigt euch ganz einfach Schritt für Schritt wie ihr eure eigenen Flutter Taschenrechner bauen könnt. 

Wenn wir fertig sind, wird der Taschenrechner so aussehen:

{{< figure src="/artikel/20200424-flutter-calculator/images/calculator.png" width="420">}}

## 1. Das Projekt erstellen

Wie ihr ein Flutter Projekt erstellt, erfahrt ihr in diesem Artikel: <a href="https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten.html" target="_blank" title="Flutter First Steps">Flutter First Steps</a>.


## 2. Das UI erstellen

Zuerst löschen wir alles, was in `body` enthalten ist und ersetzen es durch das Layout unseres Taschenrechners.

{{< highlight dart >}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text("0",
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    counterButton("7"),
                    counterButton("8"),
                    counterButton("9"),
                    counterButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("4"),
                    counterButton("5"),
                    counterButton("6"),
                    counterButton("X"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("1"),
                    counterButton("2"),
                    counterButton("3"),
                    counterButton("_"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("0"),
                    counterButton("CL"),
                    counterButton("="),
                    counterButton("+"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
{{< /highlight >}}

In der ersten Column ist das Feld für die Anzeige unseres Ergebnisses. Danach folgen die Reihen für die Zahlen und Befehle. Ich habe das Styling für die einzelnen Buttons, für eine bessere Übersicht, ausgelagert. Hierfür habe ich einfach ein Widget `counterButton` deklariert und es in die Rows eingefügt.

{{< highlight dart >}}

class _MyHomePageState extends State<MyHomePage> {

  Widget counterButton(String buttonText) {
    return Expanded(
      child: new OutlineButton(
          onPressed: () {},
          child: new Text(buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          color: Colors.white,
          textColor: Colors.black,
          padding: EdgeInsets.all(24.0)),
    );
  }
{{< /highlight >}}

## 3. Funktionen zu Buttons hinzufügen

Jetzt sind die Buttons zwar da, wenn man sie klickt, passiert jedoch nichts. Das werden wir jetzt ändern.

### Variable Output

Erstellt zuerst einmal die Variable `output` in der `_MyHomePageState` State-Klasse (die sich einen <a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html" target="_blank">State</a> merkt) und ersetzt im Container der Ergebnisanzeige `Text("0", ...)` durch `Text(output, ...)`. Nun wird anstatt einem festgeschriebenen Text der Inhalt einer Variable im `Text`-Widget ausgegeben.


{{< highlight dart >}}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  ...
}
  {{< /highlight >}}


{{< highlight dart >}}
Container(
  width: double.infinity,
  alignment: Alignment.centerRight,
  color: Colors.white,
  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
  child: Text(output,
      style:
          TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
),
  {{< /highlight >}}

### onPressed Event

Jetzt ist es Zeit dem `onPressed` Event der Buttons eine Funktion anzufügen, die jedes Mal ausgeführt wird, wenn der Button gedrückt wird. Wir nennen die Funktion einfach `buttonPressed`, welche die Value `buttonText` hat.

{{< highlight dart >}}

Widget counterButton(String buttonText) {
    return Expanded(
      child: new OutlineButton(
          onPressed: () => buttonPressed(buttonText),
          child: new Text(buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          color: Colors.white,
          textColor: Colors.black,
          padding: EdgeInsets.all(24.0)),
    );
  }
{{< /highlight >}}

Dann deklarieren wir die Funktion in der `_MyHomePageState` State-Klasse wie folgt: 

{{< highlight dart >}}
buttonPressed(String buttonText) {}
{{< /highlight >}}

Bevor wir die Funktion mit `if`s und `else`s füllen, müssen wir noch ein paar Variablen deklarieren.
{{< highlight dart >}}
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
{{< /highlight >}}

`_output` entspricht der Anzeige.
`num1` und `num2` sind die beiden eingegebenen Werte.
Der `operand` ist der mathematische Operator, also +,-,x oder /.

### Kalkulation

Jetzt können wir der `buttonPressed` Funktion sagen, was sie mit den eingegebenen Werten tun soll.

{{< highlight dart >}}
class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CL") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }
{{< /highlight >}}

Bei der Eingabe von `CL` (also `CLEAR`) wird keine Berechnung ausgeführt, sondern die Werte einfach auf 0 zurückgesetzt. 

Wenn der `buttonText` <b>+,-,x oder /</b> ist, legen wir fest, dass der erste Output, der ja ein String ist, zu einem Double geparst werden und in `num1` gespeichert soll. Das gleiche soll für den zweiten Output geschehen. 

Wenn der `buttonText` "=" entspricht, dann wird die Berechnung für das jeweilige Zeichen ausgeführt und das Ergebnis wieder in ein String umgewandelt.

Dann resetten wir noch den Wert von `num1`, `num2` und `_output` zu `0`. 

Dann fügen wir unserem `_output` noch den `buttonText` hinzu, damit dieser angezeigt wird, wenn keine Kalkulation durchgeführt wird.

Und ganz zum Schluss geben wir noch den Wert von `_output` als String aus.

#### Der komplette Code in der Main.dart

{{< highlight dart >}}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Taschenrechner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CL") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget counterButton(String buttonText) {
    return Expanded(
      child: new OutlineButton(
          onPressed: () => buttonPressed(buttonText),
          child: new Text(buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          color: Colors.white,
          textColor: Colors.black,
          padding: EdgeInsets.all(24.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(output,
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    counterButton("7"),
                    counterButton("8"),
                    counterButton("9"),
                    counterButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("4"),
                    counterButton("5"),
                    counterButton("6"),
                    counterButton("X"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("1"),
                    counterButton("2"),
                    counterButton("3"),
                    counterButton("_"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("0"),
                    counterButton("CL"),
                    counterButton("="),
                    counterButton("+"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
{{< /highlight >}}

#### Was haben wir gelernt?

Es ist nicht schwer leichte Anwendungen in Flutter auszuführen. Der nächste Schritt in der Lernkurve ist Werte in einem <a href="https://flutter.de/artikel/flutter-formulare.html" target="_blank" rel="noopener">Formular</a> einzugeben und in einer lokalen Datenbank zu speichern. Probiert es aus!