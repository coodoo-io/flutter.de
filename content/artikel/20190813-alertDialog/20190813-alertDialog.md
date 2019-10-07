---
title: "AlertDialog in Flutter erstellen"
slug: "alert-dialog-flutter" 
date: 2019-08-13T07:45:30+02:00
draft: false
header_image: "/artikel/20190813-alertDialog/images/alertDialog.png"
images: ["/artikel/20190813-alertDialog/images/alertDialog.png"]
description: "Flutter auf deutsch: Wie du AlertDialogs in Flutter erstellen und gestalten kannst."
tags: ["flutter","alertDialog","Dialog"]
categories: Anfänger * Widgets * Dialog
authors: ["simon-stevens"]
link: 20190813-alertDialog/20190813-alertDialog.md
---

## Achtung!!!

Du stehst kurz davor etwas Unwiderrufliches zu tun! Bist du dir sicher, dass du das wirklich löschen willst? Hast du dir das gut überlegt?

Wäre ich eine App würde ich dich jetzt mit **AlertDialogs** bombardieren.

Bin ich aber nicht. Also wenn du Flutter lernen möchtest, zeige ich dir, wie du AlertDialogs in einer Flutter-App einbauen kannst.


### Was sind AlertDialogs?

Zunächst einmal müssen wir ein paar Sachen definieren. Ein `AlertDialog` ist eine Unterklasse von  <a href="https://api.flutter.dev/flutter/material/Dialog-class.html" target="_blank" rel="noopener">`Dialog`</a>. 
`Dialog` hat die Unterklassen <a href="https://api.flutter.dev/flutter/material/SimpleDialog-class.html" target="_blank" rel="noopener">`SimpleDialog`</a> und <a href="https://api.flutter.dev/flutter/material/AlertDialog-class.html" target="_blank" rel="noopener">`AlertDialog`.</a>

In einem `SimpleDialog` hat man meist verschiedene Optionen in Form einer Auswahl zur Verfügung.<br>

{{< figure src="/artikel/20190813-alertDialog/images/simpleDialogExample.png" width="300" >}}

Im Gegensatz dazu steht ein `AlertDialog`. Dieser braucht eine Bestätigung, dass eine bestimmte Aktion durchgeführt werden soll, oder nicht.<br>

{{< figure src="/artikel/20190813-alertDialog/images/alertDialogExample.png" width="300" >}}

In diesem Artikel gehen wir genauer auf AlertDialogs ein.<br>
Um einen AlertDialog aufzurufen, müssen wir zunächst die `showDialog()`Methode aufrufen. <br>
Diese benötigt zum einen den `context` und zum anderen einen `itemBuilder`, der als Rückgabewert einen Typ von `Dialog` zurückgibt. In unserem Fall einen `AlertDialog`.


{{< highlight dart >}}
 void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog()
      },
    );
  }
{{< /highlight >}}

Dieses Beispiel zeigt uns erstmal nichts, da wir den Dialog noch nicht gefüllt haben.
Wir müssen dem Dialog also mindestens einen `title` geben, um einen visuellen Dialog zu sehen.<br>

{{< highlight dart >}}
 void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alert!'),
        ),
      },
    );
  }
{{< /highlight >}}

Diese Animation zeigt nochmal das Aufrufen des leeren Dialogs und einmal den Dialog mit `title`. 
{{< figure src="/artikel/20190813-alertDialog/images/emptyAlertDialog.gif" width="300">}}

### Bestandteile von AlertDialogs

Damit der Dialog schön aussieht und dem Nutzer auch etwas bringt, sollten wir ihn mit mehr Attributen füllen und den Nutzer nicht mit dem Titel allein lassen.

Über den `content` Parameter können wir den Nutzer darüber informieren, was tatsächlich gerade passiert. 
Der `actions` Parameter erwartet eine Liste von beliebig vielen Widgets. Allerdings sollte man sich, im Sinne der Benutzerfreundlichkeit, auf maximal zwei Buttons beschränken.
Welche properties der Konstruktor des AlertDialogs noch aufnimmt, könnt ihr <a href="https://api.flutter.dev/flutter/material/AlertDialog-class.html" target="_blank" rel="noopener">hier</a> nachlesen.

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
              }
            ),
            FlatButton(
              child: Text('Bestätigen'),
              onPressed: (){
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
              },
            ),
          ],
        );
{{< /highlight >}}
{{< figure src="/artikel/20190813-alertDialog/images/alertDialogFilled.png" width="300" >}}

### Where's the beauty? alertDialog stylen

Nun ist der AlertDialog zu sehen und die Funktionalität ist gegeben. Aber geht da noch mehr?<br>
Klar!

Natürlich können wir bei jedem Text auch den `style` nach Belieben verändern. Außerdem können wir über den Parameter `elevation` bestimmen, wie stark der Dialog hervorgehoben wird und wie viel Schatten er werfen soll.
Natürlich dürfen bei einer schönen Dialogbox auch keine scharfen Ecken rein. Mit `shape` bekommt auch eine Dialogbox schöne Kurven.

{{< highlight dart >}}
return AlertDialog(
          title: Text('Alert!', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
            fontStyle: FontStyle.italic, color: Colors.green[900])),
          content: Text('Bitte Aktion bestätigen.', style: TextStyle(color: Colors.purple),),
          backgroundColor: Colors.yellow,
          actions: <Widget>[
            FlatButton(
              child: Text('Abbrechen'),
              color: Colors.blue[100],
              onPressed: (){
                _counterZero();
                Navigator.of(context).pop();
              },
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.orange[800], width: 2.0),
              child: Text('Bestätigen'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 0.0, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
          ),
        );
{{< /highlight >}}

{{< figure src="/artikel/20190813-alertDialog/images/alertDialogBeauty.png" width="300" >}}

Okay zugegeben, wirklich schön ist er nicht, aber er zeigt was so alles möglich ist. :smile:

Du findest dieses Projekt auch <a href="https://github.com/coodoo-io/flutter-alert-dialog" target="_blank" rel="noopener">hier</a> auf Github.