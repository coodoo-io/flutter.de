---
title: "Text-to-Speech"
slug: "text-to-speech" 
date: 2019-06-19T15:23:45+02:00
draft: true
description: "Erste Schritte in Flutter: Text to Speech"
tags: ["flutter","Text-to-Speech","Locales"]
categories: []
author: Arend Kühle
---


<!-----
Original Google Doc Post: https://docs.google.com/document/d/1OjxAZMuLMjv2BL6us0d3f1Agw74eFTCfloPtgQ-010Y/edit?usp=sharing
----->


Text to Speech

Mein fünfjähriger Sohn kommt hin und wieder mit einem Zettel auf dem er ein paar Buchstaben gemalt hat und bittet mich ihm sein Werk vorzulesen. Daraufhin lacht er sich kaputt, verschwindet mit dem Zettel wieder und kommt erneut mit noch mehr Buchstaben. Das Ganze kann sich schon mal ne Stunde lang wiederholen.

Da das auch schon Mal nerven kann, dachte ich mir, ich schreibe dem Sohnemann eine App, damit ich in Zukunft ungestört auf der Couch liegen bleiben kann! Eine Gute gelegenheit Flutter auszuprobieren. Die Entwicklungsumgebung einrichten [http://localhost:1313/artikel/flutter-entwicklungsumgebung-einrichten/] war kein Problem und zusammenstellen der Widget konnte starten.

Mit dem Fokus auf Vorschulkinder hatte ich versucht die App so einfach wie möglich zu gestalten. Die Basis bildet eine Tastatur mit allen Buchstaben, samt Umlauten in Großbuchstaben. Glücklicherweise ergeben diese zusammen mit dem Leerzeichen (hier ein Pfeilchen nach rechts) 30 Buttons, was sich gleichmäßig in Portrait- und Landscape-Ansicht Aufteilen lässt. Darüber befindet sich eine Card, in der das eingegebene Wort zu sehen ist. Schließlich habe ich noch ein paar Buttons darüber gesetzt, mit denen die Eingabe entfernt werden kann. Der prominente FloatingActionBotton soll schließlich die Eingabe vorlesen.



Wie bringe ich die App nun dazu zu sprechen? Text-to-Speech (TTS) ist das Schlüsselwort! Jeder kennt ja die Stimme seines Navigationssystems. Diese ist wird vom darunter liegenden Betriebssystem zur verfügung gestellt und das wollte ich für diese App nutzen. Für fast alles gibt es bereits Implementierungen für Flutter, somit musste ich auch nicht lange suchen um auf dieses Flutter Text to Speech Package [https://github.com/dlutton/flutter_tts] zu stoßen.
Die Einbindung war denkbar einfach dank einer Beispielimplementierung [https://github.com/dlutton/flutter_tts/blob/master/example/lib/main.dart] im gleichen GitHub Repository. Man erstellt eine Instanz und gibt etwas zum sprechen. 
flutterTts = FlutterTts();
await flutterTts.speak('Hallo Welt');
Doch zwei kleine Hürden galt es noch zu nehmen, bevor ich meine App sprechen hören konnte:
iOS muss erst um den Zugriff auf Audio gebeten werden. Mir hat dabei mit ein Stack Overflow-Antwort [https://stackoverflow.com/questions/50458556/flutter-swift-version-must-be-set-to-a-supported-value/52194702#52194702] geholfen. Allerding klappte es dann auch erst nach einer Rasur in der Projektstruktur: 
rm -rf ios android && flutter create -i swift .
Android hingegen verlangte nur die Festlegung auf die Mindest SDK Version 21
build.gradle: minSdkVersion 21

Alles was ich nun noch tun musste war mittels floatingActionButton den eingegebenen Text der speak Methode zu übergeben.


Die erste Erkenntnis: Meine App ist ein Amerikaner!
Kein Problem, das Flutter Text to Speech package lässt mit sich reden. Beim Initialisieren kann man neben Geschwindigkeit, Lautstärke und Pitch auch eine Sprache direkt setzen. Diese lassen sich auch im Nachhinein jederzeit ändern.
flutterTts = FlutterTts();
flutterTts.setLanguage('de-DE');
flutterTts.setSpeechRate(1.0);
flutterTts.setVolume(1.0);
flutterTts.setPitch(1.0);

Die zweite Erkenntnis: Die App will nicht unterbrochen werden!
Wiederholtes Auffordern zum Sprechen wird gewissenhaft abgearbeitet. Will heißen, drücke ich 10 Mal den Button zum Vorlesen des Wortes “Feuerwehr”, so darf ich es mir auch 10 Male in Folge anhören. Da ich mittlerweile alle Tasten sich selbst sprechen ließ, wurde diese Tugend nervig.
Gegenspieler der speak Methode ist die stop Methode. Nun kann man sich wie in der Beispielimplementierung merken, ob gerade gesprochen wird und dies stoppen oder aber der App immer dann den Mund verbieten, wenn etwas Neues gesprochen werden soll. Letzteres fand ich für meine App passend:
Future _read(String text) async {
 /// Wenn noch am Reden, dann Klappe halten!
 await flutterTts.stop();
 if (text != null && text.isNotEmpty) {
   /// Als Kleinbuchstaben aussprechen lassen, da sonst beispielsweise "Großbuchstabe X" statt nur "X" gesagt wird...
   await flutterTts.speak(text.toLowerCase());
 }
}

Die dritte Erkenntnis: Umlaute sind Zungenbrecher!
iOS und Android sprechen nicht die gleiche Sprache, daher hört man verschiedene Interpretationen gewisser Worte und besonders bei alleinstehenden Umlauten. iOS hält ein “ü” für “U-Umlaut” während Android brav ein “üüh” auspruckt. Hier kann eine Unterscheidung der Plattform helfen:
case 'Ü':
 if (Platform.isIOS) {
   _read('üh');
 } else {
   _read('ü');
 }
 break;

Die App war dann soweit und tat was sie sollte. Um sie nicht zu schnell langweilig werden zu lassen habe ich noch eine Zahlenmodus und ein Zufallswort-Button dazu gesetzt. Richtig unterhaltsam wurde sie allerdings erst als ich mit den Sprachen experimentiert hatte.
Es lassen sich über die flutterTts Instanz alle auf dem Gerät zur Verfügung stehenden Sprachen und Stimmen abrufen und einsetzen.
languages = await flutterTts.getLanguages;
voices = await flutterTts.getVoices;
Die Sprachen in bekannten Locale-Strings angegeben, aus denen sich Sprache und Land ableiten lassen. Aus der Liste von Sprachen habe ich dann noch ein Drawer zur Auswahl in der App ergänzt.


Das ginge auch mit den Verschiedenen Stimmen, doch als ich die App baute, waren diese nur für Android verfügbar. Mittlerweile unterstützt die Bibliothek auch iOS.

Fazit, es war viel zu leicht! Ich hatte nicht angenommen so schnell zu einem brauchbaren Ergebnis zu kommen. Allein für das Einbinden der TTS-Funktionalität hatte ich mit einem Tag gerechnet und vielleicht 30 Minuten gebraucht. Auch das Erstellen einer UI mit Flutter ging besser von der Hand als erwartet. Wobei ich die GridView nicht als Komponente innerhalb einer page empfehlen kann, denn diese bricht sämtliche um ihr liegenden Layout-Anweisungen.

Wer weiß ob diese App je im App-Store landen wird, auf GitHub [TODO: Link] ist sie jedenfalls zu haben.



<!-- Docs to Markdown version 1.0β17 -->
