---
title: "Flutter auf Windows, Mac oder Linux installieren"
slug: "flutter-einfach-installieren-auf-windows-mac-linux" 
date: 2022-01-17T08:00:25+02:00
draft: false
header_image: "/artikel/20220117-flutter-einfach-installieren/flutter-installation-teaser.png"
images: ["/artikel/20220117-flutter-einfach-installieren/flutter-installation-teaser.png"]
description: "Eine ausführliche und einfache Anleitung wie du Flutter mit Packagemangern für Windows, Mac und Linux in wenigen Minuten installieren kannst und die dazugehörige IDE installierst und gleich mit einem Flutter Hello_World starten kannst."
tags: ["flutter", "installation", "package manager"]
categories: Flutter * Anfänger * Installation
authors: ["Markus-Kuehle"]
link: 20220117-flutter-einfach-installieren/flutter-einfach-installieren.md
---

Du möchtest schnell Flutter installiert bekommen und mit der App Entwicklung starten? Ich zeige dir, wie man Flutter und seine Entwicklungsumgebung auf Windows, MacOS oder Linux ohne viel Aufwand sehr schnell und vor allem <b>sehr einfach installieren kann</b>. <br><br>Diese Anleitung besteht aus mehreren Teilen:

<a href="#flutter-community-packages">1. Installation von Flutter über Community Packages</a>

<a href="#flutter-ide">2. Installation der IDE (VS Code, Android Studio und evtl. Xcode)</a>

<a href="#flutter-doctor">3. Überprüfung, ob alle Installationen vollständig sind und funktionieren</a>

<a href="#flutter-helloworld">4. Erstes Flutter Hello World Projekt</a>

<a href="#flutter-next">5. Nächste Schritte</a>



## Flutter über das Community Package installieren 

Wer sich schon einmal durch das <a href="https://docs.flutter.dev/get-started/install" target="_blank">Getting Started auf flutter.dev</a> gekämpft hat, weiß, dass das Installieren von Flutter und seinen Abhängigkeiten alles andere als einfach ist. 
Zum Glück war die Flutter Community fleißig und hat sich für die komplexe Installation etwas ausgedacht. Drei Packages - für jedes Betriebssystem eines - die das Installieren von Flutter zu einem Kinderspiel machen.

* <a href="#installation-von-flutter-für-windows">Windows</a>
* <a href="#installation-von-flutter-für-mac">MacOS</a>
* <a href="#installation-von-flutter-für-linux">Linux</a>


### Installation von Flutter für Windows 
Für Windows brauchen wir den Packagemanager von <a href="https://chocolatey.org/install" target="_blank" rel="noopener">Chocolately</a>. Für die Installation von Chocolately einfach durch die Installationsanleitung hangeln.
Wenn das erledigt ist, gibst du in der Konsole folgenden Befehl ein: 

{{<highlight yaml>}}
choco install flutter
{{</highlight>}}

Nach wenigen Minuten ist Flutter vollständig installiert. Es kann jedoch sein, dass nicht die aktuellste Version installiert wurde. Um dies zu beheben, gib einfach folgenden Befehl ein: 

{{<highlight yaml>}}
flutter upgrade
{{</highlight>}}


### Installation von Flutter für Mac
Der erste Schritt ist hier den Packagemanager <a href="https://brew.sh" target="_blank" rel="noopener">Homebrew</a> zu installieren. Gib hierfür einfach folgenden Befehl in deine Konsole ein: 

{{<highlight yaml>}}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
{{</highlight>}}

Wenn das erledigt ist, kannst du ganz einfach mit folgendem Befehl Flutter installieren:

{{<highlight yaml>}}
brew install --cask flutter
{{</highlight>}}

Und schon ist Flutter installiert und kann verwendet werden. Falls du direkt prüfen möchtest, ob die Version aktuell ist, einfach noch folgenden Befehl absetzen:

{{<highlight yaml>}}
flutter upgrade
{{</highlight>}}


### Installation von Flutter für Linux
Für Linux brauchen wir den Packagemanager von Snapcraft. Dieser kann hier heruntergeladen werden: <a href="https://snapcraft.io" target="_blank" rel="noopener">Snapcraft herunterladen</a>.
Sobald dies erledigt ist, gib einfach in der Konsole Folgendes ein: 
{{<highlight yaml>}}
sudo snap install flutter --classic 
{{</highlight>}}
Und ta-da! Flutter ist installiert. Auch hier kannst du den Befehl `flutter doctor` eingeben, um zu überprüfen, ob alles geklappt hat und um zu checken, was dir für die Entwicklung noch fehlt. 

<div id="flutter-ide"></div>

## Installation der IDE (VS Code, Android Studio und evtl. Xcode)

Wenn Flutter installiert ist, brauchen wir noch eine Entwicklungsumgebung, mit der wir bei der Entwicklung mit Dart und Flutter Widgets bestmöglich unterstützt werden.
Wenn du es dir sehr einfach machen willst, kannst du nur Chrome installieren und mit der Web Version von Flutter starten. Da siehst du deine App zwar nur im Web, aber es geht am schnellsten. 
Wenn du die Entwicklung auf einer richtigen App-Simulation sehen willst, brauchst du Folgendes:

* Visual Studio Code
* Android Studio
* Xcode und Cocoapods



### Visual Studio Code
Mit <a href="https://code.visualstudio.com" target="_blank" rel="noopener">Visual Studio Code</a> bekommst du einen sehr leistungsstarken und absolut leichtgewichtigen Code Editor der von Flutter selbst unterstützt wird. Visual Studio Code ist auch für alle Plattformen verfügbar. Dafür musst du einfach nur über die <a href="https://code.visualstudio.com" target="_blank" rel="noopener">Webseite</a> herunterladen und installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/vscode.png" width="600px">

Um mit VS Code einfach und schnell entwickeln zu können, solltest du dir direkt noch die Flutter Extension und Dart Extension hinzufügen. Dazu einfach links im VS Code Menü auf “Extensions” oder “Erweiterungen” klicken und nach “Flutter” und “Dart” suchen. Alternativ einfach ein Flutter Projekt im VS Code öffnen und dann schlägt dir der Editor selbst diese Packages für die Installation vor.

### Android Studio herunterladen

Du benötigst das Android Studio in jedem Fall, um dir bequem über den AVD Manager die verschiedenen Android SDKs für den Android Emulator zu installieren. Das Android Studio funktioniert auf einem Mac, auf Windows und auch unter Linux und hier kannst du es downloaden: <a href="https://developer.android.com/studio?hl=de&gclid=Cj0KCQiA64GRBhCZARIsAHOLriJO1yA2A5gYSyO-nEVOzJi0hYIimgw1GZOhLuuKZpv741HHUvu7UsQaAgY9EALw_wcB&gclsrc=aw.ds" target="_blank" rel="noopener">Android Studio</a>. Nach der Installation musst du in Android Studio über 'More Actions' in den 'SDK Manager'. Dieser fügt die eigentlichen Geräte hinzu, die du für die Entwicklung brauchst. Hier eine kleine visuelle Ansicht für die notwendigen Schritte:

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-MoreActions.png" width="600px">

Unter dem Reiter 'SDK Platforms' kannst du verschiedene Android Versionen installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Platforms.png" width="600px">

Unter dem Reiter 'SDK Tools' musst du zusätzlich 'Android SDK Command-line Tools' installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Tools.png" width="600px">

Die Installation von Android Studio ist hiermit abgeschlossen.


### Xcode und Cocoapods

Für die Entwicklung von iOS Apps benötigst du ebenfalls noch <a href="https://apps.apple.com/de/app/xcode/id497799835?mt=12" target="blank" rel="noopener">Xcode</a>, welches du einfach aus dem App Store herunterladen kannst. 
Dieser Vorgang wird einige Zeit in Anspruch nehmen, meistens mehrere Stunden.<br>
Wenn du die Installation abgeschlossen hast, musst du noch <a href="https://cocoapods.org" target="blank" rel="noopener">CocoaPods</a> installieren. <a href="https://cocoapods.org" target="blank" rel="noopener">CocoaPods</a> ist ein Dependency Manager für iOS, der die Entwicklung erleichtert. Um diese herunterzuladen, gib hierfür einfach folgenden Befehl in die Konsole ein (auch hier solltest du vorher Homebrew installiert haben):

{{<highlight yaml>}}
brew install cocoapods
{{</highlight>}}

Nach der installation nur noch diese beiden Befehle eingeben und Xcode ist damit startklar:

{{<highlight yaml>}}
sudo xcode-select --switch /Applications/Xcode.app/Contents/
sudo xcodebuild -runFirstLaunch
{{</highlight>}}


<div id="flutter-doctor"></div>

## Installation von Flutter und der Entwicklungsumgebung prüfen

Der schnellste Weg zu prüfen, ob Flutter korrekt installiert und alle Pfad-Variablen korrekt gesetzt wurden, ist der Befehl:

{{<highlight yaml>}}
flutter --version
{{</highlight>}}
Wenn dieser Befehl aufgerufen werden kann, ist der erste Erfolg zu sehen:
<img src="/artikel/20220117-flutter-einfach-installieren/flutter-version.png" width="600px">

Falls du eine ältere Version von Flutter installiert hast, wirst du Folgendes in der Console sehen:

<img src="/artikel/20220117-flutter-einfach-installieren/flutterversion.png" width="600px">

Wenn er den Befehl `flutter` nicht erkennt, ist wohl etwas schief gelaufen. Zumindest wird die Flutter Runtime nicht gefunden.
Falls die Meldung "A new version of Flutter is available!" zu sehen ist, dann direkt den Befehl für das Update hinterherschieben:
{{<highlight yaml>}}
flutter upgrade
{{</highlight>}}

### Flutter Doctor
Um zu überprüfen, ob die Installation wirklich vollständig funktioniert hat, bringt Flutter seinen eigenen Doctor mit. Dazu folgenden Befehl ausführen:
{{<highlight yaml>}}
flutter doctor
{{</highlight>}}

Wenn Flutter und die IDE erfolgreich installiert wurde, sollte überall ein grünes Häkchen sein. Wenn dies nicht der Fall ist, schaue ob du die richtige Version hast oder wiederhole bei Bedarf die Installation.

<img src="/artikel/20220117-flutter-einfach-installieren/flutter-doctor.png">

Und schon bist du startklar.

<div id="flutter-helloworld"></div>

## Erstes Flutter Hello World Projekt
Nun hält dich auch nichts mehr davon ab das erste Flutter Projekt zu erstellen und anzusehen. Dazu das mitgelieferte erste Hello World Projekt erstellen mit dem folgenden Befehl:
{{<highlight yaml>}}
flutter create hello_world_flutter
{{</highlight>}}

In der Console solltest du dann folgende Ausgabe sehen:

<img src="/artikel/20220117-flutter-einfach-installieren/helloflutter.png">

Nach dem Generieren des Codes mit den folgenden Befehlen das Projekt starten:

{{<highlight yaml>}}
cd hello_world_flutter
flutter run
{{</highlight>}}

Wenn der iOS Simulator oder der Android Emulator nicht verfügbar sind, sollten mindestens die macOS/Windows oder Chrome zur Auswahl als Device zur Verfügung stehen:

<img src="/artikel/20220117-flutter-einfach-installieren/devices.png">

Ich habe jetzt den Chrome gewählt und das Flutter Counter Projekt ist in meinem Browser zu sehen:

<img src="/artikel/20220117-flutter-einfach-installieren/chrome.png">

So, nun steht dem Coden nichts mehr im Weg.

<div id="flutter-next"></div>

## Nächste Schritte

Nun ist Flutter installiert und es juckt in den Händen die erste App zu schreiben. Neben den unzähligen Tutorials kann ich dir folgende beide Schritte empfehlen:

### Flutter Codelab

Im Flutter <a href="https://docs.flutter.dev/get-started/codelab" target="blank" rel="noopener">Codelab</a> wirst du an die ersten Widgets herangeführt und hast nach dem Tutorial deine erste kleine App am Laufen.

<img src="/artikel/20220117-flutter-einfach-installieren/codelab.png">

### Flutter Schulung
Wenn du einen schnellen und intensiven Start in die App-Entwicklung von Flutter haben möchtest, kann ich dir auch unsere Flutter Grundlagen Schulung empfehlen. Ich selbst bin einer der Trainer in der Schulung und wir bieten diese über flutter.de an: <a>https://flutter.de/schulung/flutter-schulung.html</a>

<img src="/artikel/20220117-flutter-einfach-installieren/schulung.png">

Ich wünsche viel Spaß bei der App-Entwicklung 🥳

