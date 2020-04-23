---
title: "Internationalization in Flutter"
slug: "leichte-internationalization-in-flutter" 
date: 2019-07-30T07:25:24+02:00
draft: false
header_image: "/artikel/20190730-internationalization/images/internationalization.jpg"
images: ["/artikel/20190730-internationalization/images/internationalization.jpg"]
description: "Übersetzungen in Flutter müssen nicht schwer sein. Wie du deine App stressfrei in Flutter übersetzt"
tags: ["internationalization","übersetzung","fortgeschrittene"]
categories: Fortgeschrittene * Accessibility * Sprache
authors: ["Tobias Mautes"]
link: 20190730-internationalization/20190730-internationalization.md
---

Flutter lernen ist sehr einfach. Und so schön und leicht Flutter auch zu benutzen ist, so habe ich doch verzweifelt nach einer einfachen Lösung für ein wichtiges Problem gesucht: Internationalization. Das Framework hat leider noch keine eigene Art und Weise wie das zu lösen ist und überlässt es dem Nutzer, mit der Dart Variante klarzukommen, welche... ein wenig kompliziert zu verstehen ist.

Nach langer Suche habe ich jedoch einen schnellen und einfachen Weg gefunden eine Flutter-App zu übersetzen.

### Voraussetzung

Für diesen Weg verwende ich ein Plugin für VisualStudioCode. Dementsprechend brauchst du diese Entwicklungsumgebung für dieses Tutorial. Allerdings gibt es auch ein ähnliches [Plugin](https://plugins.jetbrains.com/plugin/10128-flutter-i18n) für Android Studio.

### Plugin installieren

Zuallererst installierst du folgendes [Plugin](https://marketplace.visualstudio.com/items?itemName=esskar.vscode-flutter-i18n-json).

Alternativ kannst du in Code auch einfach nach `vscode-flutter-i18n-json` suchen:

{{< figure src="20190730-internationalization/images/marketplace.png" >}}

### Initialisieren

Nun rufst du die sogenannte Workbench auf, um Code-Befehle auszuführen. Standardmäßig ist das `Ctrl/Meta/Cmd+Shift+P` oder einfach nur `F1`.

{{< figure src="20190730-internationalization/images/workbench.png" >}}

Wichtig ist hier, dass ganz am Anfang das `>` steht, da Code sonst versucht eine Datei mit dem Namen zu öffnen, anstatt einen Befehl auszuführen.

Dort gibst du `Flutter I18n Json: Initialize` ein und danach den Regionscode für die Sprache, welche standardmäßig verwendet werden soll. Alternativ kannst du auch nichts eingeben und `enter` drücken, wenn du en-US als Standard haben möchtest. 

Das GIF des Pluginerstellers zeigt sehr gut wie das abläuft:

{{< figure src="https://raw.githubusercontent.com/esskar/vscode-flutter-i18n-json/master/images/extension_init.gif" >}}

### Region hinzufügen

Internationalization macht wenig Sinn, wenn man nur eine Sprache/Region unterstützt. Also fügen wir eine weitere Region hinzu. Dafür hat das Plugin auch einen Befehl, welcher `Flutter I18n Json: Add locale` heißt. Nach Eingabe dessen musst du wieder einen Regionscode angeben.

##### Hinweis zur Verwendung unter iOS

Für die iOS Entwicklung muss momentan die `info.plist`, die unter `/ios/runner/info.plist` zu finden ist, bearbeitet und der folgende `key` mit einem `array`, das alle unterstützten Sprachen enthält, hinzugefügt werden:

{{< highlight xml >}}
<key>CFBundleLocalizations</key>
  	<array>
    <string>en</string>
    <string>de</string>
  	</array>
{{< /highlight >}}

### Übersetzungen bearbeiten

Die Übersetzungsdateien für jede Sprache sollten nun im i18n Ordner liegen:

{{< figure src="20190730-internationalization/images/folder.png" >}}

In diesen Dateien kannst du deine Übersetzungen mit Schlüssel-Wert Paaren hinzufügen. Dabei ist der erste String die Variable, mit der du die Übersetzung abrufst und der zweite String, was in der Stelle ausgegeben wird. Zudem kannst du mit geschwungenen Klammern ( `{}` ) Werte in den ausgegebenen Text einfügen, die du später erst kennst, z.B.: der Name eines Nutzers.

{{< highlight json >}}
{
    "greetTo": "Hallo {name}",
    "test": "Dies ist eine Testnachricht",
    "title": "Internationalization Beispiel"
}
{{< /highlight >}}

Ein wichtiger Schritt bevor die Änderungen auch wirklich übernommen werden: nach dem Speichern musst du die Code Toolbox öffnen und `Flutter I18n Json: Update` ausführen.

### Übersetzungen abrufen

Um die Übersetzungen zu verwenden, musst du in die `pubspec.yaml` gehen und das `flutter_localizations` package hinzufügen:

{{< highlight yml >}}
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
{{< /highlight >}}

Das wird benötigt, um manche Standard Widgets automatisch zu übersetzen und ohne bekommt man in manchen Fällen Fehler. Danach nur noch in die `main.dart` gehen und folgende Dinge hinzufügen: 

{{< highlight dart >}}
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;

    return MaterialApp(
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback: i18n.resolution(
        fallback: new Locale("en", "US"),
      ),
{{< /highlight >}}

Wobei du bei `fallback` deine standard Region angibst.

Danach kannst du überall in deiner App die generierte I18n Klasse importieren und die Übersetzung abrufen. Wenn du Variablen in deiner Übersetzung hast, kannst du in Klammern die einzusetzenden Werte angeben.

{{< highlight dart >}}
import 'package:internationalization/generated/i18n.dart';

return Scaffold(
      appBar: AppBar(
        title: Text(I18n.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              I18n.of(context).test,
            ),
            Text(
              I18n.of(context).greetTo('Tobias'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
{{< /highlight >}}

### Beispiel

{{< figure src="20190730-internationalization/images/comparison.png" width="750" >}}



### Zusammenfassung

##### Einrichten

1.    VS Code Plugin installieren
2.    `Flutter I18n Json: Initialize` ausführen
3.    Gewünschte Regionen mit `Flutter I18n Json: Add locale` hinzufügen
4.    Sprachkürzel in der Konfigurationsdatei vom iOS Runner angeben
5.    `flutter_localizations` package hinzufügen und delegates in der `main.dart` angeben

##### Übersetzungen erweitern und verwenden

1.    Die jeweiligen `.json` Dateien im `i18n` Ordner öffnen und Schlüssel-Wert Paare hinzufügen
2.    Speichern und `Flutter I18n Json: Update` ausführen
3.    Die generierte `I18n.dart` importieren und die Übersetzung mit `I18n.of(context).übersetzungsschlüssel` oder `I18n.of(context).übersetzungsschlüssel("eingesetzter wert")` abrufen.

Das Plugin macht das Ganze also zu einem viel schmerzloseren Prozess, als das manuelle Einpflegen der ganzen Übersetzungen und Erweitern der Klasse. Hoffentlich legt Google aber mit einer Methode nach, die einfacher zu verwenden ist und vom Framework offiziell unterstützt wird.

<a href="https://github.com/coodoo-io/flutter-internationalization" class="btn btn-primary" target="_blank" rel="noopener">Das Projekt auf Github ansehen</a>