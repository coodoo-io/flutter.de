---
title: "Flutter Bux Fixing: Incorrect use of ParentDataWidget"
date: 2022-05-25T20:14:59+02:00
draft: false
header_image: "/artikel/20220525-incorrect-use-of-parentdatawideget/images/header_top_part.png"
images: ["/artikel/20220525-incorrect-use-of-parentdatawideget/images/header_top_part.png"]
authors: ["oualid-boutakhrit"]
description: "Warum taucht die Fehlermeldung `Incorrect use of ParentDataWidget` auf? Dieser Artikel
schaut sich die Ursache an und bietet eine Lösungsmöglichkeit."
tags: ["flutter", "parentdatawidget", "flutter expanded error", "incorrect use of parentdatawidget"]
categories: Anfänger * Flutter
link: 20220525-incorrect-use-of-parentdatawideget/incorrect-use-of-parentdatawidget.md
---

In diesem Artikel gehen wir auf die Fehlermeldung `Incorrect use of ParentDataWidget` ein. Wir 
schauen uns an, warum diese Fehlermeldung angezeigt wird und wie damit umgegangen werden kann.
Diese Meldung taucht immer dann auf, wenn nicht das passende Widget genutzt wurde.

Die Fehlermeldung die in der Konsole ausgegeben wird sieht wie folgt aus:\

<img width="950" height="550" src="/artikel/20220525-incorrect-use-of-parentdatawideget/images/console_error.png">

---

# Inhaltsverzeichnis
1. [Beschreibung der Situation ](#first)
2. [Ursache der Fehlermeldung](#second)
3. [Lösung der Fehlermeldung](#third)
4. [Wie geht es weiter?](#fourth)

---

### 1. Beschreibung der Situation <a name="first"></a>
Es soll in einem `Scaffold` über die komplette Seite gestreckt ein anderes Widget plaziert werden.
In unserem Beispiel wollen wir die komplette Seite grün einfärben. Um die Farbe anzuzeigen nutzen wir
einen `Container` mit grüner Farbe. Wenn wir das `Expanded` Widget nutzen, um den `Container` auf die
gesamte verfügbare Seite zu strecken, dann erhalten wir folgenden Screen:

<img width="350" height="550" src="/artikel/20220525-incorrect-use-of-parentdatawideget/images/error_screen.png">

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
      body: Expanded(
        child: Container(color: Colors.green),
      ),
    );
  }
}
{{</highlight>}}

Die Fehlermeldung wird durch das `Expanded` Widget verursacht. Der Grund hierfür ist, dass ein 
`Expanded` Widget so designed ist, dass dieser nur in `MultiChildRenderObjectWidget` wie `Column`,
`Flex` oder `Row` eingesetzt werden kann. In diesem Beispiel wird jedoch das `Expanded` Widget im
`body` des `Scaffold` Widgets eingesetzt.

---

### 3. Lösung der Fehlermeldung <a name="third"></a>
Wie im vorherigen Abschnitt bereits beschrieben, kann das `Expanded` Widget nur in 
`MultiChildRenderObjectWidget` Widgets eingebettet werden. In unserem Beispiel möchten wir, jedoch 
das `Container` Widget in einem `Scaffold` Widget gestreckt anzeigen. Das `Scaffold` Widget ist ein
`SingleChildRenderObjectWidget`. Um ein anderes Widget in einem `SingleChildRenderObjectWidget` Widget
zu strecken, muss das `SizedBox.expand` Widget verwendet werden. Wenn wir das `SizedBox.expand` 
statt `Expanded` einsetzen erhalten wir folgendes Ergebnis:\

<img width="350" height="550" src="/artikel/20220525-incorrect-use-of-parentdatawideget/images/expanded_green_screen.png">

Der vollständige Code mit `SizedBox.expand`, der die `Incorrect use of ParentDataWidget` löst:

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
      body: SizedBox.expand(
        child: Container(color: Colors.green),
      ),
    );
  }
}
{{</highlight>}}

---

### 4. Wie geht es weiter? <a name="fourth"/>
Schon einmal auf die Fehlermeldung `BoxConstraints forces an infinite height` gestoßen? Was die Fehlermeldung
bedeutet und was zu tun ist um diese wieder los zu werden lässt sich hier herausfinden:
[Wo sind meine Widgets hin verschwunden und was bedeutet "BoxConstraints forces an infinite height"?]
(https://flutter.de/artikel/wo-sind-meine-widgets-hin-verschwunden-und-was-bedeutet-boxconstraints-forces-an-infinite-height.html)