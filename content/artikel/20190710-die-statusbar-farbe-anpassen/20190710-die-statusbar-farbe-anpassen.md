---
title: "Die Statusbar Farbe ändern"
slug: "flutter-statusbar-farbe-ändern"
date: 2019-07-10T09:29:00+02:00
dateOfUpdate: 2021-06-08T08:38:00+02:00
draft: false
header_image: "/artikel/20190710-die-statusbar-farbe-anpassen/images/farbe_anpassen.jpg"
images: ["artikel/20190710-die-statusbar-farbe-anpassen/images/farbe_anpassen.jpg"]
description: "Die Farbe der Statusbar in Flutter anpassen."
tags: ["byte-size", "ui/ux", "statusbar"]
categories: Anfänger * getting started * design
authors: ["tobias-mautes"]
link: 20190704-die-statusbar-farbe-anpassen/20190704-die-statusbar-farbe-anpassen.md
---
Die Farbe der Statusbar zu ändern sollte eigentlich so einfach sein. Aber jedes mal wenn ich dies, egal ob im native Code mit Java und Objective C oder mit Hybrid-Frameworks wie Nativescript oder React Native, versuche, klappt es nicht auf Anhieb wie gewünscht. Leider bildet auch Flutter hier keine Ausnahme. :( Erst nach längerem Googlen bin ich auf folgende Lösungen gestoßen:

{{< highlight dart >}}
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.pink, // Farbe der Statusbar
    systemNavigationBarColor: Colors.blue,// Farbe der Navigation-Bar
));
{{< /highlight >}}

Leider wirkt auch diese Lösung wieder einmal relativ kompliziert. Glücklicherweise gibt es bereits ein pub-Module, das das Ganze extrem einfach macht:
https://pub.dev/packages/flutter_statusbarcolor_ns

{{< highlight dart >}}
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
await FlutterStatusbarcolor.setStatusBarColor(Colors.pink);
await FlutterStatusbarcolor.setNavigationBarColor(Colors.orange);
{{< /highlight >}}

{{< figure src="/artikel/20190710-die-statusbar-farbe-anpassen/images/statusbar-color-change.png" height="250"  >}}
{{< figure src="/artikel/20190710-die-statusbar-farbe-anpassen/images/navigationbar-color-change.png" height="250"  >}}

Dazu kannst du dir auch sagen lassen, ob das dark oder light theme für die statusbar leserlicher wäre, indem du dieser Funktion die Farbe deiner Statusbar übergibst.

{{< highlight dart >}}
useWhiteForeground(Colors.white);
{{< /highlight >}}

Die Funktion returnt true, wenn die Statusbar weiße Icons verwenden soll. Dies kannst du auch gleich mit der Funktion kombinieren, um den Stil der Statusbar zu ändern.

{{< highlight dart >}}
await FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(Colors.white));
{{< /highlight >}}

Hier sieht man den Unterschied:

{{< figure src="/artikel/20190710-die-statusbar-farbe-anpassen/images/statusbar-foreground-change.png" height="100" >}}

Ein Beispielprojekt zum Thema findet ihr hier:

https://github.com/coodoo-io/flutter-statusbar

Toll, was die Flutter-Community so alles schon gezaubert hat! Schade nur, dass dieses Widget nicht Teil des Core-Widget Systems ist.