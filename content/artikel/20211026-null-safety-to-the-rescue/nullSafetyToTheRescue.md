---
title: "Null Safety in Flutter -  Was ist es und wie geht es?"
slug: "flutter-dart-null-safety" 
date: 2021-10-26T10:00:25+02:00
draft: false
header_image: "/artikel/20211026-null-safety-to-the-rescue/19198999.jpeg"
images: ["/artikel/20211026-null-safety-to-the-rescue/19198999.jpeg"]
description: "Null Safety to the Rescue, wie nutzte ich Null Safety und was bringt es mir"
tags: ["flutter", "splash"]
categories: Anfänger * Flutter * Dart * Architecture
authors: ["marcel-ploch"]
link: 20211026-null-safety-to-the-rescue/nullSafetyToTheRescue.md
---
Mit dem Update auf Dart 2.12 wurde das null-safe type System in Flutter eingeführt.
Aber was ist das überhaupt? 
Wie verwende ich es? Und überhaupt, welche Vorteile bringt mir das Ganze?

Null safety in Dart bedeutet, dass jede Variable, die ich definiere, nicht Null sein kann, außer ich sage explizit, dass sie Null sein darf.

Damit sichere ich meinen Code ab, da nicht nur zu Compile Zeiten keine Null Fehler entstehen können, nein sogar zur Runtime können keine Null Pointer Exceptions entstehen.

Sicherer Code, sichere Welt.

Aber wie nutze ich denn dieses null safety?

Als Erstes muss ich in meiner pubpspec.yaml das SDK wie folgt einschränken:


{{<highlight yaml>}}
environment:
  sdk: ">=2.12.0 <3.0.0"
{{</highlight>}}

Ab jetzt wird mein Dart Compiler und meine Flutter SDK darauf reagieren und mir Bescheid geben, dass meine Variablen nicht null safety sind.

Aber wie behebe ich jetzt die ganzen Fehler in meinem Code?

Dazu kommen wir jetzt:

Schauen wir uns folgendes Beispiel an:

{{<highlight dart>}}
// Without null safety
main() {
  bool isStringEmpty(String string) {
    if (string.length == 0) {
      return true;
    }
    return false;
  }

  print(
    isStringEmpty(null),
  );
}
{{</highlight>}}
Dieser Code wirft eine NoSuchMethodError Exception bei dem Aufruf von `.length`, da der Compiler denkt, dass man `.length` auf ein NULL Objekt aufruft.

Wie können wir den Fehler beheben? Indem wir vorher abfragen, ob der String null ist!

{{<highlight dart>}}
// Without null safety
void main() {
  bool isStringEmpty(String string) {
    if (string != null) {
      if (string.length == 0) {
        return true;
      }
      return false;
    } else {
      throw Exception();
    }
  }

  //true
  print(isStringEmpty(""));
  //Error
  print(isStringEmpty(null));
}
{{</highlight>}}

Der Code würde funktionieren, aber ist er wirklich schön? Nein! Es gibt eine bessere Lösung! Null safety!

{{<highlight dart>}}
// With null safety
bool isStringEmpty(String? string) {
  if (string?.length == 0) {
    return true;
  }
  return false;
}

main() {
  //false
  print(isStringEmpty(null));
  //true
  print(isStringEmpty(""));
}
{{</highlight>}}

Was haben wir geändert?

Wir haben an dem Typ der Variable ein `?` hinzugefügt. Dies weist den Compiler darauf hin, dass der Wert `null` sein kann.

Für das Aufrufen der Werte müssen wir nun den Assertion Operator benutzten, damit wir dem Compiler mitteilen, dass der Inhalt der Variable sicher ist. Und so bindet man Null Safety in sein Flutter Projekt ein.
