---
title: "Flutter Puzzle Hack Projekt mit einem Twist"
slug: "flutter-puzzle-hack-projekt" 
date: 2022-03-23T08:00:25+02:00
draft: false
header_image: "/artikel/20220324-puzzle-hack/flutter_puzzle.png"
images: ["/artikel/20220324-puzzle-hack/flutter_puzzle.png"]
description: "Wir haben beim alljährlichen Hackathon von Flutter Dev mitgemacht und unsere eigene Flutter Puzzle App umgesetzt."
tags: ["flutter", "puzzle", "flutter puzzle hack"]
categories: Flutter * Beginner * Puzzle Hack
authors: ["leon-adam"]
link: 20220324-puzzle-hack/puzzle-hack.md
---


Einmal im Jahr veranstaltet Flutter Dev einen Hackathon. Und dieses Jahr habe auch ich im Team mit <a href="https://coodoo.de" rel="noopener" target="blank">coodoo</a> mitgemacht. Beim <a href="https://flutter.dev/events/puzzle-hack">Flutter-Puzzle Hack</a>.
Wir sahen es als eine gute Herausforderung unser Wissen über Flutter zu vertiefen und Kollegen, die neu in dieser Technologie sind, Flutter näherzubringen. Zu denen gehörte ich. Ich habe zwar schonmal in Flutter Projekte ausprobiert, aber nie intensiv damit beschäftigt. So haben Fortgeschrittene wie auch Anfänger zusammen an einem Projekt gearbeitet. 

Die Aufgabe war ein Schiebepuzzle in Flutter umzusetzen. Also ein Puzzle, indem man numerierte Plättchen so lange verschiebt, bis man die richtige Reihenfolge hat und so gewinnt. 

## Flutter Puzzle Hack Idee
Unsere Idee war etwas anders. Wir wollten nicht, dass der/die Spieler*in gewinnt, sondern dass er/sie in kurzer Zeit so viele Plättchen wie möglich korrekt setzt. Für jedes korrekt platzierte Plättchen gibt es extra Zeit. Nach Ablauf der Zeit wird eine Übersicht angezeigt, mit einer Anzahl der Aktionen und den korrekt platzierten Plättchen. Die Motivation ist es, immer besser zu werden und die Anzahl der korrekt platzierten Plättchen nach jedem neuen Versuch zu erhöhen. Hier ein Video zu unserem erstellten Puzzle:

<iframe width="560" height="315" src="https://www.youtube.com/embed/bib7UHdSakE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

https://www.youtube.com/watch?v=bib7UHdSakE


## Wie wir es umgesetzt haben
Das Projekt haben wir in einer einfachen Ordnerstruktur gehalten.

<img src="/artikel/20220324-puzzle-hack/hack.png" class="img-fluid">

In Models wird ein einfaches Datenmodell von einem Plättchen dargestellt mit Werten wie Größe und Farbe.

{{<highlight dart>}}
class PuzzleItem {
 PuzzleItem(this.value, {this.color}) {
   color ??= Colors.yellow.shade900;
 }
 
 int value = 0;
 double width = 75.0;
 double height = 75.0;
 Curve? animationCurve;
 Color? color ;
}
{{</highlight>}}

Jedes PuzzleItem ist ein Teil eines zweidimensionalen Arrays und wird zur Darstellung des Puzzles benutzt. 

{{<highlight dart>}}
class _PuzzleGame extends State<PuzzleGame> with TickerProviderStateMixin {
 final List<List<PuzzleItem>> puzzleMatrix = [];
 final int listHeight = 4;
 final int listWidth = 4;
{{</highlight>}}

In Repositories ist die Verwaltung von globalen Daten wie auch Events. In Repos können Events angestoßen werden, auf die andere Widgets reagieren.

{{<highlight dart>}}
 addTime(int extraTime) {
   _controller.add({"added": true, 'time': extraTime});
 }
 
 removeTime(int removeTime) {
   _controller.add({"added": false, 'time': removeTime});
 }
 
 resetStartTime() {
   _controller.add({"added": false, "time": -1});
 }
{{</highlight>}}

 Z.B. betrifft das die Extra-Zeit die man bekommt, wenn man ein Plättchen korrekt platziert. 

{{<highlight dart>}}
 @override
 void initState() {
   super.initState();
   _restartTimer();
   PuzzleRepo().getController().listen((event) async {
     bool add = event['added'];
     int time = event['time'];
     // -1 -> restart starTtime
     if (time == -1) {
       _counter = PuzzleRepo().getStartTime();
       setState(() {
         _showAnimatedTime = false;
       });
     } else if (add) {
       _counter += time;
       setState(() {
         _showAnimatedTime = true;
       });
       await Future.delayed(const Duration(milliseconds: 3000));
       setState(() {
         _showAnimatedTime = false;
       });
     } else if (!add) {
       _counter -= time;
       setState(() {});
     }
     _restartTimer();
   });
 }
{{</highlight>}}


Die verschiedenen Screens beinhalten die Darstellung der Start-, Spiel- und Game Over-Screens. 
Im Ordner Services würden Endpunkte sein, um z.B. mit einer Datenbank zu kommunizieren, aber war für diese Anwendung nicht notwendig. 
In Templates befinden sich modulare Widgets, wie z.B. der Timer. Dieser Timer kann modular in jeden Screen eingesetzt werden.


## Was ich gelernt habe 
Was haben wir von diesem Flutter Puzzle Hack gelernt? Mit den Vorgaben und Schulungen unserer erfahrenen Entwickler im Bereich Flutter konnte ich einfach durchstarten und eine Idee umsetzen. Ich habe einfache wie auch wichtige Konzepte gelernt, wie die korrekte Ordnerstruktur, Templates und Repositories zu nutzen.
Für weitere Information schaut hier: <br>
<a href="https://github.com/coodoo-io/flutter-puzzle-hack" rel="noopener" target="blank">GitHub-Projekt</a> <br>
<a href="https://devpost.com/software/coodoo-puzzlehack#updates">Devpost</a>



 
