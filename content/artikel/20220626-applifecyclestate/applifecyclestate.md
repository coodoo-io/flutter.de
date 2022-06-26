---
title: "AppLifecycle - Erkennen, wenn sich die App in den Hintergrund bzw. Vordergrund bewegt"
date: 2022-06-26T11:00:59+02:00
draft: false
header_image: "/artikel/20220626-applifecyclestate/images/header.png"
images: ["/artikel/20220626-applifecyclestate/images/header.png"]
authors: ["oualid-boutakhrit"]
description: "Erkennen, wenn sich die App in den Hintergrund bzw. Vordergrund bewegt"
tags: ["flutter", "applifecycle", "widgetsbindingobserver", "hintergrund", "background", "vodergrund",
"foreground"]
categories: Anfänger * Flutter
link: 20220626-applifecyclestate/boxconstraints-forces-an-infinite-height.md
---

In diesem Artikel implementieren wir einen Beobachter um zu erkennen, wenn sich die App in den 
Hintergrund bzw. wieder in den Vordergrund bewegt.


Am Ende diesen Artikels werden wir folgendes Ergebnis erzielen:\

<img width="350" height="550" src="/artikel/20220626-applifecyclestate/images/applifecyclestate_preview.gif">

---

# Inhaltsverzeichnis
1. [Beschreibung der Situation ](#first)
2. [Schritte zur Umsetzung](#second)
3. [Wie geht es weiter?](#third)

---

### 1. Beschreibung der Situation <a name="first"></a>
In manchen Situationen ist es notwendig einen bestimmten Zustand zu sichern oder eine Meldung 
anzuzeigen bevor der User / die Userin die App verlässt. Hierzu bietet uns Flutter ein Mechanismus,
um diesen Moment zu erkennen und entsprechend  darauf zu reagieren. Im nächsten Abschnitt werden die 
Schritte beschrieben, um diesen Mechanisumus auch in deiner App einzusetzen.

---

### 2. Schritte zur Umsetzung <a name="second"></a>

##### Schritt 1:

Füge die Klasse `WidgetsBindingObserver` als Mixin mit `with`.

{{<highlight dart>}}
class _MyCustomFormState extends State<MyCustomForm> with WidgetsBindingObserver {
{{</highlight>}}


##### Schritt 2:

Implementiere die `initState()` Methode. Beim Aufruf einer Klasse wird die `initState` Methode als 
erstes ausgeführt.
An dieser Stelle fügen wir den Beobachter hinzu.

{{<highlight dart>}}
@override
void initState() {
 super.initState();
 WidgetsBinding.instance?.addObserver(this);
}
{{</highlight>}}


##### Schritt 3:

Implementiere die `didChangeAppLifecycleState` Methode. Diese Methode wird jedesmal aufgerufen, 
wenn der Beobachter eine Veränderung mitteilt.
An dieser Stelle haben wir alle möglichen Zustände in unserem Beispiel mit einem Switch 
implementiert. Hier kann es auch ausreichen nur einen Zustand mit einem `If`-Statement abzufragen, 
wenn nur dann ein bestimmter Code-Teil ausgeführt werden soll.

{{<highlight dart>}}
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
 super.didChangeAppLifecycleState(state);
 switch (state) {
   case AppLifecycleState.resumed:
     print("app in resumed");
     break;
   case AppLifecycleState.inactive:
     print("app in inactive");
     break;
   case AppLifecycleState.paused:
     print("app in paused");
     break;
   case AppLifecycleState.detached:
     print("app in detached");
     break;
 }
}
{{</highlight>}}

##### Schritt 4:

Implementiere die `dispose` Methode. Diese wird beim Verlassen der Klasse ausgeführt.
An dieser Stelle entfernen wir den Beobachter wieder.

{{<highlight dart>}}
@override
void dispose() {
 WidgetsBinding.instance?.removeObserver(this);
 super.dispose();
}
{{</highlight>}}

> **Hinweis:**\
> Wenn Klasse mit dem Beobachter nicht mehr zum `Kontext` gehört. Dann werden Veränderungen am App
> Zustand nicht mehr registriert. Bspw: Wenn von der Seite mit dem Observer zu einer anderen Seite
> mit pushReplacement navigiert wird, dann wird die `dispose` Methode aufgerufen und der Beobachter
> inaktiv.


##### Kompletter Code:

{{<highlight dart>}}
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppLifecycle Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
{{</highlight>}}

---

### 3. Wie geht es weiter? <a name="third"/>
Bevor die App in den Hintergrund wandert sollen Daten persistent gespeichert werden? Im folgenden 
Artikel wird beschrieben, wie das peristente Speichern der Daten mittels Dateien funktioniert:
[Daten auf einem Smartphone speichern mit Flutter](https://https://flutter.de/artikel/flutter-how-to-write-files.html)

