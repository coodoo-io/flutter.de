---
title: "HTTP Anfragen in Flutter"
slug: "http-flutter" 
date: 2021-06-17T14:09:25+02:00
draft: false
header_image: "/artikel/20210617-httpAnfragenInFlutter/images/header.png"
images: ["/artikel/20210617-httpAnfragenInFlutter/images/header.png"]
description: "http-anfragen in flutter"
tags: ["flutter"]
categories: Anfänger * http 
authors: ["andreas-mayer"]
link: 20210617-httpAnfragenInFlutter/httpAnfragenInFlutter.md
---

Viele Seiten im Internet bieten zusätzlich zu ihrer normalen Funktionalität eine restige Schnittstelle an. Um auf diese zuzugreifen muss eine HTTPAnfrage gestellt werden, wie das mit Flutter funktioniert wird in diesem Artikel behandelt.

Eigentlich ist es ganz einfach. Zunächst fügen wir die aktuellste Version der http Biliothek hinzu. (Zu finden auf [Pub.dev](https://pub.dev/packages/http "Pub.dev"))
{{<highlight yaml>}}
http: ^0.13.3
{{</highlight>}}

Diese importieren wir dann (am Besten direkt als Variable) in unser Projekt.
{{<highlight dart>}}
import 'package:http/http.dart' as http;
{{</highlight>}}

Mit der Biliothek kann jetzt eine Anfrage auf eine Uri gestartet werden. Im Beispiel starte ich eine HTTP Anfrage auf eine Chuck Norris Witz API.
{{<highlight dart>}}
final response = await http.get(
    Uri.parse("https://api.chucknorris.io/jokes/random"),
);   
{{</highlight>}}

Um sicherzustellen das alles geklappt hat sollten wir den statusCode überprüfen (200 bedeutet OK).
{{<highlight dart>}}
if (response.statusCode == 200) {  
{{</highlight>}}

Wenn wir Statuscode OK haben können wir den response.body decodieren.
{{<highlight dart>}}
var result = jsonDecode(response.body);
{{</highlight>}}

Die Variable result erhält nun die JSON Struktur abgebildet auf DartDatentypen. Damit lässt sich arbeiten. Nun kann man auf den Wert des Witzes zugreifen.
{{<highlight dart>}}
_fact = result["value"];
{{</highlight>}}

Hier noch einmal der gesamte Code:
{{<highlight dart>}}
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _fact = "";
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _requestFact();
  }

  _requestFact() async {
    final response = await http.get(
      Uri.parse("https://api.chucknorris.io/jokes/random"),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(
        () {
          _fact = result["value"];
          _isLoading = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? CircularProgressIndicator()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _fact,
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestFact,
        tooltip: "New Fact",
        child: Icon(Icons.refresh),
      ),
    );
  }
}

{{</highlight>}}