---
title: "Dart Basics - Datentypen"
slug: "dart-basics-datentypen" 
date: 2019-10-05T18:12:14+02:00
draft: false
header_image: "/artikel/20191005-dart-basics-types/images/dart-teaser.png"
images: ["/artikel/20191005-dart-basics-types/images/dart-teaser.png"]
description: "Dart Grundlagen - Datentypen"
tags: ["dart", "basics"]
categories: Anfänger * Dart
authors: ["markus-kuehle"]
link: 20191005-dart-basics-types/20191005-dart-basics-types.md
---

Dart ist eine typsichere Sprache obwohl man keinen Typ direkt angeben muss. Wie hängt das zusammen und welche Typen bringt Dart mit? In diesem Artikel geht es um die Typisierung und Datentypen von Dart 2.5.

## Statische oder dynamische Typisierung einer Variable
Dart ist entweder "stark typisiert" oder "dynamisch typisiert". Dabei unterscheidet Dart (ab Version 2) zwischen drei Zuständen:

1. `type annotated` - Der Typ der Variable, des Parameters oder der Rückgabe ist angegeben.
2. `inferred` - Es wurde kein Typ angegeben und Dart hat den Typen erfolgreich selbst herausgefunden. Kann Dart den Typen nicht erkennt wird als Fallback der `dynamic` Typ verwendet.
3. `dynamic` - Wird entweder explizit im Code angegeben oder als Fallback durch `inferred` gesetzt.

Statische Typisierung (`type annotated`) hat den Vorteil eine robuste und wartbarer Code entsteht. Aber oft ist es einfach Dopplung von Code und vermindert auch oft die Lesbarkeit z.B. bei Generics oder der Verwendung von Expressions.<br>
Beispiele für statsische Typisierung bei Variablen:
{{< highlight dart >}}
var int count = 0; // int
var string message = 'hello world'; // string
var List<int> primzahlen = [2, 3, 5, 7, 11]; // Liste von int
var Set<String> haustiere = {'Hund', 'Katze', 'Maus', 'Hase'}; // Set von strings
var bool loading = false; // bool
{{< /highlight >}}

Automatische Typisierung (`ìnferred`) hat den Vorteil unnötigen Code nicht schreiben zu müssen und auf den Augenmerk auf das eigentliche Statement oder den Programmfluss zu setzen.<br>
Beispiele für automatische Typisisierung:
{{< highlight dart >}}
var count = 0; // int
var message = 'hello world'; // string
var primzahlen = [2, 3, 5, 7, 11]; // Liste von int
var haustiere = {'Hund', 'Katze', 'Maus', 'Hase'}; // Set von strings
var loading = false; // bool
{{< /highlight >}}

Gerade bei bei Zahlen oder boolschen Werten wird schon bei diesen Beispielen klar, dass man auch ohne das beschreiben des Typs ohne Probleme erkennen würde um was für einen statischen Typ es sich handelt.

### Empfehlungen für die Vorgehensweise

Weil beide Varianten (`type annotated` und `ìnferred`) verschiedene Vorteile haben ist eine Mischung daraus empfehlenswert. Dart selbst trifft folgende Aussagen:

*  Verwende statische Typen (`type annotated`) wenn es um öffentliche Attribute oder Parameter bei Methoden und Top-Level Attribute in Klassen geht bei denen der Typ nicht direkt und klar ersichtlich ist. (<a href="https://dart.dev/guides/language/effective-dart/design#prefer-type-annotating-public-fields-and-top-level-variables-if-the-type-isnt-obvious" target="_blank">Doku</a>)
*  Ziehe in Betracht statische Typen zu verwenden wenn es sich um private Attribute und Top-Level Variablen handelt deren Typ nicht direkt zu erkennen ist. (<a href="https://dart.dev/guides/language/effective-dart/design#consider-type-annotating-private-fields-and-top-level-variables-if-the-type-isnt-obvious" target="_blank">Doku</a>)
*  Verwende automatische Erkennung (`ìnferred`) bei Variablen innerhalb von Methoden. (<a href="https://dart.dev/guides/language/effective-dart/design#avoid-type-annotating-initialized-local-variables" target="_blank">Doku</a>)
*  Verwende implizite Typisierung bei Function Expressions, weil der Typ in der Regel durch die Liste oder Map außerhalb bereits bekannt ist. Ist dies nicht der Fall verwende auch in der Expression den statischen Typ um Klarheit zu schaffen. (<a href="https://dart.dev/guides/language/effective-dart/design#avoid-annotating-inferred-parameter-types-on-function-expressions" target="_blank">Doku</a>)
*  Verwende keine doppelten Typ-Angaben bei generischen Aufrufen (Generics). Ist der Typ der Variable nicht klar darf bei dem Generics der Typ angegeben werden. Der statische Typ sollte hier nicht doppelt angegeben werden. (<a href="https://dart.dev/guides/language/effective-dart/design#avoid-redundant-type-arguments-on-generic-invocations" target="_blank">Doku</a>)
*  Wird der Typ bei der automatischen Erkennung durch Dart falsch erkannt sollte der Typ direkt angegeben werden. Das passiert unter anderem dann wenn der Supertyp verwendet werden soll und Dart immer den direkten Typ erkennt (z.B. `double` anstatt `number`). (<a href="https://dart.dev/guides/language/effective-dart/design#do-annotate-when-dart-infers-the-wrong-type" target="_blank">Doku</a>)
*  Verwende `dynamic` wenn klar ist, dass die automatische Erkennung durch Dart fehlschlagen wird. Dadurch wird klarer das manche Teile des Codes einfach nicht typsicher sind und das dem Entwickler klar ist.

## Von Dart vorgegebene Datentypen
Dart ist eine typisierte Sprache und unterstützt folgende Datentypen:

*  Numbers (Integer, Double)
*  Strings
*  Boolean
*  Lists (Arrays)
*  Maps
*  Runes
  
**Jeder Datentyp ist ein Objekt**

In Dart ist alles ein Objekt, auch wenn der Datentyp wie z.B. `num` oder `bool` klein geschrieben werden (Java Entwickler kennen das als primitiven Datentypen, welcher kein Objekt ist). Und weil jeder Datentyp ein Objekt ist, ist auch der Wert ohne Initialisierung immer `null`. Im Umkehrschluss ist eine `null`-Initialisierung auch nicht notwendig, zählt sogar als schlechter Stil.

Bei `int`, `double` und `bool` sollte man generell darauf verzichten `null` Werte zu setzen, weil man bei diesen Typen immer einen Wert erwartet. In seltenen Ausnahmen kann es aber auch von Vorteil sein, dass ein `bool` mal den Wert `null` hat. Sollte dies vorkommen sollte es auch klar dokumentiert sein unter welchen Umständen die Rückgabe hier `null` ist.

### Integer
Ein Integer repräsentiert eine ganze Zahl ohne Kommastelle. Die Implementierung von `int` ist (seit Dart 2.0) ein 64bit Integer als Zweierkomplement. Der Wertebereich von int ist davon abhängig, ob es in der DartVM (-2⁶³ to 2⁶³-1) oder im Browser als Javascript (-2⁵³ to 2⁵³-1) ausgeführt wird. 

{{< highlight dart >}}
int answer = 42;
{{< /highlight >}}

Bei sich aus dem Wert erschließenden Typen ist es guter Stil den Typ nicht mit anzugeben, was bei Zahlen fast immer der Fall ist.
Ein Integer ist immer eine Zahl ohne Kommastelle:
{{< highlight dart >}}
answer = 42;
{{< /highlight >}}


<a href="https://api.dartlang.org/stable/2.5.1/dart-core/int-class.html" target="_blank">API Doc - int</a>

### Double
Gleitkommazahlen werden in Dart mit dem Datentyp `double` repräsentiert. Dart doubles sind 64-bit floating-point Zahlen, wie sie im <a href="https://de.wikipedia.org/wiki/IEEE_754" target="_blank">IEEE 754 Standard</a> repräsentiert werden.
Auch bei einem Double kann man in der Regeln den Typen weglassen. Hier gilt: es ist ein Double sobald es eine Nachkommastelle besitzt.
{{< highlight dart >}}
answer = 42.42;
double exponents = 1.42e5;
{{< /highlight >}}
<a href="https://api.dartlang.org/stable/2.5.1/dart-core/double-class.html" target="_blank">API Doc - double</a>


### Strings
Strings werden nahezu immer verwendet um Text darzustellen. In Dart besteht ein String aud UTF-16 Zeichen.<br>
Strings können mit einfach oder doppelten Anführungszeichen angegeben werden:
{{< highlight dart >}}
var text1 = 'Die Antwort ist 42';
var text2 = "Die Antwort ist 42";
{{< /highlight >}}

Um einen String über mehrere Zeilen schreiben zu können, kann er in der dreifachen Variante von einfachen oder doppelten Anführungszeichen definiert werden:
{{< highlight dart >}}
var text1 = '''
Die Antwort auf die Frage 
nach dem Leben, dem Universum und dem ganzen Rest
lautet 42.
''';
{{< /highlight >}}
<a href="https://api.dart.dev/stable/2.5.1/dart-core/String-class.html" target="_blank">API Doc - String</a>

### Boolean
Um Booleans zu repräsentieren hat Dart die Klasse `bool`. Die zwei Konstanten und reservierten Wörter `true`und `false` sind vom Typ `bool`. Bei Booelans ist eine Angabe des Typs nicht notwendig.
{{< highlight dart >}}
var bool loading = true;
var waiting = false;
{{< /highlight >}}
<a href="https://api.dart.dev/stable/2.5.1/dart-core/bool-class.html" target="_blank">API Doc - bool\<E\></a>

### Lists
Eine Liste ist ein Sammlung von Objekten, die über einen Index aufgerufen werden können. Der Type `List\<E\>' ist per Default eine wachsende dynmische Liste.
{{< highlight dart >}}
var List<int> wichtigeZahlen = [1, 2, 3, 4];
var wichtigeZahlen2 = <int>[5, 6, 7, 8]; 
{{< /highlight >}}
<a href="https://api.dart.dev/stable/2.5.1/dart-core/List-class.html" target="_blank">API Doc - List\<E\></a>

### Maps
Eine Map enthält eine beliebige Anzahl an Keys und zu jedem Key ein Objekt. An das Objekt gelangt man dabei nur über den Key. Es können über die Keys und Values iteriert werden. Dabei definiert die Implementierung der Map, wie z.B. HashMap oder LinkedHashMap die Reihenfolge der Keys.
{{< highlight dart >}}
var hexFarben = {
  'rot': '0000FF',
  'grün': '#00FF00',
  'blau': '#0000FF'
};
{{< /highlight >}}
<a href="https://api.dart.dev/stable/2.5.1/dart-core/Map-class.html" target="_blank">API Doc - Map\<K,V\></a>

### Runes
Runes sind UTF-32 Beschreibungen eines Strings. So kann auch in Dart, welches Strings mit UTF-16 Zeichen beschreibt, auch Unicode geschrieben werden. Um Runes in einem String schreiben zu können bedarf es einer speziellen Syntax:
{{< highlight dart >}}
var klatschen = '\u{1f44f}'; // 👏

Runes input = new Runes('\u{1f600}' '\u{1f499}' '\u{1f44d}');
print(new String.fromCharCodes(input)); // 😀💙👍
{{< /highlight >}}
Wer Runes live ausprobieren möchte hier der [Link zum Dartpad](https://dartpad.dartlang.org/c4b17c3cf504ce29ec3713e8af8f742f) und die notwendige [Unicode Emoji Liste](https://unicode.org/emoji/charts/full-emoji-list.html#1f600).
<a href="https://api.dart.dev/stable/2.5.1/dart-core/Runes-class.html" target="_blank">API Doc - Runes\<K,V\></a>
