---
title: "AlertDialog in Flutter"
slug: "alert-dialog-flutter" 
date: 2019-07-23T13:45:30+02:00
draft: true
header_image: "/artikel/20190723-alertDialog/images/alertDialog.jpg"
images: ["/artikel/20190723-alertDialog/images/alertDialog.jpg"]
description: "AlertDialogs in Flutter richtig verwenden"
tags: ["flutter","alertDialog","Dialog"]
categories: Anfänger * Widgets * Dialoge
authors: ["simon-stevens"]
link: 20190723-alertDialog/220190723-alertDialog.md
---

## Achtung

Du stehst kurz davor etwas unwiederrufliches zu tun! Bist du dir sicher, dass du das wirklich löschen willst? Hast du dir das gut überlegt?

Wäre ich eine App würde ich dich jetzt zubombadieren mit **AlertDialogs**.

Bin ich aber nicht, also zeige ich dir, wie du dir deine eigenen AlertDialogs in einer Flutter-App einbauen kannst.


### Was sind AlertDialogs?

Zunächst einmal müssen wir ein paar Sachen definieren. Ein AlertDialog ist eine Unterklasse von Dialog. <br>
Dialog hat die Unterklassen SimpleDialog und AlertDialog.

Hier ist ein SimpleDialog. In einem SimpleDialog hat man meist verschiedene Optionen in Form einer Auswahl zur Verfügung.<br>
{{< figure src="/artikel/20190723-alertDialog/images/simpleDialogExample.png" height="230" >}}

Hier im gegensatz dazu ein AlertDialog. Dieser braucht eine Bestätigung, dass eine bestimmte Aktion durchgeführt werden soll, oder eben nicht.<br>
{{< figure src="/artikel/20190723-alertDialog/images/alertDialogExample.png" height="180" >}}

In diesem Artikel gehen wir genauer auf AlertDialogs ein.<br>
Um ein AlertDialog aufzurufen, müssen wir zunächst die `showDialog()`Methode aufrufen. <br>
Diese benötigt zum einen den context und zum anderen einen itemBuilder, der als Rückgabewert einen Typ von Dialog zurückgibt. In unserem Falle einen AlertDialog.


{{< highlight dart >}}
 void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
      },);
  }
{{< /highlight >}}

Dieses Beispiel zeigt uns erstmal nichts, da wir den Dialog noch nicht gefüllt haben.
Wir müssen dem Dialog also mindestens einen `title` geben.<br>

{{< highlight dart >}}
 void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alert!'),
      },);
  }
{{< /highlight >}}
{{< figure src="/artikel/20190723-alertDialog/images/emptyAlertDialog.gif" height="600">}}

### Bestandteile von AlertDialogs

Damit der Dialog schön aussieht und dem Nutzer auch etwas bringt, sollten wir ihn allerdings mit mehr Atributen füllen, als nur einem Titel.
Über den `content` Parameter können wir den Nutzer besser darüber informieren, was tatsächlich gerade passiert. 
Der `actions` Parameter erwartet eine Liste von Widgets, also theoretisch so viele wie du Lust hast. Allerdings sollte sich, im Sinne der Benutzerfreundlichkeit, auf maximal zwei Buttons beschränken.

{{< highlight dart >}}
return AlertDialog(
          title: Text('Alert!'),
          content: Text('Bitte Aktion bestätigen.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Abbrechen'),
              onPressed: (){
                // Hier passiert etwas
                Navigator.of(context).pop();
              }),
            FlatButton(
              child: Text('Bestätigen'),
              onPressed: (){
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
              },)],);
{{< /highlight >}}
{{< figure src="/artikel/20190723-alertDialog/images/alertDialogFilled.png" height="600" >}}

### Where's the beauty?

So der AlertDialog ist zu sehen und die Funktionalität ist gegeben. Aber geht da noch mehr?<br>
Ganz kurz..  Klar!

Natürlich können wir bei jedem Text auch den `style` nach belieben verändern. Außerdem können wir über den Parameter `elevation` bestimmen wie stark der Dialog hervorgehoben sein soll und wie viel Schatten er werfen soll.
Natürlich dürfen bei einer schönen Dialogbox auch keine scharfen Ecken ein. Auch eine Dialogbox darf Kurven haben über `shape`.

{{< highlight dart >}}
return AlertDialog(
          title: Text('Alert!', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
            fontStyle: FontStyle.italic, color: Colors.green[900])),
          content: Text('Bitte Aktion bestätigen.', style: TextStyle(color: Colors.purple),),
          actions: <Widget>[
            FlatButton(
              child: Text('Abbrechen'),
              onPressed: (){
                _counterZero();
                Navigator.of(context).pop();
              }),
            OutlineButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.orange[800], width: 2.0),
              child: Text('Bestätigen'),
              onPressed: (){
                Navigator.of(context).pop();
              },)
          ],
          elevation: 0.0, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),)
          );
{{< /highlight >}}

{{< figure src="/artikel/20190723-alertDialog/images/alertDialogBeauty.png" height="600" >}}

<br><br><br><br>
Hier findest du eine Beispielanwendung mit einem AlertDialog: