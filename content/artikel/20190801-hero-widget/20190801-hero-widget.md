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

Wenn wir eine App entwickeln, haben wir im Idealfall ein einheitliches Appdesign. Dazu zählt natürlich auch die verwendung von einheitlichen Symbolen oder Bildern. Will man jetzt eine besondere Userexperience kreieren, oder die Aufmerksamkeit des Nutzers auf etwas bestimmtes richten, kann sich der einsatz von animierten Widgets beim Seitenwechsel lohnen. Und genau das macht das Hero Widget.
Das Hero Widget lässt sich super einfach verwenden. Man muss es einfach um das zu animierende Objekt herum packen, also wird unser Objekt zum `child` des Heros. Das Objekt muss auf beiden Seiten in einem Hero eingepackt ist, außerdem ist es ganz wichtig auf beiden Seiten dem Hero den gleichen `tag` zu geben, damit die App weiß, welche zwei Objekte zusammen gehören. Was wiederum auch heißt, dass wir beliebig viele Hero Widgets auf einer Seite haben können.

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

In diesem Artikel lasse ich einen Floating Action Button auf die nächste Seite fliegen. Besonders hierbei ist, dass der Floating Actions Button selbst schon ein Hero Widget ist, das heißt er muss nicht in einem Hero eingepackt sein, sondern kann direkt den `heroTag` als Parameter nehmen.<br>
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
        onPressed: (){
          Navigator.push(
            context,
            PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (_, __, ___) => secondPage(
          )));},
        child: Icon(Icons.thumb_up)),
    );
  }
}

class secondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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

Jetzt wo unser Widget von einem Ort zum anderen fliegt, haben wir erstmal eine Freifläche. Diese können wir mit einem `placeholderBuilder` als Parameter des Heros füllen. Der `placeholderBuilder` erwartet als Rückgabewert einen Container, den wir gestalten können wie wir wollen. In unserem Beispiel geben wir ihm als `child` einen `CircularProgressIndicator` (Hier wäre auch jedes andere Widget denkbar). Wichtig ist hierbei, dass der Container die selbe Größe hat wie das Hero Widget, sonst springt es am Ende.

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
{{< /highlight >}}

{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-2.gif" width="300" >}}

### Das Hero Widget verändern

Mit Flutter haben wir die Möglichkeit das Widget, welches von der einen Seite auf die andere fliegt, mit einem anderen zu ersetzen. Also können wir statt dem Daumen nach oben auch ein Herz verwenden.<br>
Dazu verwenden wir den `flightShuttleBuilder` Parameter. Auch dieser erwartet ein Widget, in unserem Fall ein `Icon`.

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
Da der `flightShuttleBuilder` unter anderem auch ein `direction` Parameter hat, können wir diesen nutzen, um genau das anzupassen.

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

Durch diese if-Abfrage können wir je nach Richtung die Größe individuell einstellen. (Theoretisch könnten wir hier sogar das Widget selbst ändern vor die jeweilige Richtung.)
{{< figure src="/artikel/20190801-hero-widget/images/heroWidget-4.gif" width="300" >}}



  

 