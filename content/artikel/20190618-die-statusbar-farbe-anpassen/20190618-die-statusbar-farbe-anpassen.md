---
title: "Die Statusbar Farbe ändern"
slug: "flutter-statusbar-farbe-ändern"
date: 2019-06-18T22:29:00+02:00
draft: false
header_image: "artikel/20190618-die-statusbar-farbe-anpassen/images/farbe_anpassen.jpg"
description: "Wie kann ich die Statusbar Farbe in Flutter anpassen?"
tags: ["byte-size", "ui/ux", "statusbar"]
categories: []
author: Jan Marsh
---

Jedes mal, egal ob im native Code mit Java und Objective C oder mit Hybrid-Frameworks wie Nativescript oder React Native, probier ich die Statusbar Farbe zu ändern und es klappt nicht auf Anhieb wie gewünscht. Leider bildet auch Flutter hier keine Ausnahme. :( Erst nach längerem Googlen bin ich auf folgende Lösungen gestoßen:

{{< highlight dart >}}
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.pink, // Farbe der Statusbar
    systemNavigationBarColor: Colors.blue,// Farbe der Navigation-Bar
));
{{< /highlight >}}

Leider wirkt auch diese Lösung wieder einmal relativ kompliziert. Glücklicherweise gibt es aber bereits ein pub-Module, dass das Ganze extrem einfach aussehen lässt:
https://pub.dev/packages/flutter_statusbarcolor

{{< highlight dart >}}
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
await FlutterStatusbarcolor.setStatusBarColor(Colors.green);
await FlutterStatusbarcolor.setNavigationBarColor(Colors.orange);
{{< /highlight >}}

Dazu kannst du dir auch sagen lassen ob das dark oder light theme für die statusbar leserlicher wäre indem du dieser Funktion die Farbe deiner Statusbar übergibst.

{{< highlight dart >}}
useWhiteForeground(Colors.white);
{{< /highlight >}}

Die Funktion returnt true wenn die Statusbar weiße Icons verwenden soll, was du auch gleich mit der Funktion um den Stil der Statusbar zu ändern kombinieren kannst.

{{< highlight dart >}}
await FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(Colors.white));
{{< /highlight >}}

Hier sieht man den Unterschied:

{{< figure src="images/difference.png" height="26" width="730" >}}

Ein Beispielprojekt zu dem ganzen Thema lässt sich außerdem nochmal hier finden:

https://github.com/coodoo-io

Toll was die Flutter-Community so alles schon gezaubert hat! Schade nur, das dieses Widget nicht teil des Core-Widget Systems ist.