---
title: "Hero-Widget in Flutter"
slug: "hero-widget-flutter" 
date: 2019-08-01T11:30:14+02:00
draft: true
header_image: "/artikel/20190801-hero-widget/images/hero-widget.jpeg"
images: ["/artikel/20190801-hero-widget/images/hero-widget.jpeg"]
description: "Hero-Widgets in Flutter richtig verwenden"
tags: ["material", "ux", "hero-widget"]
categories: Anfänger * Widget * Hero
authors: ["simon-stevens"]
link: 20190801-hero-widget/20190801-hero-widget.md
---

# Das Hero Widget in Flutter

Wenn wir eine App entwickeln, haben wir im Idealfall ein einheitliches Appdesign. Dazu zählt natürlich auch die Verwendung von einheitlichen Symbolen und Bildern. Will man jetzt eine besondere Userexperience kreieren, oder die Aufmerksamkeit des Nutzers auf etwas Bestimmtes richten, kann sich der Einsatz von animierten Widgets beim Wechsel von Seiten lohnen. Und genau das macht das <a href="https://api.flutter.dev/flutter/widgets/Hero-class.html" target="_blank" rel="noopener">Hero Widget</a>.

Das Hero Widget lässt sich super einfach verwenden. Man muss es einfach um das zu animierende Objekt herum packen, das heißt unser Objekt wird zum `child` des Heros. Das Objekt muss auf beiden Seiten in einem Hero eingepackt sein, außerdem ist es ganz wichtig auf beiden Seiten dem Hero den gleichen `tag` zu geben, damit die App weiß, welche zwei Objekte zusammen gehören. Woraus sich wiederum schließen lässt, dass wir beliebig viele Hero Widgets auf einer Seite haben können, die auf die gleiche oder unterschiedliche Seiten animiert werden.

{{< highlight dart >}}
Hero(
  tag: "DemoTag",
  child: Icon(
    Icons.thumb_up,
    size: 200.0,
    color: Colors.blue,
  ),
),
{{< /highlight >}}

<br>

### Das erste Hero Widget 

In diesem Artikel lasse ich einen Floating Action Button auf die nächste Seite fliegen. (Einen coolen Artikel wie man einen Floating Action Button erstellen und gestalten kann, findest du <a href="https://flutter.de/artikel/floating-action-button-flutter.html" target="_blank" rel="noopener">hier</a>.) Besonders hierbei ist, dass der Floating Action Button selbst schon ein Hero Widget ist. Das heißt, er muss nicht in einem Hero eingepackt sein, sondern kann direkt den `heroTag` als Parameter nehmen.<br>
Hier einmal der Code dazu,  die `transitionDuration` habe ich hochgesetzt, damit man die Animation besser sieht. 

{{< highlight dart >}}
class firstPage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "DemoTag",
          tooltip: 'like',
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (_, __, ___) => secondPage(),
              ),
            );
          },
          child: Icon(Icons.thumb_up),
        ),
      );
    }
  }

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Widget - second page'),
      ),
      body: Center(
        child: Hero(
          tag: "DemoTag",
          child: Icon(
            Icons.thumb_up,
            size: 200.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
{{< /highlight >}}
{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-1.gif" width="300" >}}

### Einen Placeholder hinzufügen

Jetzt da unser Widget von einem Ort zum anderen fliegt, haben wir erstmal eine Freifläche. Diese können wir mit einem `placeholderBuilder` als Parameter des Heros füllen. Der `placeholderBuilder` erwartet als Rückgabewert einen Container, den wir gestalten können, wie wir wollen. In unserem Beispiel geben wir ihm als `child` einen `CircularProgressIndicator` (Hier wäre auch jedes andere Widget denkbar). Wichtig ist hierbei, dass der Container größer oder mindestens gleich groß wie das Hero Widget ist, sonst springt es am Ende.

{{< highlight dart >}}
Hero(
  tag: "DemoTag",
  child: Icon(
    Icons.thumb_up,
    size: 200.0,
    color: Colors.blue,
  ),
  placeholderBuilder: (context, size, widget) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: CircularProgressIndicator(),
    );
  },
), 
{{< /highlight >}}

{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-2.gif" width="300" >}}

### Das Hero Widget verändern

Mit Flutter haben wir die Möglichkeit das Widget, dass von der einen Seite auf die andere fliegt, mit einem anderen zu ersetzen. Also können wir statt des Daumens nach oben auch ein Herz fliegen lassen.<br>
Dazu verwenden wir den `flightShuttleBuilder` Parameter. Auch dieser erwartet ein Widget. In unserem Fall ein `Icon`.

{{< highlight dart >}}
Hero(
  tag: "DemoTag",
  child: Icon(
    Icons.thumb_up,
    size: 200.0,
    color: Colors.blue,
  ),
  flightShuttleBuilder: (flightContext, animation, direction,
    fromContext, toContext) {
      return Icon(Icons.favorite, size: 150.0, color: Colors.blue);
    },
  placeholderBuilder: (context, size, widget) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: CircularProgressIndicator(),
    );
  },
),
{{< /highlight >}}

{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-3.gif" width="300" >}}

Aktuell hat unser Herz immer eine Größe von 150.0 in beide Richtungen.
Da der `flightShuttleBuilder` unter anderem auch einen `direction` Parameter hat, können wir diesen nutzen, um genau das anzupassen.

{{< highlight dart >}}
flightShuttleBuilder: (flightContext, animation, direction,
  fromContext, toContext) {
    if(direction == HeroFlightDirection.push) {
    return Icon(
      Icons.favorite,
      size: 150.0,
      color: Colors.blue,
    );
  } else if (direction == HeroFlightDirection.pop){
    return Icon(
      Icons.favorite,
      size: 70.0,
      color: Colors.blue,
    );
  }
},
{{< /highlight >}}

Durch diese if-Abfrage können wir, je nach Richtung, die Größe individuell einstellen. (Theoretisch könnten wir hier sogar das Widget selbst ändern für die jeweilige Richtung.)
{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-4.gif" width="300" >}}

Jetzt haben wir also die Möglichkeit Dinge von einer Seite auf die nächste fliegen zu lassen.
Das Projekt dazu findest du <a href="https://github.com/coodoo-io/flutter-hero-widget" target="_blank" rel="noopener">hier</a> auf Github.



  

 