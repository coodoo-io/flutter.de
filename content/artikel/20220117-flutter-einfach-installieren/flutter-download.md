---
title: "Flutter auf Windows, Mac oder Linux installieren"
slug: "flutter-einfach-installieren-auf-windows-mac-linux" 
date: 2022-01-17T08:00:25+02:00
draft: false
header_image: "/artikel/20220117-flutter-einfach-installieren/flutter-installation-teaser.png"
images: ["/artikel/20220117-flutter-einfach-installieren/flutter-installation-teaser.png"]
description: "Flutter mit Packagemangern für Windows, Mac und Linux in wenigen Minuten installieren."
tags: ["flutter", "installation", "package manager"]
categories: Flutter * Anfänger * Installation
authors: ["Nadia-Micheilis"]
link: 20220117-flutter-einfach-installieren/flutter-einfach-installieren.md
---

Ich zeige dir, wie man Flutter und seine Entwicklungsumgebung auf Windows, MacOS oder Linux ohne viel Aufwand sehr schnell und vor allem sehr einfach installieren kann. Diese Anleitung besteht aus drei Teilen:

<a href="#flutter-community-packages">1. Installation von Flutter über Community Packages</a>

<a href="#flutter-ide">2. Installation der Entwicklungsumgebung</a>

<a href="#flutter-doctor">3. Überprüfung, ob alle Installationen vollständig sind und funktionieren</a>



## Flutter über das Community Package installieren 

Wer sich schon einmal durch das <a href="https://docs.flutter.dev/get-started/install" target="_blank">Getting Started auf flutter.dev</a> gekämpft hat, weiß, dass das Installieren von Flutter und seinen Abhängigkeiten alles andere als einfach ist. 
Zum Glück war die Flutter Community fleißig und hat sich für die komplexe Installtaion etwas ausgedacht. Drei Packages - für jedes Betriebssystem eines - die das Installieren von Flutter zu einem Kinderspiel machen.

* <a href="#installation-von-flutter-für-windows">Windows</a>
* <a href="#installation-von-flutter-für-mac">MacOS</a>
* <a href="#installation-von-flutter-für-linux">Linux</a>


### Installation von Flutter für Windows 
Für Windows brauchen wir den Packagemanager von <a href="https://chocolatey.org/install" target="_blank" rel="noopener">Chocolately</a>. Für die Installation von Chocolately einfach durch die Installationsanleitung hangeln.
Wenn das erledigt ist, gibst du in der Konsole folgenden Befehl ein: 

{{<highlight yaml>}}
choco install flutter
{{</highlight>}}

Nach wenigen Minuten ist Flutter vollständig installiert. Es kann jedoch sein, dass nicht die aktuellste Version installiert wurde. Um dies zu beheben, gib einfach folgende Befehl ein: 

{{<highlight yaml>}}
flutter update
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

Und schon ist Flutter installiert. 


### Installation von Flutter für Linux
Für Linux brauchen wir den Packagemanager von Snapcraft. Dieser kann hier heruntergeladen werden: <a href="https://snapcraft.io" target="_blank" rel="noopener">Snapcraft herunterladen</a>.
Sobald dies erledigt ist, gib einfach in der Konsole 
{{<highlight yaml>}}
sudo snap install flutter --classic 
{{</highlight>}}
ein. Und ta-da! Flutter ist installiert. Auch hier kannst du den Befehl flutter doctor eingeben, um zu überprüfen, ob alles geklappt und zu checken, was dir für die Entwicklung noch fehlt. 

<div id="flutter-ide"></div>

## Flutter Entwicklungsumgebung installieren

Jetzt da Flutter installiert ist, brauchen wir noch die Entwicklungsumgebung, um live auf verschiedenen Devices die Entwicklung verfolgen zu können. Wenn du es dir sehr einfach machen willst, kannst du nur Chrome herunterladen. Da siehst du deine App zwar nur im Web, aber es geht am schnellsten. Wenn du die Entwicklung auf einer richtigen App-Simulation sehen willst, brauchst du Folgendes: 

* Android Studio
* Visual Studio Code
* Xcode und Cocoapods


### Android Studio herunterladen

Android Studio hat den Vorteil, dass man es sowohl auf einem Mac, als auch Windows und Linux installieren kann. Hier kannst du es downloaden: <a href="https://developer.android.com/studio?hl=de&gclid=Cj0KCQiA64GRBhCZARIsAHOLriJO1yA2A5gYSyO-nEVOzJi0hYIimgw1GZOhLuuKZpv741HHUvu7UsQaAgY9EALw_wcB&gclsrc=aw.ds" target="_blank" rel="noopener">Android Studio</a>. Nach der Installation musst du in Android Studio über 'More Actions' in den 'SDK Manager'. Dieser fügt die eigentlichen Geräte hinzu, die du für die Entwicklung brauchst. 

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-MoreActions.png" width="600px">

Unter dem Reiter 'SDK Platforms' kannst du verschiedene Android Versionen installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Platforms.png" width="600px">

Unter dem Reiter 'SDK Tools' musst du zusätzlich 'Android SDK Command-line Tools' installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Tools.png" width="600px">

Die Installation von Android Studio ist hiermit abgeschlossen.


### Visual Studio Code
Visual Studio Code ist auch für alle Plattformen verfügbar. Dafür musst du <a href="https://code.visualstudio.com" target="_blank" rel="noopener">Visual Studio Code</a> einfach nur über die Webseite herunterladen und installieren.

### Xcode und Cocoapods

Für die Entwicklung von iOS Apps benötigst du ebenfalls noch <a href="https://apps.apple.com/de/app/xcode/id497799835?mt=12" target="blank" rel="noopener">Xcode</a>, welches du einfach aus dem App Store herunterladen kannst. 
Dieser Vorgang wird einige Zeit in Anspruch nehmen.<br>
Wenn du die Installation abgeschlossen hast, musst du noch CocoaPods installieren. <a href="https://cocoapods.org" target="blank" rel="noopener">CocoaPods</a> ist ein dependency manager für iOS, der die Entwicklung erleichtert. Um diese herunterzuladen, gib hierfür einfach folgenden Befehl in die Konsole ein:

{{<highlight yaml>}}
brew install cocoapods
{{</highlight>}}

Die Xcode Installation ist hiermit vollständig.

<div id="flutter-doctor"></div>

## Installation von Flutter und der Entwicklungsumgebung prüfen

Der schnellste Weg zu prüfen, ob Flutter korrekt installiert und alle Pfad-Variablen korrekt gesetzt wurden, ist der Befehl:

{{<highlight yaml>}}
flutter --version
{{</highlight>}}
Wenn dieser Befehl aufgerufen werden kann, ist der erste Erfolg zu sehen:
<img src="/artikel/20220117-flutter-einfach-installieren/flutter-version.png" width="600px">

Wenn er den Befehl `flutter` nicht erkennt, ist wohl etwas schief gelaufen. Zumindest wird die Flutter Runtime nicht gefunden.
Falls die Meldung "A new version of Flutter is available!" zu sehen ist, dann direkt den Befehl für das Update hinterherschieben:
{{<highlight yaml>}}
flutter update
{{</highlight>}}

### Flutter Doctor
Um zu überprüfen, ob die Installation wirklich vollständig funktioniert hat, bringt Flutter seinen eigenen Doctor mit. Dazu folgenden Befehl ausführen:
{{<highlight yaml>}}
flutter doctor
{{</highlight>}}

Wenn Flutter und die IDE erfolgreich installiert wurde, sollte überall ein grünes Häkchen sein. Wenn dies nicht der Fall ist, schaue ob du die richtige Version hast oder wiederhole bei Bedarf die Installation.

<img src="/artikel/20220117-flutter-einfach-installieren/flutter-doctor.png">

Und schon bist du startklar. 
Viel Spaß beim Entwickeln!