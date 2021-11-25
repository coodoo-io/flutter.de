---
title: "Top 5 Flutter Packages, die jeder kennen sollte"
slug: "top-5-flutter-packages-die-jeder-kennen-sollte" 
date: 2021-11-24T10:00:25+02:00
draft: false
header_image: "/artikel/20211124-flutter-packages/images/header.jpg"
images: ["/artikel/20211124-flutter-packages/images/header.jpg"]
description: "Die nützlichsten Flutter Packages für App Entwickler."
tags: ["flutter", "packages"]
categories: Flutter * Packages * Anfänger
authors: ["Florian-Schmitz"]
link: 20211124-flutter-packages/20211124-flutter-packages.md
---
Flutter Packages sind eine große Unterstützung für Flutter Entwickler. Deshalb werde ich euch Packages vorstellen, die jeder kennen sollte.

## Logger
Als erstes will ich euch das [logger] (https://pub.dev/packages/logger) Package vorstellen. Mit diesem Package kann man ganz fancy log Nachrichten ausgeben. Diese können dann zum Beispiel so aussehen:
{{<figure src="/artikel/20211124-flutter-packages/images/logOutput.png" width="400">}}
Des Weiteren könntest du damit eine Logkonsole einbinden, die man mit `LogConsole.open(context)` öffnen kann.

<p float="left">
  <img src="/artikel/20211124-flutter-packages/images/logConsoleDark.png" width="300" />
  <img src="/artikel/20211124-flutter-packages/images/logConsoleLight.png" width="300" /> 
</p>

## FL Chart
Ein weiteres Package, was nicht fehlen darf, wenn du Charts anzeigen möchtest, ist das [fl_chart] (https://pub.dev/packages/fl_chart) Package. Damit kannst du relativ simple ziemlich gut aussehende Charts wie dieses hier erstellen:
{{<figure src="/artikel/20211124-flutter-packages/images/lineChartSample2.gif">}}

## Riverpod
Kommen wir zu [Riverpod] (https://pub.dev/packages/flutter_riverpod). Es verbessert dein Statemanagement und macht es meiner Meinung nach übersichtlicher. Ein Beispiel dafür wäre ein Service, der Dark bzw. Light Mode aktiviert.

{{< highlight dart >}}
class ThemeService with ChangeNotifier {
  AppTheme _theme = AppTheme.light();

  AppTheme get theme => _theme;

  void toggle() {
    _theme = _theme.mode == ThemeMode.light ? AppTheme.dark() : AppTheme.light();
    notifyListeners();
  }
}1
{{< /highlight >}}

## URL Launcher 
Auch ein sehr nützliches Packages ist das [url_launcher] (https://pub.dev/packages/url_launcher) Package. Es ist ganz einfach zu nutzen und öffnet dir zum Beispiel per Button-Click dein TikTok Profile.

{{< highlight dart >}}
const String _url = "meinTikTokAccount.com";

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: Center(
            child: RaisedButton(
              onPressed: _launchURL,
              child: Text("Zeig mein TikTok Account"),
            ),
          ),
        ),
      ),
    );

void _launchURL() async {
  if (!await launch(_url)) throw "Could not launch $_url";
}
{{< /highlight >}}

## JSON Serializable
Kommen wir zum letzten Package. Das De- und Serialisieren eines json-Strings von Hand nimmt viel Zeit in Anspruch. Deswegen gibt es das [json_serializable] (https://pub.dev/packages/json_serializable) Package. Es ist ein sehr nützliches Package, das dir sehr viel Zeit spart, indem es dir deinen benötigten Code generiert.

Welches Packages findest du noch hilfreich? Schreib mir gerne über [Slack] (https://flutter-de.slack.com/join/shared_invite/enQtNjYyODAzNDQ5MjUxLWNlOGUwNTUwMDA1ZTc2YmFlODhmMGZmMmVhOGJmYWIyYjBhYjY4Yjc5MDQ0MGJiY2ZjYTdhMzdhMDhlMTA4YjI#/shared-invite/email).