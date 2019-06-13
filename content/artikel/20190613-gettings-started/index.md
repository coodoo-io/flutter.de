---
title: "Entwicklungsumgebung einrichten"
slug: "flutter-entwicklungsumgebung-einrichten" 
date: 2019-06-13T22:28:22+02:00
draft: false
description: "Flutter installieren und was du sonst noch dazu benötigst um das Flutter Hello World zu sehen."
tags: ["flutter-setup"]
categories: []
author: Markus Kühle
---

<!-----
Original Google Doc Post: https://docs.google.com/a/coodoo.de/open?id=1ONgwh0uRQ2V3Qu3dN68YP9BcefY8IzslslxsVLMqjYw
----->

Um mit Flutter zu starten benötigst du eine Entwicklungsumgebung. Dazu müssen für Android und iOS unterschiedliche Tools installiert werden. 
Ziel ist es, dass du nach dieser Anleitung dein Flutter Hello World Programm in einem Simulator bzw. Emulator ansehen kannst.
<!--more-->

Ablauf der Installationsanleitung:

1. iOS Abhängigkeiten installieren
2. Android Abhängigkeiten installieren
3. Flutter installieren
4. Demo Projekt für iOS erstellen und im Simulator ansehen

## Entwicklungsumgebung für iOS Simulator

1. Neuestes Xcode via Apple App-Store installieren (kann eine ganze Weile dauern) [https://itunes.apple.com/us/app/xcode/id497799835](https://itunes.apple.com/us/app/xcode/id497799835) \

2. Apple Commandline Developer Tools installieren
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

3. on-device testing ermöglichen und cocoapods installieren um Libraries für iOS Anwendung nutzen zu können

```
brew update
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
```

4. Simulator starten
```
open -a Simulator
```
{{< figure src="images/ios-simulator.png" title="Steve Francia" caption="Testbild" height="300" >}}



# 


# Entwicklungsumgebung für Android installieren



1. Android Studio installieren [https://developer.android.com/studio/index.html](https://developer.android.com/studio/index.html)
2. Android Studio starten und durch den “Android Studio Setup Wizard” durchklicken, bis alle weiteren Abhängigkeiten installiert werden \


<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting1.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting1.png "image_tooltip")

3. Android Studio öffnen und auf dem initialen Dialog Configure -> Plugins anklicken \


<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting2.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting2.png "image_tooltip")

4. Im Marketplace nach dem Plugin “Flutter” suchen und installieren. Es weist darauf hin, dass Flutter das Plugin Dart benötigt und auch gleich mit installieren möchte: \


<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting3.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting3.png "image_tooltip")

5. “Neues Flutter Projekt” auswählen und den Wizard bis zum Ende mit den Default durchklicken. Das Projekt wird erfolgreich generiert. \


<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting4.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting4.png "image_tooltip")

6. Den AVD Manager öffnen: Hauptmenü -> Tools -> AVD Manager oder auf  

<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting5.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting5.png "image_tooltip")
 klicken. Im Dialog anschließend “Create Virtual Device” anklicken: \


<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting6.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting6.png "image_tooltip")


    Beliebige Hardware auswählen “Next” klicken um das Image auszuwählen. Für den Start einfach das aktuellste Image auswählen (ganz oben in der Liste) und wieder “Next” klicken. Im letzten Dialog “Verify Configuration” die Installation des Virtuellen Devices mit “Finish” starten. Das Herunterladen der Imagedatei kann eine Weile dauern. Anschließend wird das Device aufgelistet: \


<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting7.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting7.png "image_tooltip")


7. Mit dem “Play” Button in der Actions Spalte kann das Device gestartet werden: \


<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting8.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting8.png "image_tooltip")
 \



## 


# Flutter installieren

Aktuellstes Flutter SDK herunterladen: [https://flutter.dev/docs/development/tools/sdk/releases?tab=macos](https://flutter.dev/docs/development/tools/sdk/releases?tab=macos)



<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting9.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting9.png "image_tooltip")


 Flutter Zip entpacken und $PATH Variable auf den entpackten Ordner /bin setzen.

Um den Pfad permanent zu setzen muss in der .bash_profile der volle Pfad angeben werden. Bei mir ist es folgender Eintrag:

export PATH="$PATH:/Users/markus/Projekte/Flutter/SDK/bin"

Den Befehl flutter doctor ausführen um zu sehen welche Abhängigkeiten fehlen.


# Erstes Demo Projekt erstellen



*   In einen Ordner wechseln in dem das erste Flutter Projekt erstellt werden soll
*   Flutter Demo Projekt erstellen: `flutter create mein_erstes_projekt` \
Wichtig ist, dass der Name der Dart Package Konvention entspricht (lowercase und underscore \
Es werden eine ganze Menge Dateien generiert.
*   Demoprojekt starten:  \
	`cd mein_erstes_projekt` \
	`flutter run`
*   Wenn noch kein Emulator gestartet wurde erscheint die Meldung “`No connected devices.`” \


<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting10.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting10.png "image_tooltip")

*   Auch der Befehl flutter doctor zeigt den entsprechenden Hinweis “`! No devices available`”
*   Der Befehl “flutter emulators” zeigt nach einer erfolgreichen Installation von iOS und Android auch die installierten Emulatoren an


## Demo Projekt Im iOS Emulator ansehen



*   iPhone Emulator starten: `flutter emulators --launch apple_ios_simulator` \
Der iPhone Emulator ist zu sehen.
*   In das Projektverzeichnis wechseln und das Flutter Projekt starten: \
`cd mein_erstes_projekt/` \
`flutter run`



<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Flutter-Getting11.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Flutter-Getting11.png "image_tooltip")


Android Emulator mit Android Studios

Der Android Emulator kann über die Konsole wie folgt gestartet werden.


    emulator @avd-name -dns-server 8.8.8.8


    Wichtig hierbei ist der Parameter für den dns-server

Um sich alle “avd” anzeigen zu lassen kann man den Befehl

	avdmanager list avd 

alle anzeigen. Die Emulatoren können sowohl über die Konsole als auch über Android Studio erstellt werden.

Nach dem auschcekn

flutter packages get


<!-- Docs to Markdown version 1.0β17 -->
