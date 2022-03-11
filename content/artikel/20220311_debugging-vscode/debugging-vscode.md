---
title: "Flutter Widgets finden und untersuchen in VS Code"
slug: "flutter-widgets-untersuchen-vscode" 
date: 2022-03-10T08:00:25+02:00
draft: false
header_image: "/artikel/20220311_debugging-vscode/vscode_flutter.png"
images: ["/artikel/20220311_debugging-vscode/vscode_flutter.png"]
description: "Mit dem Widget Inspector Elemente in Flutter untersuchen und direkt in den Code springen"
tags: ["flutter", "debugging", "vscode"]
categories: Flutter * Debugging * VS Code
authors: ["Nadia-Micheilis"]
link: 20220311_debugging-vscode/debugging-vscode.md
---

Als ich mit der Entwicklung von Flutter angefangen habe, haben mir sofort die Developer Tools gefehlt, wie ich sie von Chrome her kannte. Zum Glück bietet auch VS Code ein integriertes Debugging Tool, mit dem man schnell Bugs in Flutter identifizieren und beheben kann: den Widget Inspector. Mit diesem kannst du einzelne Widgets in Flutter finden und untersuchen. Hier kommt eine kleine Anleitung, wie du den Widget Inspector in VS Code richtig nutzt.

### App starten
Damit der Widget Inspector überhaupt angezeigt wird, führe zuerst die App aus. Das geht am Einfachsten mit 'flutter run' oder auch über VS Code selbst.

<img style="width:600px" src="/artikel/20220311_debugging-vscode/debuggen.png" alt="Flutter starten in VS Code" class="img-fluid">

### Widget Inspector öffnen

Im Developer Menü siehst du nun eine blaue Lupe. Wenn du diese auswählst, öffnet sich der Widget Inspector.

<img style="width:600px" src="/artikel/20220311_debugging-vscode/konsole.png" alt="Flutter Widget Inspector" class="img-fluid">

### Ein Element untersuchen

Mit dem blauen Mauszeiger (#1) kannst du nun jedes Element in deiner App untersuchen. Wenn du also auf ein Element in der App klickst (#2), zeigt dir der Layout Explorer, um welches Element es sich handelt und wo es innerhalb der App liegt. 

<img style="width:600px" src="/artikel/20220311_debugging-vscode/fenster.png" alt="Widget Inspector Layout" class="img-fluid">

### Element im Code anzeigen
Wenn du im Widget Inspector auf ein Element klickst, springt er auch im Code automatisch an die Position, wo das Element liegt. 

<img style="width:600px" src="/artikel/20220311_debugging-vscode/sprung.png" alt="Widget Inspector Code" class="img-fluid">


### Elemente noch genauer untersuchen
Im Widget Inspector selbst gibt es rechts noch ein Menü mit fünf Punkten. Hier kannst du zum Beispiel Animationen verlangsamen, um sie besser zu untersuchen, Bilder anzeigen lassen, die zu groß sind und komprimiert werden können und weiteres. Probier es aus!


<img style="width:600px" src="/artikel/20220311_debugging-vscode/bilder.png" alt="Elememente noch besser untersuchen" class="img-fluid">

### Bonus: Attribute eines Widgets anzeigen
Eigentlich ganz einfach, kennen aber wenige. Wenn du wissen möchtest, welche Attribute ein Widget akzeptiert, kannst du einfach über dem Element hovern. Dann öffnet sich ein Popup, das anzeigt, was du im Widget angeben kannst. 

<img style="width:600px" src="/artikel/20220311_debugging-vscode/column.png" alt="Elememente noch besser untersuchen" class="img-fluid">

Du arbeitest gerne mit VS Code? Dann findest du in diesem Artikel coole VS Code Extensions für Flutter, die du auf jeden Fall kennen solltest: 
<a href="https://flutter.de/artikel/n%C3%BCtzliche-vs-code-flutter-extensions-und-einstellungen.html" target="blank" rel="noopner">VS Code Flutter Extensions </a>