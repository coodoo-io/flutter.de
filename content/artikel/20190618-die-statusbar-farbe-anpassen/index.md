---
title: "Die Statusbar Farbe ändern"
slug: "flutter-statusbar-farbe-ändern"
date: 2019-06-18T22:29:00+02:00
draft: false
description: "Wie kann ich die Statusbar Farbe in Flutter anpassen?"
tags: ["byte-size", "ui/ux", "statusbar"]
categories: []
author: Jan Marsh
---

Jedes mal, egal ob im native Code mit Java und Objective C oder mit Hybrid-Frameworks wie Nativescript oder Reactive Native probier ich die Statusbar Farbe zu ändern und es klappt nicht auf anhieb wie gewünscht. Leider ist auch Flutter hier keine Ausnahme :(. Erst nach längerem google bin ich auf folgende Lösungen gestoßen:

{{< highlight dart >}}
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.pink, // Farbe der Statusbar
    systemNavigationBarColor: Colors.blue,// Farbe der Navigation-Bar
));
{{< /highlight >}}

Leider wirkt auch diese Lösung wieder einmal relative kompliziert. Glücklicherweise gibt es aber bereits ein pub-Module dass, das ganze extrem einfach aussehen lässt:
https://pub.dev/packages/flutter_statusbar_manager

{{< highlight dart >}}
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

await FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
await FlutterStatusbarManager.setNavigationBarColor(Colors.green, animated:true);
await FlutterStatusbarManager.setColor(Colors.green, animated:true);
{{< /highlight >}}

Toll was die Flutter-Community so alles schon gezaubert hat! Schade nur, das dieses Widget nicht teil des Core-Widget Systems ist.