---
title: "Wo sind meine Widgets hin verschwunden und was bedeutet \"BoxConstraints forces an infinite height\"?"
date: 2022-05-26T11:00:59+02:00
draft: false
header_image: "/artikel/20220526-boxconstraints-forces-an-infinite-height/images/header.png"
images: ["/artikel/20220526-boxconstraints-forces-an-infinite-height/images/header.png"]
authors: ["oualid-boutakhrit"]
description: "Warum taucht die Fehlermeldung `BoxConstraints forces an infinite height` auf? Dieser Artikel
schaut sich die Ursache an und bietet eine Lösungsmöglichkeit."
tags: ["flutter", "parentdatawidget", "flutter boxconstraints error", "boxconstraints forces an infinite height"]
categories: Anfänger * Flutter
link: 20220526-boxconstraints-forces-an-infinite-height/boxconstraints-forces-an-infinite-height.md
---

In diesem Artikel gehen wir auf die Fehlermeldung `BoxConstraints forces an infinite height` ein. Wir 
schauen uns an, warum diese Fehlermeldung angezeigt wird und wie damit umgegangen werden kann.
Diese Meldung taucht immer dann auf, wenn nicht das passende Widget genutzt wurde.

Die Fehlermeldung die in der Konsole ausgegeben wird sieht wie folgt aus:\

<img width="950" height="550" src="/artikel/20220526-boxconstraints-forces-an-infinite-height/images/console_error.png">

---

# Inhaltsverzeichnis
1. [Beschreibung der Situation ](#first)
2. [Ursache der Fehlermeldung](#second)
3. [Lösung der Fehlermeldung](#third)
4. [Wie geht es weiter?](#fourth)

---

### 1. Beschreibung der Situation <a name="first"></a>
Es soll in einem `Column` über die komplette Seite gestreckt ein drei `Container` mit unterschiedlichen 
Hintergrundfarben plaziert werden. In unserem Beispiel wollen wir die zwei äußeren `Container` blau 
und den mittleren Gelb färben. Die beiden blauen `Container` werden mit einer höhe von 100 definiert.
Der gelbe `Container` soll gestreckt sein und den restlichen Raum einnehmen. Wenn `SizedBox.expand` 
eingesetzt wird, um den gelben `Container` zu strecken, dann erhalten wir folgendes Ergebnis:

<img width="350" height="550" src="/artikel/20220526-boxconstraints-forces-an-infinite-height/images/wrong_screen.png">

Es wird nur der erste blaue `Container` dargestellt. Die restlichen Widgets bleiben verschwunden.
Ein Blick in die Konsole zeigt, dass etwas schief gelaufen ist. Wir erhalten die Fehlermeldung 
`BoxConstraints forces an infinite height`.

---

### 2. Ursache der Fehlermeldung <a name="second"></a>
Der Code der das obige Verhalten verursacht sieht wie folgt aus:

{{<highlight dart>}}
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  static const String _title = 'Flutter Code Sample';


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}


class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
            SizedBox.expand(
              child: Container(
                color: Colors.amber,
                width: 100,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
{{</highlight>}}

Die Fehlermeldung wird durch das `SizedBox.expand` Widget verursacht. Der Grund hierfür ist, dass ein 
`SizedBox.expand` Widget so designed ist, dass dieser nur in `SingleChildRenderObjectWidget` wie 
`Scaffold`, `Center` oder `Padding` eingesetzt werden kann. Das sind alles Widgets die nur ein `child`
erwarten. In dem obigen Beispiel wird jedoch das `SizedBox.expand` Widget in `children` des
`Column` Widgets eingebettet.

---

### 3. Lösung der Fehlermeldung <a name="third"></a>
Wie im vorherigen Abschnitt bereits beschrieben, kann das `SizedBox.expand` Widget nur in 
`SingleChildRenderObjectWidget` Widgets eingebettet werden. In unserem Beispiel möchten wir, jedoch 
das gelbe `Container` Widget in einem `Column` Widget gestreckt anzeigen. Das `Column` Widget ist ein
`MultiChildRenderObjectWidget`. Um ein anderes Widget in einem `MultiChildRenderObjectWidget` Widget
zu strecken, muss das `Expanded` Widget verwendet werden. Wenn wir das `Expanded` 
statt `SizedBox.expand` einsetzen, erhalten wir folgendes Ergebnis:\

<img width="350" height="550" src="/artikel/20220526-boxconstraints-forces-an-infinite-height/images/solution_screen.png">

Der vollständige Code mit `Expanded`, der die Fehlermeldung `BoxConstraints forces an infinite height` löst:

{{<highlight dart>}}
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  static const String _title = 'Flutter Code Sample';


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}


class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                width: 100,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
{{</highlight>}}

---

### 4. Wie geht es weiter? <a name="fourth"/>
Schon einmal auf die Fehlermeldung `Incorrect use of ParentDataWidget` gestoßen? Was die Fehlermeldung
bedeutet und was zu tun ist um diese wieder los zu werden lässt sich hier herausfinden:
[Was tun bei "Incorrect use of ParentDataWidget"](https://flutter.de/artikel/was-tun-bei-incorrect-use-of-parentdatawidget.html)

