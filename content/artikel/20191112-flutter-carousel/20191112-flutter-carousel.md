---
title: "Wie Flutteraner Karussell fahren"
slug: "flutter-carousel" 
date: 2019-11-12T18:12:14+02:00
draft: false
header_image: "/artikel/20191112-flutter-carousel/images/carousel-header.jpg"
images: ["/artikel/20191112-flutter-carousel/images/carousel-header.jpg"]
description: "Carousel Slider Widget in Flutter einbinden"
tags: ["flutter", "basics"]
categories: Anfänger * Flutter * UI
authors: ["simon-stevens"]
link: 20191112-carousel/20191112-carousel.md
---

Swipe, swipe, swipe.. nein, ich rede nicht von Tinder. Ich rede von einem Flutter Karussell! Jeder weiß, wie ein Karussell in einer App aussieht und Flutter macht es Entwicklern jetzt noch einfacher, ein Karussel schnell in die eigene Anwendung einzubauen. Für alle, die Flutter lernen wollen, ist dies ein nützlicher Flutter Artikel.


## Carousel Slider in Flutter - Lass uns Karussell fahren!

Um in Flutter das bekannte Carousel zu bauen, benutzen wir das <a href="https://pub.dev/packages/carousel_slider" target="_blank">Carousel Slider Package</a> von Dart.

Dazu müssen wir zunächst in der `pubspec.yaml` Datei in den Dependencies direkt unter die Flutter SDK “carousel_slider: ^1.3.0” einfügen

{{< highlight dart >}}
    dependencies:
        flutter:
            sdk: flutter
        carousel_slider: ^1.3.0
{{< /highlight >}}

Anschließend können wir im Terminal `flutter packages get` laufen lassen oder bei VS Code in der Command Palette `>Flutter: Get Packages` verwenden.
Jetzt nur noch das Package in unserer `main.dart` Datei importieren und wir können loslegen

{{< highlight dart >}}
    import 'package:flutter/material.dart';
    import 'package:carousel_slider/carousel_slider.dart';

{{< /highlight >}}

Nun können wir wie gewohnt unsere App bauen.

#### Erstellen eines Karussells

Wir gehen später im Artikel nochmal genauer drauf ein, aber da ein Carousel Widget in Flutter, bzw. der Inhalt des Carousels doch mehr als nur ein paar Zeilen sind, lohnt es sich, das Erstellen des Carousels auszulagern.
Das machen wir ganz einfach zum Beispiel vor der build Methode.

{{< highlight dart >}}
class _MyHomePageState extends State<MyHomePage> {

  final slider = CarouselSlider(height: 400, items: <Widget>[]);

  @override
  Widget build(BuildContext context){
  .
  .
  .
{{< /highlight >}}

Wie man sieht, nimmt der Parameter `items` eine Liste von Widgets. Diese könnte man nun auch nochmal auslagern, um den Code sauber zu halten. In unserem Beispiel halten wir den Fokus auf das Carousel selbst und nicht die Gestaltung des Inhalts, deswegen werden wir die Liste direkt befüllen.
Es gilt zu beachten: sowohl der `items` als auch der `height` Parameter sind @required.

{{< highlight dart>}}
  final slider = CarouselSlider(height: 400, items: <Widget>[
    Container(
        child: Container(
      color: Colors.blue,
    )),
    Container(
        child: Container(
      color: Colors.red,
    )),
    Container(
        child: Container(
      color: Colors.green,
    ))
  ]);
{{< /highlight >}}

#### Einbauen des Karussells

Da unser Carousel Slider ein Widget ist, können wir es ganz einfach einem anderen Widget als `child` geben.   
{{< highlight dart>}}
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Container(
                child: slider,
                ),
            ],
            ),
        ),
        );
    }
{{< /highlight >}}

Nun sieht unsere App wie folgt aus. Um die einzelnen Items ein bisschen voneinander visuell zu trennen habe ich noch ein padding in jeden Container gesetzt.

{{< figure src="/artikel/20191112-flutter-carousel/images/carousel_01.gif" width="300" >}}
{{< figure src="/artikel/20191112-flutter-carousel/images/carousel_02.gif" width="300" >}}

Nun können wir an die Gestaltung unseres Karussells gehen. Das CarouselSlider Widget nimmt natürlich mehr Parameter als nur `items` und `height`.
Ein paar interessante Parameter werde ich in diesem Artikel vorstellen.
Wichtig kann zum Beispiel der Boolean `enableInfiniteScroll`. Dieser ist per Default auf **true**. Es kann aber durchaus sinnvoll sein, diesen auf **false** zu setzen. Ein weiterer ist der Boolean `autoPlay`. Wird dieser auf **true** gesetzt, läuft das Karussell – welch ein Wunder – automatisch. Will man `enableInfiniteScroll` auf **false** und `autoPlay` auf **true** setzen, sollte man auf jeden Fall das autoScroll beim letzten Item abfangen, da es sonst immer wieder versucht weiterzuscrollen.


{{< figure src="/artikel/20191112-flutter-carousel/images/carousel_03.gif" width="300" >}}

Aktiviert man `autoPlay`, sollte man auf jeden Fall auch `autoPlayInterval`, `autoPlayAnimationDuration` und `autoPlayCurve` seiner Aufmerksamkeit widmen. <br>
Übrigens gibt es in der Flutter Doku einen sehr guten Überblick über <a href="https://api.flutter.dev/flutter/animation/Curves-class.html" target="_blank">Curves</a> mit Animationen.

Das CarouselSlider Widget kann noch viel mehr Parameter annehmen. Wie zum Beispiel `enlargeCenterPage`, `scrollDirection`, oder auch eine Funktion bei `onPageChanged`. Auch kann man mit dem Parameter `initialPage` angeben, welche Seite zu Anfang angezeigt werden soll, indem man einfach den jeweiligen Index mitgibt.

#### Geht da noch mehr?

Klar! Wie wär's zum Beispiel mit Funktionen. <br>
Unser Slider kommt mit vier fertigen Funktionen. 

**.nextPage(Duration duration, Curve curve)** -> Animiert zur nächsten Seite<br>
**.previousPage(Duration duration, Curve curve)** -> Animiert zur vorherigen Seite<br>
**.jumpToPage(int page)** -> Springt zur gewählten Seite (Achtung Index, also 0,..,n)<br> 
**.animateToPage(int page, Duration duration, Curve curve)** -> Animiert zur gewählten Seite <br>


{{< figure src="/artikel/20191112-flutter-carousel/images/carousel_04.gif" width="300" >}}

In diesem Beispiel habe ich einen zweiten Slider erstellt. Der erste läuft über autoPlay, der zweite wird über die Buttons gesteuert. Natürlich können auch beide immer durch eine Wischbewegung gesteuert werden.

{{< highlight dart>}}
class _MyHomePageState extends State<MyHomePage> {
  final slider1 = CarouselSlider(
    height: 150,
    items: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.blue,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.red,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.green,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.yellow,
          )),
    ],
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    autoPlayAnimationDuration: Duration(seconds: 2),
    autoPlayCurve: Curves.easeInOutBack,
    enlargeCenterPage: true,
  );

  final slider2 = CarouselSlider(
    height: 150,
    items: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.blue,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.red,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.green,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.yellow,
          )),
    ],
    enlargeCenterPage: true,
    enableInfiniteScroll: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: slider1,
            ),
            Container(
              height: 100,
            ),
            Container(child: slider2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () => slider2.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear),
                    child: Text('Back')),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('1'),
                      onPressed: () => slider2.animateToPage(0,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('2'),
                      onPressed: () => slider2.animateToPage(1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('3'),
                      onPressed: () => slider2.animateToPage(2,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('4'),
                      onPressed: () => slider2.animateToPage(3,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                RaisedButton(
                    onPressed: () => slider2.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear),
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
{{< /highlight >}}

Bestimmt seht ihr jetzt, warum es sinnvoll ist, das Erstellen des Karussells auszulagern. :wink:

Ich hoffe, ihr habt jetzt einen guten Einblick bekommen und könnt nun selbst an die Erstellung eures eigenen Karussells gehen.

Schaut auch gerne mal in das Projekt auf <a href="https://github.com/coodoo-io/flutter-samples/tree/master/011-flutter-carousel" target="_blank" rel="noopener">GitHub</a> rein.