---
title: "Flutter auf Windows, Mac oder Linux schnell und einfach installieren"
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

Ich zeige dir wie man Flutter auf Windows, MacOS oder Linux ohne viel Aufwand sehr schnell und vor allem sehr einfach installieren kann. Wer sich schon einmal durch das <a href="https://docs.flutter.dev/get-started/install" target="_blank">Getting Started auf flutter.dev</a> hat, weiß, dass das Installieren von Flutter und seinen Abhängigkeiten alles andere als einfach ist. 

## Flutter Community Package
Zum Glück war die Flutter Community fleißig und hat sich für die komplexe Installtaion etwas ausgedacht. Drei Packages - für jedes Betriebssystem eines - das das Installieren von Flutter zu einem Kinderspiel macht.

* <a href="#installation-von-flutter-für-windows">Windows</a>
* <a href="#installation-von-flutter-für-mac">MacOS</a>
* <a href="#installation-von-flutter-für-linux">Linux</a>

<a href="#installtion-von-flutter-prüfen">Flutter Setup prüfen.</a>

### Installation von Flutter für Windows 
Für Windows brauchen wir den Packagemanager von <a href="https://chocolatey.org/install" target="_blank" rel="noopener">Chocolately</a>. Für die Installation von Chocolately einfach durch die Installationsanleitung hangeln.
Wenn das erledigt ist, gibst du in der Konsole folgenden Befehl ein: 

{{<highlight yaml>}}
choco install flutter
{{</highlight>}}

Nach wenigen Minuten ist Flutter vollständig installiert. Es kann jedoch sein, dass nicht die aktuellste Version installiert wurde. Um dies zu beheben, gib einfach den Befehl 

{{<highlight yaml>}}
flutter update
{{</highlight>}}

ein.

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

Als nächstes benötigst du Xcode, welches du einfach aus dem App Store herunterladen kannst. 
Dieser Vorgang wird einige Zeit in Anspruch nehmen.
Wenn du die Installation abgeschlossen hast, musst du noch Cocoapods installieren. Gib hierfür einfach folgenden Befehl in die Konsole ein:

{{<highlight yaml>}}
brew install cocoapods
{{</highlight>}}

Die Xcode Installation ist hiermit vollständig.



Hinweis: Du kannst mithilfe des Befehls 

{{<highlight yaml>}}
flutter doctor
{{</highlight>}}

jeden Teil der Installation überprüfen. Ist ein grüner Haken zu sehen, hat alles funktioniert. Ist ein gelbes Ausrufezeichen zu sehen, so fehlt noch etwas. Ist ein rotes X zu sehen, ist wohl etwas schief gelaufen.


Anschließend benötigst du <a href="https://developer.android.com/studio?hl=de&gclid=Cj0KCQiA64GRBhCZARIsAHOLriJO1yA2A5gYSyO-nEVOzJi0hYIimgw1GZOhLuuKZpv741HHUvu7UsQaAgY9EALw_wcB&gclsrc=aw.ds" target="_blank" rel="noopener">Android Studio</a>. Nach der Installation musst du in Android Studio über 'More Actions' in den 'SDK Manager'.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-MoreActions.png" width="600px">

Unter dem Reiter 'SDK Platforms' kannst du verschiedene Android Versionen installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Platforms.png" width="600px">

Unter dem Reiter 'SDK Tools' musst du zusätzlich 'Android SDK Command-line Tools' installieren.

<img src="/artikel/20220117-flutter-einfach-installieren/android-studio-SDK_Tools.png" width="600px">

Die Installation von Android Studio ist hiermit abgeschlossen.
Du kannst jetzt mit dem Befehl `flutter doctor` überprüfen, ob die Installation gelungen ist.


Abschließend musst du jetzt nur noch <a href="https://code.visualstudio.com" target="_blank" rel="noopener">Visual Studio Code</a> und <a href="https://www.google.com/intl/de/chrome/" target="_blank" rel="noopener">Google Chrome</a> installieren.

Und schon bist du startklar. 
Viel Spaß beim Entwickeln!

### Installation von Flutter für Linux
Für Linux brauchen wir den Packagemanager von Snapcraft. Dieser kann hier heruntergeladen werden: <a href="https://snapcraft.io" target="_blank" rel="noopener">Snapcraft herunterladen</a>.
Sobald dies erledigt ist, gib einfach in der Konsole 
{{<highlight yaml>}}
sudo snap install flutter --classic 
{{</highlight>}}
ein. Und ta-da! Flutter ist installiert. Auch hier kannst du den Befehl flutter doctor eingeben, um zu überprüfen, ob alles geklappt und zu checken, was dir für die Entwicklung noch fehlt. 

## Installtion von Flutter prüfen

Der schnellste Weg zu prüfen ob Flutter korrekt installiert und alle Pfad-Variablen korrekt gesetzt wurden ist der Befehl:

{{<highlight yaml>}}
flutter --version
{{</highlight>}}
Wenn dieser Befehl aufgerufen werden kann ist der erste Erfolg zu sehen:
<img src="/artikel/20220117-flutter-einfach-installieren/flutter-version.png" width="600px">

Wenn er den Befehl `flutter` nicht erkennt, ist wohl etwas schief gelaufen. Zumindest wird die Flutter Runtime nicht gefunden.
Falls die Meldung "A new version of Flutter is available!" zu sehen ist, dann direkt den Befehl für das Update hinerher schieben:
{{<highlight yaml>}}
flutter update
{{</highlight>}}

### Flutter Doctor
Um zu überprüfen, ob die Installation wirklich vollständig funktioniert hat, bringt Flutter seinen eigenen Doctor mit. Dazu folgenden Befehl ausführen:
{{<highlight yaml>}}
flutter doctor
{{</highlight>}}

Wenn Flutter erfolgreich installiert wurde, sollte bei Flutter ein grünes Häkchen sein. Flutter Doctor zeigt dir auch an, was du noch alles für die Entwicklungsumgebung brauchst. Installiere alles, um richtig mit Flutter arbeiten zu können.

<img src="/artikel/20220117-flutter-einfach-installieren/flutter-doctor.png">

Als letztes solltest du noch Visual Studio Code installieren und für Flutter konfigurieren.