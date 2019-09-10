---
title: "Entwicklungsumgebung einrichten"
slug: "flutter-entwicklungsumgebung-einrichten" 
date: 2019-07-08T09:28:22+02:00
draft: false
header_image: "/artikel/20190708-getting-started/images/getting-started.jpg"
images: ["/artikel/20190708-getting-started/images/getting-started.jpg"]
description: "Flutter First Steps: Flutter installieren, ein Flutter Demo Projekt erstellen und was du sonst noch dazu benötigst, um das Flutter Hello World zu sehen."
tags: ["flutter-setup","flutter","entwicklungsumgebung","setup"]
categories: Anfänger * getting started * Entwicklungsumgebung * Setup
authors: ["markus-kuehle"]
link: 20190613-gettings-started/20190613-gettings-started.md
author: Markus Kühle
---

## Flutter First Steps

Flutter ist ein sehr schönes Framework, das dir den schnellen Einstieg in die Appentwicklung ermöglicht. In diesem Artikel zeige ich allen, die Flutter lernen wollen, wie sie die Entwicklungsumgebung schnell einrichten können, um direkt mit dem Programmieren loslegen zu können. Dazu müssen für Android und iOS unterschiedliche Tools installiert werden. 
Ziel ist es, dass du nach dieser Anleitung dein Flutter "Hello World" Programm in einem Simulator bzw. Emulator ansehen kannst.

## Ablauf der Installationsanleitung

1. iOS Abhängigkeiten installieren
2. Android Abhängigkeiten installieren
3. Flutter installieren
4. Demo Projekt für iOS erstellen und im Simulator ansehen

Diese Beispielinstallation wurde auf einem MacBook durchgeführt. Für Windows und Linux unterscheidet sich die Installation ggf. etwas an der einen oder anderen Stelle.

## iOS Abhängigkeiten installieren

1. Neuestes Xcode via Apple App-Store installieren (kann eine ganze Weile dauern - man braucht hier einwenig Geduld) oder hier herunterladen: [https://itunes.apple.com/us/app/xcode/id497799835](https://itunes.apple.com/us/app/xcode/id497799835)

2. Apple Commandline Developer Tools installieren
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

3. Ermöglichen, dass man direkt on-device testen kann und cocoapods installieren, um Libraries für iOS Anwendung nutzen zu können.
Die ausführlichen Erklärungen findest du im jeweiligen git Projekt von [usbmuxd](https://github.com/libimobiledevice/usbmuxd "usbmuxd"), [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice "libimobiledevice")  oder [cocoapods](https://github.com/CocoaPods/CocoaPods "cocoapods").
```
brew update
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
```

4. iOS Simulator starten \
Folgenden Befehl in der Konsole eingeben, um den iOS Simulator zu starten und anschließend zu verwenden:
```
open -a Simulator
```
{{< figure src="/artikel/20190708-getting-started/images/ios-simulator.png" alt="iOS Simulator gestartet" height="600">}}

## Android Abhängigkeiten installieren

1. Android Studio installieren [https://developer.android.com/studio/index.html](https://developer.android.com/studio/index.html)
2. Android Studio starten und durch den “Android Studio Setup Wizard” durchklicken, bis alle weiteren Abhängigkeiten installiert wurden 
\

{{< figure src="/artikel/20190708-getting-started/images/android-studio-components-download.png" alt="Android Studio Components Download" height="400" >}}
3. Android Studio öffnen und auf dem initialen Dialog Configure -> Plugins anklicken \


{{< figure src="/artikel/20190708-getting-started/images/android-studio-plugins-download.png" alt="Android Studio Plugin Downloads" height="500" >}}
4. Im Marketplace nach dem Plugin “Flutter” suchen und installieren. Es weist darauf hin, dass Flutter das Plugin Dart benötigt und auch gleich mit installieren möchte: \


{{< figure src="/artikel/20190708-getting-started/images/android-studio-flutter-plugin.png" alt="Android Studio Flutter Plugin" height="400" >}}
5. “Neues Flutter Projekt” auswählen und den Wizard bis zum Ende mit den Default durchklicken. Das Projekt wird erfolgreich generiert.
 \

{{< figure src="/artikel/20190708-getting-started/images/android-studio-neues-projekt.png" alt="Android Studio Neues Projekt erstellen" height="300" >}}
6. Den AVD Manager öffnen: Hauptmenü -> Tools -> AVD Manager. Im Dialog anschließend “Create Virtual Device” anklicken: \

{{< figure src="/artikel/20190708-getting-started/images/android-studio-avd-manager.png" alt="Android Studio AVD Manager" height="400" >}}
Beliebige Hardware auswählen, “Next” klicken um das Image auszuwählen. Für den Start einfach das aktuellste Image auswählen (ganz oben in der Liste) und wieder “Next” klicken. Im letzten Dialog “Verify Configuration” die Installation des Virtuellen Devices mit “Finish” starten. Das Herunterladen der Imagedatei kann eine Weile dauern. Anschließend wird das Device aufgelistet: \

{{< figure src="/artikel/20190708-getting-started/images/android-studio-installiertes-device.png" alt="Android Studio Auflistung installiertes Device" height="300" >}}
7. Mit dem “Play” Button in der Actions Spalte kann das Device gestartet werden: \

{{< figure src="/artikel/20190708-getting-started/images/android-studio-gestarter-emulator.png" alt="Android Studio Emulator gestartet" height="500" >}}


## Flutter installieren
Das Flutter SDK wird für Windows, MacOS und Linux angeboten. Ich habe das SDK für MacOS heruntergeladen, was sich gerade bei der Version v1.5.4-hotfix.2	befindet.
Das aktuelle Flutter SDK kannst du auf flutter.dev herunterladen: [https://flutter.dev/docs/development/tools/sdk/releases?tab=macos](https://flutter.dev/docs/development/tools/sdk/releases?tab=macos)

{{< figure src="/artikel/20190708-getting-started/images/flutter-sdk-download.png" alt="Flutter SDK auf flutter.dev herunterladen" height="300" >}}

Das Flutter Zip an einem zentralen Ort entpacken und die `$PATH` Variable auf den entpackten Ordner `/bin` setzen. \
Um den Pfad permanent zu setzen, muss in der `.bash_profile` der volle Pfad angegeben werden. Bei mir ist folgender Eintrag hinzugekommen:
```
export PATH="$PATH:/Users/markus/Projekte/Flutter/SDK/bin"
```
Den Befehl `flutter doctor` ausführen, um zu sehen, welche Abhängigkeiten fehlen.


## Erstes Demo Projekt erstellen
Um zu testen, ob die Flutter Installation sowie der iOS Simulator und Android Emulator funktionieren, erstellen wir jetzt ein erstes Demo Projekt und wollen es auf den beiden Zielplatformen sehen. Dazu führen wir folgende Schritte aus:

*   In einen Ordner wechseln, in dem das erste Flutter Projekt erstellt werden soll
*   Flutter Demo Projekt erstellen: `flutter create mein_erstes_projekt` \
Wichtig ist, dass der Name der Dart Package Konvention entspricht (lowercase und underscore \
Es werden eine ganze Menge Dateien generiert.
*   Demoprojekt starten:  \
	`cd mein_erstes_projekt` \
	`flutter run`
*   Wenn noch kein Emulator gestartet wurde, erscheint die Meldung “`No connected devices.`” \

{{< figure src="/artikel/20190708-getting-started/images/flutter-run-no-connected-devices.png" alt="flutter run - no connected devices" height="200" >}}
*   Auch der Befehl `flutter doctor` zeigt den entsprechenden Hinweis “`! No devices available`” \
*   Der Befehl `flutter emulators` zeigt nach einer erfolgreichen Installation von iOS und Android auch die installierten Emulatoren an.


## Demo Projekt im iOS Simulator ansehen
*   iPhone Simulator starten: `flutter emulators --launch apple_ios_simulator` \
Der iPhone Simulator ist nun zu sehen.
*   In das Projektverzeichnis wechseln und das Flutter Projekt starten: \
`cd mein_erstes_projekt/` \
`flutter run`

{{< figure src="/artikel/20190708-getting-started/images/ios-simulator-demo-projekt.png" alt="iOS Simulator Demo Projekt" height="600">}}

<!-- ## Demo Projekt im Android Emulator ansehen
Android Emulator mit Android Studios

Der Android Emulator kann über die Konsole wie folgt gestartet werden.


    emulator @avd-name -dns-server 8.8.8.8


    Wichtig hierbei ist der Parameter für den dns-server

Um sich alle “avd” anzeigen zu lassen kann man den Befehl

	avdmanager list avd 

alle anzeigen. Die Emulatoren können sowohl über die Konsole, als auch über Android Studio erstellt werden.

Nach dem Auschecken

flutter packages get -->

## Fazit
Um die Entwicklungsumgebung zum Laufen zu bringen, braucht man doch etwas Zeit, vor allem für xCode. Aber sind erst einmal alle Abhängigkeiten installiert, sieht man sehr schnell das erste Flutter Programm. Anschließend kann man sich vom Live Hot Code Replacement verzücken lassen und immer tiefer in die Welt von Flutter eintauchen.

Viel Spaß beim Entwickeln der nächsten App :)
