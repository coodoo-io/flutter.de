---
title: "Mit Packagemanagern Flutter schnell und einfach installieren"
slug: "flutter-installieren-mit-packages" 
date: 2022-01-17T08:00:25+02:00
draft: false
header_image: "/artikel/20220117-flutter-download/homebrew.png"
images: ["/artikel/20220117-flutter-download/homebrew.png"]
description: "Flutter mit Packagemangern für Windows, Mac und Linux installieren."
tags: ["flutter", "installation", "package manager"]
categories: Flutter * Anfänger * Installation
authors: ["Nadia-Micheilis"]
link: 20220117-flutter-download/flutter-download.md
---

Wer sich schon einmal durch das Getting Started auf flutter.dev oder im offiziellen Flutter Apprentice durchgekämpft hat, weiß, dass das Installieren von Flutter und seinen Abhängigkeiten alles andere als einfach ist. Mitunter scheitert es an so unwichtigen Kleinigkeiten wie dem Setzen eines falschen Pfades. Das kann gerade Anfänger sehr entmutigen. 
Zum Glück war die Flutter Community fleißig und hat sich dafür etwas ausgedacht. Drei Packages - für jedes Betriebssystem eines - das das Installieren von Flutter zu einem Kinderspiel macht.

### Installation von Flutter für Mac
Der erste Schritt ist hier den Packagemanager <a href="https://brew.sh" target="_blank" rel="noopener">Homebrew</a> zu installieren. Gib hierfür einfach folgenden Befehl in deine Konsole ein: 
{{<highlight yaml>}}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
{{</highlight>}}
Wenn das erledigt ist, kannst du ganz einfach mit folgendem Befehl Flutter installieren:

{{<highlight yaml>}}
brew install --cask flutter
{{</highlight>}}

Und schon ist Flutter installiert und du kannst direkt loslegen. 

### Installation von Flutter für Windows 
Für Windows brauchen wir den Packagemanager von Chocolately. Diesen kann man hier herunterladen: <a href="https://chocolatey.org/install" target="_blank" rel="noopener">Chocolately herunterladen</a>. Einfach durch die Installationsanleitung hangeln.
Wenn das erledigt ist, gibst du in der Konsole folgenden Befehl ein: 
{{<highlight yaml>}}
choco install flutter
{{</highlight>}}
Nach wenigen Minuten ist Flutter vollständig installiert. Es kann jedoch sein, dass nicht die aktuellste Version installiert wurde. Um dies zu beheben, gib einfach den Befehl 

{{<highlight yaml>}}flutter update {{</highlight>}}

ein.



### Installation von Flutter für Linux
Für Linux brauchen wir den Packagemanager von Snapcraft. Dieser kann hier heruntergeladen werden: <a href="https://snapcraft.io" target="_blank" rel="noopener">Snapcraft herunterladen</a>.
Sobald dies erledigt ist, gib einfach in der Konsole 
{{<highlight yaml>}}
sudo snap install flutter --classic 
{{</highlight>}}
ein. Und ta-da! Flutter ist installiert. Auch hier kannst du den Befehl flutter doctor eingeben, um zu überprüfen, ob alles geklappt und zu checken, was dir für die Entwicklung noch fehlt. 

### Checken, ob die Flutter Installation funktioniert hat

Um zu überprüfen, ob die Installation wirklich geklappt hat, gib in der Konsole {{<highlight yaml>}}flutter doctor{{</highlight>}} ein. Wenn Flutter erfolgreich installiert wurde, sollte bei Flutter ein grünes Häkchen sein. Wenn er den Befehl 'Flutter' nicht erkennt, ist wohl etwas schief gelaufen. 'Flutter Doctor' zeigt dir auch an, was du noch alles für die Entwicklungsumgebung brauchst. Installiere alles, um richtig mit Flutter arbeiten zu können.

<img src="/artikel/20220117-flutter-download/flutter-doctor.png">

### Komplette Entwicklungsumgebung einrichten
Um zu erfahren, wie man die Simulatoren von Flutter herunterlädt, kannst du dir diesen Flutter Artikel auf deutsch anschauen: <a href="https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten.html" target="_blank" rel="noopener">Entwicklungsumgebung einrichten.</a>