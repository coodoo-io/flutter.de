---
title: "Floating-Action-Button in Flutter"
slug: "floating-action-button-flutter" 
date: 2019-08-01T07:23:32+02:00
draft: false
header_image: "/artikel/20190801-floating-action-button/images/floating-action-button.png"
images: ["/artikel/20190801-floating-action-button/images/floating-action-button.png"]
description: "Flutter Artikel auf deutsch: Floating-Action-Button in Flutter anzeigen und gestalten."
tags: ["material", "ui", "floatingactionbutton"]
categories: Anfänger * UI * Widget
authors: ["simon-stevens"]
link: 20190801-floating-action-button/20190801-floating-action-button.md
---
Er ist uns allen bekannt und nicht mehr wegzudenken. Er repräsentiert die wichtigste Aktion auf einer Seite. Wer Flutter lernen möchte, sollte also wissen, wie man den Floating Action Button erstellt und was er eigentlich alles kann.

### Einfaches Erstellen eines Floating-Action-Buttons:

Der Floating-Action-Button wird in Flutter ganz einfach als `floatingActionButton` Parameter im Konstruktor des Scaffolds implementiert.
{{< highlight dart >}}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Builder(
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Button pressed $_counter times'),
              RaisedButton(
                  child: Text('Counter to Zero'), onPressed: _counterToZero),
            ],
          ),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
{{< /highlight >}}

{{< figure src="/artikel/20190801-floating-action-button/images/1-button.png" width="300" >}}



### Mach ihn bunt!

Farblich gestalten kann man beim Floating-Action-Button in Flutter sowohl den Container mit `backgroundColor`, als auch das Symbol mit `foregroundColor`.




{{< highlight dart >}}
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: Icon(Icons.add),
  foregroundColor: Colors.yellow,
  backgroundColor: Colors.red,
),
{{< /highlight>}}

{{< figure src="/artikel/20190801-floating-action-button/images/2-colour.png" width="300" >}}




### Button in der Navigationbar

Hat man in seiner App eine Navigationbar implementiert, macht es Sinn den Floating-Action-Button in der Navigationbar anzudocken, um keine unnötige Bildschirmfläche zu verschwenden. Dazu wird einfach als weiterer Parameter im Scaffold Konstruktor die `floatingActionButtonLocation` mitgegeben. Hier kann man frei experimentieren. Ersetz doch mal end- mit center- oder -docked mit -float, falls die Bildschirmfläche egal ist. Oder probier es mal mit startTop oder endTop.

{{< highlight dart >}}
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: Icon(Icons.add),
  foregroundColor: Colors.yellow,
  backgroundColor: Colors.red,
),
bottomNavigationBar: BottomAppBar(
  color: Colors.yellow,
  child: Container(height: 50.0),
),
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
{{< /highlight >}}

{{< figure src="/artikel/20190801-floating-action-button/images/3.1-docked.png" width="300" >}}  {{< figure src="/artikel/20190801-floating-action-button/images/3.2-docked.png" width="300" >}}


### Zu rund!


Wir kennen ihn alle rund, aber das heißt nicht, dass es so bleiben muss. Bring doch mal ein bisschen Veränderung und neue Formen in die Sache. Ganz einfach mit dem `shape` Parameter<br>
(Übrigens hat der Floating-Action-Button in Flutter auch einen `elevation` Parameter :wink:)


{{< highlight dart >}}
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: Icon(Icons.add),
  foregroundColor: Colors.yellow,
  backgroundColor: Colors.red,
  elevation: 0.0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
),
bottomNavigationBar: BottomAppBar(
  color: Colors.yellow,
  child: Container(height: 50.0),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

{{< /highlight >}}

{{< figure src="/artikel/20190801-floating-action-button/images/4-shape.png" width="300" >}}


### Ein Symbol? Warum kein Text?

Klar kann man auch in den normalen Floating-Action-Button einen Text integrieren, sieht nur blöd aus. Dann doch lieber einen extended Floating-Action-Button. Hier gibt es dann sowohl einen `icon` Parameter, als auch einen `label` Parameter. Jetzt passt sich der Button auch automatisch an die Länge des Textes an.


{{< highlight dart >}}
floatingActionButton: FloatingActionButton.extended(
  icon: Icon(Icons.add),
  label: Text('Press me!'),
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  foregroundColor: Colors.yellow,
  backgroundColor: Colors.red,
  elevation: 0.0,
),
bottomNavigationBar: BottomAppBar(
  color: Colors.yellow,
  child: Container(height: 50.0),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
{{< /highlight >}}

{{< figure src="/artikel/20190801-floating-action-button/images/5.1-extended.png" width="300" >}}  {{< figure src="/artikel/20190801-floating-action-button/images/5.2-extended.png" width="300" >}}

Ein Beispiel für einen schönen Floating Action Button in Flutter findet ihr hier: https://github.com/coodoo-io/flutter-floating-action-button.

  

 