---
title: "Mit Flutter Web-Anwendungen entwickeln"
date: 2021-03-08T14:15:59+02:00
draft: false
header_image: "/artikel/20210308-flutter-webanwendung/images/1.png"
images: ["/artikel/20210308-flutter-webanwendung/images/1.png"]
authors: ["markus-kuehle"]
description: "Flutter stellt seine Lösung für Web-Entwicklung vor"
tags: ["flutter", "community", "Webentwicklung",]
categories: Anfänger * Webentwicklung* Flutter
link: 20210308-flutter-webanwendung/20210308-flutter-webanwendung.md
---
 Die Flutter Entwickler haben Anfang März in der <a href="https://www.youtube.com/watch?v=zSbsIiluixw" target="_blank">Flutter Engage Keynote</a> angekündigt, dass ab sofort Flutter Web production-ready ist. Was heißt das und wie funktioniert Flutter Web genau?
Flutter reiht sich selbst neben React und Angluar als weiteres Web-Framework ein und sieht sich dabei direkt mit in der ersten Reihe der aktuellen großen Frameworks.


 

## Wie funktioniert Flutter Web?

Flutter Web kann in mehreren Wegen ausgeliefert werden. Der wichtigste Schritt ist aber, dass Dart nicht mehr in eine Maschinensprache übersetzt wird sondern in Javascript. Dabei wird nicht alles in HTML, CSS und Javascript übersetzt sondern eine Mischung aus DOM, Canvas und WebAssembly verwendet. Kompiliert man seine Flutter Dart Anwendung für das Web sind am Ende optimierte Javascript Dateien und eine index.html zu finden. Diese können auf einen beliebigen Web-Server kopiert und die Anwendung direkt angesehen werden. In diesem Punkt unterscheidet Flutter Web sich erst einmal nicht von allen anderen Frameworks.

{{< figure src="/artikel/20210308-flutter-webanwendung/images/2.png">}}

## Flutter Web Renderer

Mit Flutter Web kann man zwischen zwei unterschiedlichen Web Renderer wählen: <br>
1. HTML Renderer<br>
2. CanvasKit Renderer

### HTML Renderer
Der HTML Renderer ist eine Kombination aus HTML Elementen, CSS und SVG Canvas Teilen. Der initiale Download um die Web-Anwendung zu starten ist hier geringer und die Anwendung wird dadurch schneller geladen.

### CanvasKitRenderer
Dieser Renderer entspricht den bisher gewohnten Renderern für Mobile und Desktop. Hier wird ausschließlich der Canvas ohne DOM und HTML Elementen verwendet. Einmal geladen verspricht es extrem schnelle Performance und pixelgenaues positionieren der UI-Elemente. Allerdings muss man dafür erst einmal 2MB herunterladen.
Vor allem der CanvasKitRenderer ist beeindruckend wie man auch sehr schön in der Flutterplasma Demo sehen kann (https://flutterplasma.dev/showroom).

{{< figure src="/artikel/20210308-flutter-webanwendung/images/3.png">}}

Mit den Kommandozeilen Parameter `--web-renderer html` und `--web-renderer canvaskit` wird entschieden welcher Renderer verwendet werden soll. Mehr dazu auch in der <a href="https://flutter.dev/docs/development/tools/web-renderers" target="_blank">Web Renderer Doku.</a> 

## Spezifische Web-Unterstützung
Im Web ist man gewohnt, dass man auf verschiedene Seite direkt mit einer URL springen. Hier unterstützt Flutter Web die schon von Single Page Apps gewohnte Hash Notation. Mehr dazu auch in der <a href="https://flutter.dev/docs/development/ui/navigation/url-strategies" target="_blank" >URL Strategie Doku.</a> 

Auch kann man innerhalb der App mit kopierbaren Links auf andere Seiten und Komponenten verweisen aber auch auf externe andere Webseiten.
Textblöcke markieren und Formular Autofill sind auch direkt verfügbar um einer gewohnten Web-Anwendung näher zu kommen.

## Flutter Web ausprobieren
Den schnellsten Eindruck erhält man indem man die Beispiele live im Browser ausprobiert. Dazu lohnt es sich als erstes die <a href="https://gallery.flutter.dev/#/" target="_blank" > offizielle Flutter Gallery</a> anzusehen. Neben den Standard-Widgets kann man hier auch einen Eindruck einer kompletten Anwendung erhalten.

{{< figure src="/artikel/20210308-flutter-webanwendung/images/4.png">}}

<br>Eine noch viel größere Auswahl an Beispielen findet man auf den <a href="https://flutter.github.io/samples/#" target="_blank" >Flutter Samples.</a>

## Wo kann oder sollte man Flutter einsetzen?
Die interessanteste Frage ist aber wo genau sich Flutter Web lohnt und wo man lieber auf die bisherigen Frameworks setzen sollte.
Flutter Web eignet sich besonders für interaktive Enterprise Anwendungen. Vor allem der Ansatz des CanvasKit lässt der Vorstellung keine Grenzen.
Ein Beispiel für so eine Anwendung wurde auf der Flutter Engage vorgestellt und kann man live auf  <a href="https://code.irobot.com" target="_blank" >code.irobot.com</a>ansehen:


{{< figure src="/artikel/20210308-flutter-webanwendung/images/5.png">}}

<br>Für Text-basierte Webseiten auf das gesamte Internet und sämtliche Verlinkungen basieren sollte man lieber noch eine ganze Weile auf die bisherigen Frameworks oder Technologien mit Standard HTML und CSS setzen. Allerdings hat man das gleiche vor 5 Jahren von AngularJS gesagt…





