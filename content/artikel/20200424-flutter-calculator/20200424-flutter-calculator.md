---
title: "Taschenrechner in Flutter"
slug: "flutter-calculator" 
date: 2020-04-24T09:46:56+02:00
dateOfUpdate: 2021-06-10T09:46:56+02:00
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
              child: Text(
                0,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    counterButton("7"),
                    counterButton("8"),
                    counterButton("9"),
                    counterButton(operands["div"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("4"),
                    counterButton("5"),
                    counterButton("6"),
                    counterButton(operands["mul"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("1"),
                    counterButton("2"),
                    counterButton("3"),
                    counterButton(operands["sub"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("0"),
                    counterButton("Clear"),
                    counterButton(operands["equals"]),
                    counterButton(operands["add"]),
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

Widget counterButton(var buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => {},
        child: Text(buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              //backgroundColor: Colors.yellow,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
{{< /highlight >}}

## 3. Funktionen zu Buttons hinzufügen

Jetzt sind die Buttons zwar da, wenn man sie klickt, passiert jedoch nichts. Das werden wir jetzt ändern.

### Variable Output

Erstellt zuerst einmal die Variable `output` in der `_MyHomePageState` State-Klasse (die sich einen <a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html" target="_blank">State</a> merkt) und ersetzt im Container der Ergebnisanzeige `Text("0", ...)` durch `Text(output, ...)`. Nun wird anstatt einem festgeschriebenen Text der Inhalt einer Variable im `Text`-Widget ausgegeben.


{{< highlight dart >}}

class _MyHomePageState extends State<MyHomePage> {

  var output = "0";
  ...
}
  {{< /highlight >}}


{{< highlight dart >}}
Container(
  width: double.infinity,
  alignment: Alignment.centerRight,
  color: Colors.white,
  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
  child: Text(
    output,
    overflow: TextOverflow.clip,
    maxLines: 1,
    style: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
  ),
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
  valueOfOperation = 0.0;
  firstValue = 0.0;
  secondValue = 0.0;
  operand = "";
{{< /highlight >}}

`valueOfOperation` entspricht der Anzeige.
`firstValue` und `secondValue` sind die beiden eingegebenen Werte.
Der `operand` ist der mathematische Operator, also +,-,* oder /.

### Kalkulation

Jetzt können wir der `buttonPressed` Funktion sagen, was sie mit den eingegebenen Werten tun soll.

{{< highlight dart >}}
buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      valueOfOperation = 0.0;
      firstValue = 0.0;
      secondValue = 0.0;
      operand = "";
      //Wenn gleich gedrückt wird
    } else if (buttonText == operands["equals"]) {
      secondValue = double.parse(output);

      if (operand == operands["add"]) {
        valueOfOperation = firstValue + secondValue;
      } else if (operand == operands["sub"]) {
        valueOfOperation = firstValue - secondValue;
      } else if (operand == operands["mul"]) {
        valueOfOperation = firstValue * secondValue;
      } else if (operand == operands["div"]) {
        valueOfOperation = firstValue / secondValue;
      }
      firstValue = 0.0;
      secondValue = 0.0;
      operand = "";
      //Wenn ein anderer Operand gedrückt wird
    } else if (operands.containsValue(buttonText)) {
      firstValue = double.parse(output);
      operand = buttonText;
      valueOfOperation = 0.0;
      //Wenn eine Zahl gedrückt wird
    } else {
      if (valueOfOperation == 0.0) {
        valueOfOperation = double.parse(buttonText);
      } else {
        var zahlensplit = valueOfOperation.toString().split(".");
        var ganzzahl = zahlensplit[0];
        var kommazahl = zahlensplit[1];

        valueOfOperation =
            double.parse(ganzzahl + buttonText + "." + kommazahl);
      }
    }
{{< /highlight >}}

Bei der Eingabe von `Clear` wird keine Berechnung ausgeführt, sondern die Werte einfach auf 0 zurückgesetzt. 

Wenn der `buttonText` <b>+,-,* oder /</b> ist, legen wir fest, dass der erste Output, der ja ein String ist, zu einem Double geparst werden und in `firstValue` gespeichert soll. Das gleiche soll für den zweiten Output geschehen. 

Wenn der `buttonText` "=" entspricht, dann wird die Berechnung für das jeweilige Zeichen ausgeführt und das Ergebnis wieder in ein String umgewandelt.

Dann resetten wir noch den Wert von `firstValue`, `secondValue` und `valueOfOperation` zu `0`. 

Dann fügen wir unserem `valueOfOperation` noch den `buttonText` hinzu, damit dieser angezeigt wird, wenn keine Kalkulation durchgeführt wird.

Ganz zum Schluss geben wir, über setState, noch den Wert von `valueOfOperation` an `output`, damit er ausgegeben wird.

{{< highlight dart >}}
setState(
  () {
    var valueOfOperationString = valueOfOperation.toString();
    var valueOfOperationSplit = valueOfOperationString.split(".");

    if (valueOfOperationSplit[1] == "0") {
      output = valueOfOperationSplit[0];
    } else {
      output = valueOfOperationString;
    }
  },
);
{{</highlight>}}

#### Der komplette Code in der Main.dart

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Taschenrechner'),
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
  Map<String, String> operands = {
    "add": "+",
    "sub": "-",
    "mul": "*",
    "div": "/",
    "equals": "=",
  };

  var output = "0";

  var valueOfOperation = 0.0;
  var firstValue = 0.0;
  var secondValue = 0.0;
  var operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      valueOfOperation = 0.0;
      firstValue = 0.0;
      secondValue = 0.0;
      operand = "";
      //Wenn gleich gedrückt wird
    } else if (buttonText == operands["equals"]) {
      secondValue = double.parse(output);

      if (operand == operands["add"]) {
        valueOfOperation = firstValue + secondValue;
      } else if (operand == operands["sub"]) {
        valueOfOperation = firstValue - secondValue;
      } else if (operand == operands["mul"]) {
        valueOfOperation = firstValue * secondValue;
      } else if (operand == operands["div"]) {
        valueOfOperation = firstValue / secondValue;
      }
      firstValue = 0.0;
      secondValue = 0.0;
      operand = "";
      //Wenn ein anderer Operand gedrückt wird
    } else if (operands.containsValue(buttonText)) {
      firstValue = double.parse(output);
      operand = buttonText;
      valueOfOperation = 0.0;
      //Wenn eine Zahl gedrückt wird
    } else {
      if (valueOfOperation == 0.0) {
        valueOfOperation = double.parse(buttonText);
      } else {
        var zahlensplit = valueOfOperation.toString().split(".");
        var ganzzahl = zahlensplit[0];
        var kommazahl = zahlensplit[1];

        valueOfOperation =
            double.parse(ganzzahl + buttonText + "." + kommazahl);
      }
    }

    setState(
      () {
        var valueOfOperationString = valueOfOperation.toString();
        var valueOfOperationSplit = valueOfOperationString.split(".");

        if (valueOfOperationSplit[1] == "0") {
          output = valueOfOperationSplit[0];
        } else {
          output = valueOfOperationString;
        }
      },
    );
  }

  Widget counterButton(var buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              //backgroundColor: Colors.yellow,
              color: Colors.black,
            ),
          ),
        ),
      ),
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
              child: Text(
                output,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    counterButton("7"),
                    counterButton("8"),
                    counterButton("9"),
                    counterButton(operands["div"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("4"),
                    counterButton("5"),
                    counterButton("6"),
                    counterButton(operands["mul"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("1"),
                    counterButton("2"),
                    counterButton("3"),
                    counterButton(operands["sub"]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    counterButton("0"),
                    counterButton("Clear"),
                    counterButton(operands["equals"]),
                    counterButton(operands["add"]),
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