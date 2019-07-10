---
title: "Text-to-speech in Flutter"
slug: "text-to-speech" 
date: 2019-07-04T09:00:00+02:00
draft: false
header_image: "/artikel/20190705-text-to-speech/images/text-to-speech.jpg"
images: ["/artikel/20190705-text-to-speech/images/text-to-speech.jpg"]
description: "Text to Speech in Flutter einfügen und benutzen."
tags: ["flutter","Text to Speech","Locales"]
categories: Fortgeschrittene * Widgets * Sprache
author: Arend Kühle
link: 20190705-text-to-speech/20190705-text-to-speech.md
---

<!-----
Original Google Doc Post: https://docs.google.com/document/d/1OjxAZMuLMjv2BL6us0d3f1Agw74eFTCfloPtgQ-010Y/edit?usp=sharing
----->

Mein fünfjähriger Sohn kommt hin und wieder mit einem Zettel, auf dem er ein paar Buchstaben gemalt hat und bittet mich ihm sein Werk vorzulesen. Daraufhin lacht er sich kaputt, verschwindet mit dem Zettel wieder und kommt erneut mit noch mehr Buchstaben. Das Ganze kann sich schon mal ne Stunde lang wiederholen.

Da das nach dem x-ten Mal nerven kann, dachte ich mir, ich schreibe dem Sohnemann eine App, damit ich in Zukunft ungestört auf der Couch liegen kann. Eine gute Gelegenheit Flutter auszuprobieren!

**Das Ziel:** Eine App, in die man Buchstaben, Zahlen und Worte eingeben kann und diese vorgelesen werden.

**Schritt 1: Entwicklungsumgebung**

Die [Entwicklungsumgebung einrichten](https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten/ "Entwicklungsumgebung einrichten") war kein Problem und das Zusammenstellen der Widgets konnte starten.

**Schritt 2: Gestaltung**

Mit dem Fokus auf Vorschulkinder, habe ich versucht, die App so einfach wie möglich zu gestalten. Die Basis bildet eine Tastatur mit allen Buchstaben, samt Umlauten in Großbuchstaben. Glücklicherweise ergeben diese zusammen mit dem Leerzeichen (hier ein Pfeilchen nach rechts) 30 Buttons, die sich gleichmäßig in Portrait- und Landscape-Ansicht aufteilen lassen. Darüber befindet sich eine Card, in der das eingegebene Wort zu sehen ist. Schließlich habe ich noch ein paar Buttons darüber gesetzt, mit denen die Eingabe entfernt werden kann. Der prominente FloatingActionBotton soll schließlich die Eingabe vorlesen.

{{< figure src="/artikel/20190705-text-to-speech/images/abc.png" height="300" >}}

**Schritt 3: Text-to-speech**

Wie bringe ich die App nun zum Sprechen? Text-to-Speech (TTS) ist das Schlüsselwort! Jeder kennt ja die Stimme seines Navigationssystems. Diese wird vom darunter liegenden Betriebssystem zur Verfügung gestellt und das wollte ich für diese App nutzen. 
Für fast alles gibt es bereits Implementierungen für Flutter, somit musste ich nicht lange suchen, um auf dieses Flutter Text to Speech Package [Flutter Text to Speech Package](https://github.com/dlutton/flutter_tts "Flutter Text to Speech Package") zu stoßen.
Die Einbindung war denkbar einfach, dank einer [Beispielimplementierung](https://github.com/dlutton/flutter_tts/blob/master/example/lib/main.dart "Beispielimplementierung") im gleichen GitHub Repository. Man erstellt eine Instanz und gibt ihr etwas zum Sprechen. 
{{< highlight dart >}}
flutterTts = FlutterTts();
await flutterTts.speak('Hallo Welt');
{{< /highlight >}}
Doch zwei kleine Hürden galt es doch zu nehmen, bevor ich meine App sprechen hören konnte:

*   iOS muss erst um den Zugriff auf Audio gebeten werden. Mir hat dabei eine [Stack Overflow-Antwort](https://stackoverflow.com/questions/50458556/flutter-swift-version-must-be-set-to-a-supported-value/52194702#52194702 "Stack Overflow-Antwort") geholfen. Allerdings klappte es erst nach einer Rasur in der Projektstruktur: 
`rm -rf ios android && flutter create -i swift .`
*   Android hingegen verlangte nur die Festlegung auf mindestens Version 21: `minSdkVersion 21`

Alles, was ich nun noch tun musste, war mittels des FloatingActionButton den eingegebenen Text der `speak` Methode zu übergeben.

{{< figure src="/artikel/20190705-text-to-speech/images/itsalive.gif" height="400" >}}

**Schritt 4: Sprache ändern** 

Die erste Erkenntnis: Meine App ist ein Amerikaner!
Kein Problem, denn das Flutter Text to Speech package lässt mit sich reden. Beim Initialisieren kann man neben Geschwindigkeit, Lautstärke und Tonhöhe auch eine Sprache direkt setzen. Diese Einstellungen lassen sich auch zur Laufzeit ändern.
{{< highlight dart >}}
flutterTts = FlutterTts();
flutterTts.setLanguage('de-DE');
flutterTts.setSpeechRate(1.0);
flutterTts.setVolume(1.0);
flutterTts.setPitch(1.0);
{{< /highlight >}}

**Schritt 5: Das Vorlesen unterbrechen - Die stop Methode** 

Die zweite Erkenntnis: Die App will nicht unterbrochen werden! 
Wiederholtes Auffordern zum Sprechen wird gewissenhaft abgearbeitet. Will heißen, drücke ich 10 mal den Button zum Vorlesen des Wortes “Feuerwehr”, so darf ich es mir auch 10 Mal in Folge anhören. Da ich mittlerweile alle Tasten sich selbst sprechen ließ, wurde diese Tugend nervig.
Gegenspieler der `speak` Methode ist die `stop` Methode. Nun kann man sich wie in der Beispielimplementierung merken, ob gerade gesprochen wird und dies stoppen oder aber der App immer dann den Mund verbieten, wenn etwas Neues gesprochen werden soll. Letzteres fand ich für meine App passend:
{{< highlight dart >}}
Future _read(String text) async {
 /// Wenn noch am Reden, dann Klappe halten!
 await flutterTts.stop();
 if (text != null && text.isNotEmpty) {
   /// Als Kleinbuchstaben aussprechen lassen, da sonst beispielsweise "Großbuchstabe X" statt nur "X" gesagt wird...
   await flutterTts.speak(text.toLowerCase());
 }
}
{{< /highlight >}}

**Schritt 6: Umlaute** 

Die dritte Erkenntnis: Umlaute sind Zungenbrecher!
iOS und Android sprechen nicht die gleiche Sprache, daher hört man verschiedene Interpretationen gewisser Worte und besonders bei alleinstehenden Umlauten sticht das heraus. iOS hält ein “ü” für “U-Umlaut”, während Android brav ein “üüh” ausspuckt. Hier kann eine Unterscheidung der Plattformen helfen:
{{< highlight dart >}}
case 'Ü':
 if (Platform.isIOS) {
   _read('üh');
 } else {
   _read('ü');
 }
 break;
 {{< /highlight >}}

**Schritt 7: Zahlen und Zufallsworte**

Die App tat dann endlich, was sie sollte. Um sie nicht zu schnell langweilig werden zu lassen, habe ich noch einen Zahlenmodus und ein Zufallswort-Button eingefügt. Richtig unterhaltsam wurde sie allerdings erst, als ich mit den Sprachen experimentierte.
Es lassen sich über die `flutterTts` Instanz alle auf dem Gerät zur Verfügung stehenden Sprachen und Stimmen abrufen und einsetzen.
{{< highlight dart >}}
languages = await flutterTts.getLanguages;
voices = await flutterTts.getVoices;
{{< /highlight >}}
Die Sprachen sind in bekannten Locale-Strings angegeben, aus denen sich Sprache und Land ableiten lassen. Aus der Liste von Sprachen habe ich dann noch einen Drawer zur Auswahl in der App ergänzt.

{{< figure src="/artikel/20190705-text-to-speech/images/sprachen.png" height="300" >}}

Das ginge auch mit verschiedenen Stimmen, doch als ich die App baute, waren diese nur für Android verfügbar. Mittlerweile unterstützt die Bibliothek auch iOS.

**Fazit: Super Framework**

Es war viel zu leicht! Ich hatte nicht angenommen so schnell zu einem brauchbaren Ergebnis zu kommen. Allein für das Einbinden der TTS-Funktionalität hatte ich mit einem Tag gerechnet und vielleicht 30 Minuten gebraucht. Auch das Erstellen einer UI mit Flutter ging besser von der Hand als erwartet. Wobei ich die GridView nicht als Komponente innerhalb einer page empfehlen kann, denn diese bricht sämtliche um sie liegenden Layout-Anweisungen.

Wer weiß, ob diese App je im App-Store landen wird. Auf [GitHub](https://github.com/coodoo-io/fluttabc "GitHub") ist sie jedenfalls zu haben.



<!-- Docs to Markdown version 1.0β17 -->
