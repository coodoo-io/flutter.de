---
title: "Formulare in Flutter (Teil 1)"
slug: "flutter-formulare" 
date: 2020-04-02T12:46:56+02:00
draft: false
header_image: "/artikel/20200405-flutter-formulare/images/abstract_formfields.png"
images: ["/artikel/20200405-flutter-formulare/images/abstract_formfields.png"]
description: "Dieses Flutter Tutorial auf deutsch erklärt, wie man Formulare in Flutter erstellt."
tags: ["flutter-formulare","flutter","Formulare"]
categories: Anfänger * Formulare
authors: ["tristan-schuller"]
link: 20200405-flutter-formulare/flutter-formulare.md
author: Tristan Schuller
---

Formulare erstellen ist wie die Steuererklärung machen — nicht super aufregend, aber besser, man weiß wie es geht. In diesem einführenden Flutter Artikel auf deutsch zeige ich euch, wie ihr mit wenig Aufwand ein Formular mit unterschiedlichen Arten von Text-Feldern erstellen könnt.

Wenn wir fertig sind, soll das Formular so aussehen:

{{< figure src="/artikel/20200405-flutter-formulare/images/pic_01.png" width="420">}}

# 1. Das Projekt vorbereiten

Zuerst wollen wir das Grundgerüst unseres Formulars erstellen.
Dazu legen wir in einem leeren Ordner in dem Terminal eurer Wahl ein neues Flutter-Projekt mit dem Befehl `$flutter create form` an. Wenn ihr vergessen habt, wie man Flutter einrichtet, um neue Projekte auf der Kommandozeile anlegen zu können, dann lest euch am besten nochmal unseren Artikel <a href="https://flutter.de/artikel/flutter-entwicklungsumgebung-einrichten.html" target="_blank" title="Flutter First Steps">Flutter First Steps</a> durch.

Wir entfernen alles aus dem soeben erstellten Standard-Projekt, das wir nicht brauchen.

*Datei: main.dart*
{{< highlight dart >}}
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyFormPage(title: 'Flutter Formular'),
    );
  }
}

class MyFormPage extends StatefulWidget {
  MyFormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Hier wird unser Formular gebaut.
        ],
      ),
    );
  }
}
{{< /highlight >}}

Unser Rahmen ist nun fertig. Das Formular wird im nächsten Schritt in der `build()`-Methode der `_MyFormPageState`-Klasse gebaut.

# 2. Das Formular bauen

Welche Widgets brauchen wir?

### Form

Das *Form* Widget dient als *optionaler* Rahmen für alle Formularfelder, die wir benutzen wollen. Wir nutzen dieses Widget, um unser Formular übersichtlicher zu machen und um die spätere Validierung zu vereinfachen. <a href="https://api.flutter.dev/flutter/widgets/Form-class.html" target="_blank" title="Das Form Widget">api.flutter.dev/flutter/widgets/Form-class</a>

Wir wrappen das Column Widget nun in das Form Widget und fügen zusätzlich noch eine GlobalKey `_formKey` Variable in der Klasse hinzu. Dieser `key` wird nun dem *Form* Widget hinzugefügt. Dieser wird später für die Validierung aller darin enthaltenen Formularfelder benötigt.

{{< highlight dart >}}
class _MyFormPageState extends State<MyFormPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
{{< /highlight >}}


### FormField

Laut offizieller Doku soll jedes Feld eines Formulars in ein *FormField* Widget eingepackt werden. Dies ermöglicht später z.B. eine visuelle Rückmeldung bei Fehlern in der Validierung für jedes einzelne Formularfeld <a href="https://api.flutter.dev/flutter/widgets/FormField-class.html" target="_blank" title="Das FormField Widget">api.flutter.dev/flutter/widgets/FormField-class</a>. Dieses Widget werden wir in diesem Tutorial allerdings nicht brauchen, da es hierfür das nächste Widget gibt. 

### TextFormField

Das *TextFormField* Widget ist eigentlich ein *FormField*, in dem ein *TextField* eingebettet ist. Da Textfelder in Formularen sehr häufig verwendet werden, gibt es dieses kombinierte Widget: <a href="https://api.flutter.dev/flutter/material/TextFormField-class.html" target="_blank" title="Das TextFormField Widget">api.flutter.dev/flutter/material/TextFormField-class</a>

Innerhalb des *Column* Widgets können wir nun untereinander alle Felder einbauen, die wir brauchen. Wir legen also fünf *TextFormField* Widgets an.
Wir möchten die Eingabefelder:

*   Benutzername
*   E-Mail
*   Passwort
*   Lieblingszahl 
*   Freitext

 Zusätzlich packen wir die *Column* noch in ein *Padding* und geben damit dem Formular etwas Abstand zu allen Seiten. Zwischen den Feldern möchten wir auch einen Abstand haben. Hier im Beispiel packen wir einfach *SizedBox* Widgets mit einem Wert für die Höhe jeweils zwischen unsere Felder.

{{< highlight dart >}}
Form(
  key: _formKey,
  child: Padding(
    padding: const EdgeInsets.all(50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextFormField(),
        SizedBox(height: 20),
        TextFormField(),
        SizedBox(height: 20),
        TextFormField(),
        SizedBox(height: 20),
        TextFormField(),
        SizedBox(height: 20),
        TextFormField(),
      ],
    ),
  ),
),
{{< /highlight >}}


Als nächstes wollen wir die Textfelder noch etwas benutzerfreundlicher machen. Wir fügen einen Rahmen in `border:` und einen Platzhaltertext in `labelText:` hinzu. Dies erledigen wir in einem *TextFormField* alles innerhalb von `decoration:`.


**Benutzername:**
Damit sich auf dem Gerät die richtige Tastatur öffnet (Text, Zahlen), kann man den `keyboardType:` einstellen. In unserem Fall bekommt das Benutzername Feld den Wert *TextInputType.text*, welcher aber auch als Standard auf einem *TextFormField* gesetzt ist.
In unserem Benutzername Feld würde es stören, wenn die Autokorrektur angeschaltet wäre. Dafür gibt es die `autocorrect:` Einstellung, die wir in diesem Fall auf *false* setzen.
{{< highlight dart >}}
TextFormField(
  keyboardType: TextInputType.text,
  autocorrect: false,
  decoration: InputDecoration(
    labelText: 'Benutzername',
    border: OutlineInputBorder(),
  ),
),
{{< /highlight >}}

**E-Mail:**
Für E-Mail Felder soll die Tastatur mit direkt angezeigtem @-Symbol aufgehen. Dafür wird der `keyboardType:` auf *TextInputType.emailAddress* gesetzt.
{{< highlight dart >}}
TextFormField(
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: 'E-Mail',
    border: OutlineInputBorder(),
  ),
),
{{< /highlight >}}

**Passwort:**
Bei einem Passwort Feld möchten wir, dass während der Eingabe die Symbole verschleiert werden, dafür gibt es die passende Einstellung `obscureText: true`.
{{< highlight dart >}}
TextFormField(
  obscureText: true,
  decoration: InputDecoration(
    labelText: 'Passwort',
    border: OutlineInputBorder(),
  ),
),
{{< /highlight >}}

**Lieblingszahl:**
Für Felder bei denen die Zahlen-Tastatur aufgehen soll, wird der `keyboardType:` auf *TextInputType.number* gestellt. Dann möchten wir noch, dass es nur erlaubt ist Zahlen in dieses Feld einzutragen. Hierfür gibt es die `inputFormatters:`. Damit diese funktionieren müsst ihr noch etwas in euer Projekt importieren: `import 'package:flutter/services.dart';`.
{{< highlight dart >}}
TextFormField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    labelText: 'Lieblingszahl',
    border: OutlineInputBorder(),
  ),
  validator: zahlValidator,
  inputFormatters: <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly,
  ],
),
{{< /highlight >}}

**Freitext:**
Für Felder, in denen viel Text eingegeben werden kann, können wir die Anzahl der Zeilen durch `maxlines:` und optional auch eine maximale Zeichenanzahl erlauben und unter dem Textfeld anzeigen lassen. Dies macht man mit der `maxLength:`.
{{< highlight dart >}}
TextFormField(
  maxLines: 5,
  maxLength: 120,
  decoration: InputDecoration(
    hintText: 'Freitext',
    border: OutlineInputBorder(),
  ),
),
{{< /highlight >}}

### RaisedButton

Nun fügen wir noch zwei Buttons hinzu, um die Eingaben später aus dem Formular speichern oder löschen zu können. Wir fügen also eine *Row* ein, in die wir die zwei *RaisedButton* Widgets mittig einfügen.

{{< highlight dart >}}
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    RaisedButton(
      onPressed: () {},
      child: Text('Löschen'),
    ),
    SizedBox(width: 25),
    RaisedButton(
      onPressed: () {},
      child: Text('Speichern'),
    )
  ],
)
{{< /highlight >}}

Unter `onPressed:` werden wir im *Schritt 4* die Methoden zur Validation und zum Löschen der Daten einfügen.

# 3. Validatoren hinzufügen

Um ein Formular auf Korrektheit prüfen zu können, müssen wir nun für jedes Feld eines Formualrs – in unserem Fall die fünf Textfelder – einen Validator hinzufügen. In diesem berechnen wir, ob eine Eingabe korrekt ist.

**Benutzername**: Wir möchten, dass unser Benutzername Feld nicht leer sein darf, wenn wir das Formular validieren. Hierfür schreiben wir eine kleine Funktion in den `validator:`.

{{< highlight dart >}}
TextFormField(
  keyboardType: TextInputType.text,
  autocorrect: false,
  decoration: InputDecoration(
    labelText: 'Benutzername',
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value.isEmpty) {
      return 'Bitte einen Benutzernamen eingeben';
    }
    return null;
  },
)
{{< /highlight >}}

Drückt ihr nun, nachdem ihr *Schritt 4* beendet habt, auf den "Speichern" Button, und das Benutzername Feld ist leer, dann seht ihr die Fehlermeldung, die wir im Validator definiert haben.
{{< figure src="/artikel/20200405-flutter-formulare/images/pic_02.png" width="420">}}

**Lieblingszahl**: Nehmen wir an, ihr habt Formularfelder, die etwas aufwändiger geprüft werden müssen (Das ist ja öfter der Fall). Hierzu empfiehlt es sich, so wie eigentlich immer, die Validierungsfunktion auszulagern. Das macht den Code lesbarer und auch wiederverwendbarer.

Das Feld der Lieblingszahl soll zum Beispiel nur als korrekt gelten, wenn die eingegebene Zahl *ungerade* ist. Wir schreiben eine Validierungsmethode `lieblingszahlValidator()` und fügen diese in den `validator:` des Feldes ein. Diese Methoden zum Validieren können wir zum Beispiel einfach in die `_MyFormPageState` Klasse einfügen. Es geht hier hauptsächlich um die Lesbarkeit.

Beispiel für einen Validator (innerhalb der `_MyFormPageState` Klasse), der prüft, ob die Eingabe eine ungerade Zahl ist:
{{< highlight dart >}}
String zahlValidator(value) {
  num zahl = int.parse(value as String);
  if (zahl % 2 == 0) {
    return 'Es sind nur ungerade Zahlen erlaubt';
  }
  return null;
}
{{< /highlight >}}

Unseren Validator `zahlValidator()` könnt ihr jetzt benutzen.

{{< highlight dart >}}
TextFormField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    labelText: 'Lieblingszahl',
    border: OutlineInputBorder(),
  ),
  validator: zahlValidator,
  inputFormatters: <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly,
  ],
),
{{< /highlight >}}

# 4. Das Formular validieren oder löschen

Nun werden wir Funktionen zum Validieren und Löschen der Daten in die zwei Buttons einbauen, die wir am Ende von *Schritt 2* angelegt haben.
In dem "Speichern" Button wird die `validate()` Methode auf den `currentState` unseres `_formKey` ausgeführt und damit alle Validatoren, die wir in *Schritt 3* auf die Textfelder gelegt haben, ausgewertet.

Der Button zum Löschen löst, wie beim Speichern, eine Methode auf dem `_formKey.currentState` aus, nämlich `reset()`.

Die zwei *RaisedButton* Widgets sehen danach so aus:
{{< highlight dart >}}
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    RaisedButton(
      color: Colors.grey,
      textColor: Colors.white,
      onPressed: () {
        // reset() setzt alle Felder wieder auf den Initalwert zurück.
        _formKey.currentState.reset();
      },
      child: Text('Löschen'),
    ),
    SizedBox(width: 25),
    RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        // Wenn alle Validatoren der Felder des Formulars gültig sind.
        if (_formKey.currentState.validate()) {
          print("Formular ist gültig und kann verarbeitet werden");
          // Hier können wir mit den geprüften Daten aus dem Formular etwas machen.
        } else {
          print("Formular ist nicht gültig");
        }
      },
      child: Text('Speichern'),
    )
  ],
)
{{< /highlight >}}

## Der komplette Code unseres Formulars

main.dart
{{< highlight dart>}}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFormPage(title: 'Flutter Formular'),
    );
  }
}

class MyFormPage extends StatefulWidget {
  MyFormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Benutzername',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Bitte einen Benutzernamen eingeben';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Passwort',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Lieblingszahl',
                      border: OutlineInputBorder(),
                    ),
                    validator: zahlValidator,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    maxLines: 5,
                    maxLength: 120,
                    decoration: InputDecoration(
                      hintText: 'Freitext',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        onPressed: () {
                          // reset() setzt alle Felder wieder auf den Initalwert zurück.
                          _formKey.currentState.reset();
                        },
                        child: Text('Löschen'),
                      ),
                      SizedBox(width: 25),
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          // Wenn alle Validatoren der Felder des Formulars gültig sind.
                          if (_formKey.currentState.validate()) {
                            print("Formular ist gültig und kann verarbeitet werden");
                          } else {
                            print("Formular ist nicht gültig");
                          }
                        },
                        child: Text('Speichern'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  String zahlValidator(value) {
    num zahl = int.parse(value as String);
    if (zahl % 2 == 0) {
      return 'Es sind nur ungerade Zahlen erlaubt';
    }
    return null;
  }
}
{{< /highlight >}}

#### Was haben wir also gelernt?
Wir können jetzt ein einfaches Formular mit Flutter bauen, der Textfelder mit speziellen Eigenschaften enthält und die durch Validatoren geprüft werden können.

Über noch etwas komplexere Elemente wie z.B. Checkboxen oder Toggle Elemente und was eigentlich Controler sind, erfährst du bald mehr in **Teil 2**!

<div class="alert alert-info">Hinweis: Wenn du jetzt sofort noch mehr über Formulare lernen möchtest, dann lies dir hierzu die aktuelle <a href="https://flutter.dev/docs/cookbook/forms" target="_blank" rel="noopener">Flutter Dokumentation</a> durch. Hier erfährst du alles, was wir in diesem Artikel nicht behandeln konnten.</div>
<br />
{{< button href="https://github.com/coodoo-io/flutter-samples/tree/master/012-flutter-forms" class="btn btn-primary" target="_blank" rel="noopener">}}Das Projekt auf Github ansehen{{< /button >}}