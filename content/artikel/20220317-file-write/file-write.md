---
title: "Daten auf einem Smartphone speichern mit Flutter"
slug: "flutter-how-to-write-files" 
date: 2022-03-17T08:00:25+02:00
draft: false
header_image: "/artikel/20220317-file-write/header.jpg"
images: ["/artikel/20220317-file-write/header.jpg"]
description: "Wie man mit Hilfe von Boardmitteln und Plugins einfach Dateien schreiben kann"
tags: ["flutter", "howto", "beginner", "files"]
categories: Flutter * How-To * Beginner * Files
authors: ["marcel-ploch"]
link: 20220317-file-write/file-write.md
---

Als Entwickler steht man immer wieder vor dem Problem, Daten in Dateien schreiben oder aus Dateien lesen zu müssen. Dies tritt insbesondere auf, wenn Informationen nur zwischengespeichert werden müssen. So zum Beispiel, wenn der Status der Anwendung gesichert werden soll oder wenn die Anwendungen offlinefähig gemacht wird, um die Eingaben des Users erst später mit einer Web API zu synchronisieren.

Gerade im Mobile Bereich stellt sich also oft die Frage, wo und wie man Dateien auf einem Gerät ablegen kann. Denn sowohl Android als auch iOS bieten verschiedene Lösungen an, die man auch mit Flutter implementieren kann.

Aber wie funktioniert das Ganze denn nun mit Flutter und ist es auch sicher?

## Wie schreibe / lese ich Daten in den /aus dem Speicher

Mit dem package [path_provider](https://pub.dev/packages/path_provider) bekommen wir Hilfe, da dieses und den Pfad auf den verschiedenen Geräten ausgibt.

Folgender Code verdeutlicht, wie wir mit Hilfe des Packages an den lokalen Pfad kommen.

```Flutter
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Muss installiert werden

Future<String> get _localPath async {
   final directory = await getApplicationDocumentsDirectory(); // aus dem Path Provider Package
   return directory.path;
 }

 Future<File> _localFile({required String name}) async {
   final path = await _localPath;
   return File('$path/$name');
 }

```


**Wichtig!!** In das Verzeichnis `getApplicationDocumentsDirectory` und `getTemporaryDirectory` kann man sowohl unter Android als auch IOs einfach schreiben und lesen ohne Berechtigungen vom User zu erfragen.

Zum Lesen von Dateien erzeugen wir aus dem Pfad ein File Objekt und lesen die Datei mit der `readAsString() ` Methode aus.

```Flutter
Future<void> readQrCodeList() async {
   try {

     final File file = (await _localFile(name: 'data.json'));
     // Read the file
     final contents = await file.readAsString();
     
     List<dynamic> map = jsonDecode(contents);
     map.forEach((value) {
       QrCodeModel().addElementToList(QrCodes.fromJson(value));
     });
     return;
   } ... 
 }

```

Zum Schreiben können wir ein ähnliches Verhalten nutzen:
Mit der Methode `writeAsString` können wir einen String in das Dateisystem schreiben.

```Flutter
Future<void> writeData() async {
   final file = (await _localFile(name: 'data.json'));
   
   List<QrCodes> codes = await QrCodeModel().getElements();
   
   String data = jsonEncode(codes.map((e) => e.toJson()).toList());
   // Write the file
   
   file.writeAsString(data);
   return;
 }

```

Was ist denn nun aber, wenn wir Dateien in das Nutzerverzeichnis schreiben wollen?

Z.B. wenn wir User-generierten Content sichern möchten oder Exporte aus den Daten für den User auf seinem Mobilen Endgerät sichern wollen.

## Wie schreibe oder lese ich Daten in das / aus dem User Verzeichnis.

Wie wir oben bereits gelesen haben, benötigen wir für die internen App Verzeichnisse keine Berechtigung. Wenn wir aber in den öffentlichen Space des Users schreiben möchten, müssen wir den User um Erlaubnis bitten. Dies betrifft nur Android Devices. 

Für iOS wird hier ein shared place im ApplicationDocumentDirectory eingerichtet. Dazu müssen wir nur in der Plist File im Verzeichnis `your_app/ios/Runner.xcworkspace` die Einträge für `UIFileSharingEnabled` und `LSSupportsOpeningDocumentsInPlace` hinzufügen und auf YES stellen. Hierbei ist zu beachten, dass man keine sensitiven Daten in das Application Verzeichnis ablegen sollte.

Da es aber bei Android mehr zu beachten gibt, wollen wir uns das Ganze im Folgenden noch anschauen.

### 1. Schritt Android

Zunächst müssen wir die Rechte in der Android `manifest.xml` hinzufügen:

Diese sind: 

* `<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>`

* `<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>`

### 2. Schritt 

Mit Hilfe der Packages

* [android_external_storage](https://pub.dev/packages/android_external_storage/score)
* [permission_handler](https://pub.dev/packages/permission_handler)

bekommen wir die Pfade zu den öffentlichen Verzeichnissen und können auch direkt das Recht für den User abfragen.

### 3. Schritt Code

Wenn wir die Permissions hinzugefügt haben und die Packages installiert sind, geht es ans Coden.

Zunächst prüfen wir beim User, ob wir überhaupt das Recht haben, Dateien zu lesen oder zu schreiben.

Dies geht einfach mit folgendem Code:

```Flutter
await Permission.storage.request().isGranted
```

Hier fragen wir systemseitig ab, ob der User uns die Permission zum Schreiben und Lesen gegeben hat. Auch bekommen wir direkt das passende System Overlay.

Mit dem Package für External Storage bekommen wir dann den passenden Pfad:

```Flutter
try {
     path = await AndroidExternalStorage.getExternalStoragePublicDirectory(DirType.downloadDirectory); } on PlatformException {
     path = 'Failed to get Storage Path.';
   }

```

Zum Schluß können wir, wie auch schon im App-internen Bereich, einfach ein File Objekt erzeugen und einen String schreiben:

Hierzu das komplette Listing:

```
   String? path;
   try {
     path = await AndroidExternalStorage.getExternalStoragePublicDirectory(DirType.downloadDirectory); } on PlatformException {
     path = 'Failed to get Storage Path.';
   }
   if (await Permission.storage.request().isGranted) {
     ... 
     String csv = const ListToCsvConverter().convert(rows);
     File f = File(path! + "/filename.csv");
     f.writeAsString(csv);
   }

```

Somit haben wir eine einfache Lösung geschaffen, um Dateien für unsere App intern zu schreiben oder auch diese für den User öffentlich zu machen.

Und nun Happy Coding!!!