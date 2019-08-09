---
title: "Stack Element in Flutter"
slug: "elemente-in-flutter-stapeln-mit-stack-element" 
date: 2019-08-08T07:55:24+02:00
draft: false
description: "Wie man durch das Stapeln von Elementen komplexe UI in Flutter darstellen kann"
tags: ["beginner"]
categories: Beginner * UI * Stack Element
authors: ["Tobias Mautes"]
header_image: "/artikel/20190808-stack-element/images/stack-element.png"
images: ["/artikel/20190808-stack-element/images/stack-element.png"]
link: 20190808-stack-element/20190808-stack-element.md
---

<div class="links">Wolltest du schon einmal mehrere Elemente kombinieren, um kompliziertere Elemente, wie einen Profilheader zu bauen? Dann ist <a href="https://api.flutter.dev/flutter/widgets/Stack-class.html" target="_blank" rel="noopener">Stack Element</a> für alle, die Flutter lernen, das Widget ihrer Wahl. Flutter hat den großen Vorteil zu anderen Frameworks wie NativeScript, dass es sehr viel schneller und unkomplizierter ist, Elemente in einer App zu stapeln.</div>


### Was ist ein Stack Element?

In einem Stack Element kannst du so viele Elemente, wie du willst stapeln oder überlappen. Dies hilft dir dabei komplexere Widgets in deiner App darzustellen, wenn du deren Aussehen oder Funktionalität übernehmen willst, ohne andere Widgets nachbauen zu müssen. So kann das zum Beispiel aussehen:

{{< figure src="/artikel/20190808-stack-element/images/profile-example.png" width="300" >}}

{{< figure src="/artikel/20190808-stack-element/images/card-example.png" width="300" >}}

### Wie funktioniert es?

Ein `Stack` Element hat ein `children: <Widget> []` Attribut, dem du so viele Widgets wie du willst geben kannst. Diese überlagern sich gegenseitig, je nachdem an welcher Stelle die Widgets stehen.

{{< highlight dart >}}
Stack(
  children: <Widget>[
    UnteresWidget(),
    MittleresWidget(),
    OberesWidget(),
  ],
),
{{< /highlight >}}

Die Reihenfolge der verwendeten Flutter Widgets, die gestackt werden sollen, ist wichtig, denn das erste angegebene Widget liegt visuell auf der untersten Ebene, wie in der folgenden Grafik zu sehen ist:

{{< figure src="/artikel/20190808-stack-element/images/layers.png" width="300" >}}

Ein `Stack` Element ist immer so groß wie das größte Widget im Stack und nach oben links ausgerichtet, wenn keine weiteren Angaben gemacht werden.

Ein gutes Beispiel dafür:

{{< highlight dart >}}
Stack(
  children: <Widget>[
    Container(
      color: Color(0xff619ff9),
    ),
    Container(
      color: Colors.white24,
      height: 300.0,
      width: 300.0,
    ),
    Container(
      color: Colors.white24,
      height: 150.0,
      width: 150.0,
    )
  ],
),
{{< /highlight >}}

{{< figure src="/artikel/20190808-stack-element/images/stack-example.png" width="300" >}}

Wie man hier sehen kann, berücksichtigt das `Stack` Element sogar Transparenz, da `Colors.white24` ein von Flutter vorgegebenes Weiß mit 12% Transparenz ist.

### Ausrichtung

Wie schon erwähnt und im oberen Beispiel zu sehen ist, werden <b>alle</b> Elemente standardmäßig oben links ausgerichtet. Diese Richtung kannst du über das  `alignment` Attribut konfigurieren:

{{< highlight dart >}}
Stack(
  alignment: Alignment.bottomCenter,
  children: <Widget>[],
),
{{< /highlight >}}

Wenn du aber nur gewisse Elemente anders ausrichten oder verschiedene Ausrichtungen nutzen möchtest, kannst du hier das `Align` Widget nutzen, welches nur innerhalb von `Stack`s verwendet werden kann:

{{< highlight dart >}}
Stack(
  children: <Widget>[
    Container(
      color: Color(0xff619ff9),
    ),
    Container(
      color: Colors.white24,
      height: 300.0,
      width: 300.0,
    ),
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.white24,
        height: 150.0,
        width: 150.0,
      ),
    ),
  ],
),
{{< /highlight >}}

{{< figure src="/artikel/20190808-stack-element/images/alignment-example.png" width="300" >}}

Hier kannst du auch wieder sehen, wie gut sich Transparenz mit `Stack` Elementen kombinieren lässt.

### Positionierung

Ähnlich wie das `Align` Element gibt es ein `Positioned` Element, mit dem du die Elemente innerhalb eines Stacks genau so positionieren kannst, wie du willst. Es hat die Attribute `top`, `left`, `right` und `bottom`. Diese geben an wie weit das Element von besagter Seite entfernt ist.

So kannst du also, durch das Angeben von zwei der Attribute, ein Element sehr genau platzieren:

{{< highlight dart >}}
Positioned(
  top: 50.0,
  left: 200.0,
  height: 150.0,
  width: 150.0,
  child: Container(
    color: Colors.white24,
  ),
),
{{< /highlight >}}

{{< figure src="/artikel/20190808-stack-element/images/positioned-example.png" width="300" >}}

Wie du im Beispiel sehen kannst, kommt das `Positioned` Element mit `width` und `height` Attributen. Diese kannst du setzen, um die Größe des `child` Elements zu bestimmen, sollte dieses nicht von sich aus Größen bestimmende Attribute haben.

### Indexed Stack?

Das `Stack` Element hat auch noch einen Bruder und zwar den `IndexedStack`. Ein `Indexedstack` ist wie ein normaler `Stack`, allerdings zeigt er immer nur ein Element an, das anhand eines Indexes gesteuert wird. Dieser Index ist ganz einfach das `index` Attribut, mit dem die angezeigte Schicht zur Laufzeit auch geändert werden kann. Dies kann insbesondere bei Animationen in Flutter sehr hilfreich sein.

Um das Ganze zu verdeutlichen hier ein kleines Beispiel eines normalen Stacks:

{{< highlight dart >}}
Stack(
  alignment: Alignment.center,
  children: <Widget>[
    Container(
      color: Color(0xff619ff9),
    ),
    Container(
      height: 300.0,
      width: 300.0,
      color: Color(0xFF61c9f9),
    ),
    Container(
      height: 150.0,
      width: 150.0,
      color: Color(0xFF61def9),
    ),
  ],
),
{{< /highlight >}}

{{< figure src="/artikel/20190808-stack-element/images/indexed-stack-example.png" width="300" >}}

Nun können wir das Ganze zu einem `IndexedStack` machen und dem `FloatingActionButton` eine Funktion geben, die dem `index` Attribut des  `IndexedStack` eine neue zufällige Nummer zuweist:

{{< highlight dart >}}
import 'dart:math';

import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  IndexedStackPage({Key key}) : super(key: key);

  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  int stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indexed Stack Beispiel'),
      ),
      body: IndexedStack(
        index: stackIndex,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Color(0xff619ff9),
          ),
          Container(
            height: 300.0,
            width: 300.0,
            color: Color(0xFF61c9f9),
          ),
          Container(
            height: 150.0,
            width: 150.0,
            color: Color(0xFF61def9),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          stackIndex = generateNewRandomIndex(stackIndex);
        }),
        tooltip: 'Shuffle elements',
        child: Icon(Icons.shuffle),
      ),
    );
  }

  int generateNewRandomIndex(int index) {
    int oldInt = index;
    int newInt;

    do {
      newInt = new Random().nextInt(3);
    } while (newInt == oldInt);

    return newInt;
  }
}
{{< /highlight >}}

Und Ta-Da! Wie man sieht, kann man den `FloatingActionButton` drücken und es wird immer eine andere der drei Schichten angezeigt:

{{< figure src="/artikel/20190808-stack-element/images/indexed-stack-example-2.png" width="300" >}}

### Fazit

Und so einfach ist es, mit diesen zwei Flutter Widgets komplexe Widgets zu erstellen, ohne alles selbst designen zu müssen. 

Der ganze Code und die Beispiele sind in unserem GitHub [hier](https://github.com/coodoo-io/flutter-stack) zu finden. Einfach auschecken, ausprobieren und ganz einfach nachbauen.