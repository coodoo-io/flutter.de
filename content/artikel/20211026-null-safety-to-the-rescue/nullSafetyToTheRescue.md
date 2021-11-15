---
title: "Nullsafety first - wie geht das eigentlicht und was ist es"
slug: "flutter-dart-null-safety" 
date: 2021-10-26T10:00:25+02:00
draft: false
header_image: "/artikel/20211026-null-safety-to-the-rescue/images/handshake-3382503_1920.jpg"
images: ["/artikel/20211026-null-safety-to-the-rescue/images/handshake-3382503_1920.jpg"]
description: "Null Safety to the Rescue, wie nutzte ich Null Safety und was bringt es mir"
tags: ["flutter", "splash"]
categories: Anfänger * Flutter * Dart * Architecture
authors: ["marcel-ploch"]
link: 20211026-null-safety-to-the-rescue/nullSafetyToTheRescue.md
---
Mit dem Update auf Dart 2.12 wurde das null-safe type system eingeführt.
Aber was ist das überhaupt? 
Wie verwende ich es? Und überhaupt welche Vorteile bringt mir das ganze.

Null Safety in Dart bedeute, dass jede Variable die ich definiere nicht Null sein kann außer ich sage explizit, dass sie Null sein darf.

Damit sichere ich meinen Code ab, da nicht nur zu Compile Zeiten keine Null Fehler entstehen können, nein sogar zur Runtime können keine Null Pointer Exceptions entstehen.

Sichere Code sichere Welt.

Aber wie nutze ich nun dieses Null Safety.

Als erstes muss ich in meiner Pubpspec yaml das sdk wie folgt hoch drehen:

{{<highlight yaml>}}
environment:
  sdk: ">=2.12.0 <3.0.0"
{{</highlight>}}

Ab nun wird mein Dart Compiler und auch mein Flutter SDk darauf reagieren und mir bescheid geben, dass meine Variablen nicht Null Safety sind.

Aber wie behebe ich nun die ganzen Fehler in meinem Code?

Dazu kommen wir jetzt:

Schauen wir uns folgendes Beispiel an:

{{<highlight dart>}}
  // Without null safety: 
  bool isEmpty(String string) { 
    if (string.length == 0){ 
      return true; 
    } 
    return false; 
  } 
  main() { isEmpty(null); }
{{</highlight>}}
Dieser Code wirf eine NoSuchMethodError Exception bei dem Aufruf von `.length` da der Compiler denkt, dass man `.length`auf ein NULL Objekt aufruft.

Wie können wir den Fehler beheben.

{{<highlight dart>}}
  bool isEmpty(String string) { 
    if (string != null){ 
      if (string.length == 0){ 
        return true; 
      } 
      return false; 
    } else { 
      throw Exception(); 
    }
{{</highlight>}}

Der code würde laufen, aber ist er wirklich schön? Nein! Es gibt eine bessere Lösung:

{{<highlight dart>}}
  bool isEmpty(String? string) { 
    if (string.length == 0){ 
      return true; 
    } 
    return false; 
  } 
  
  main() { 
    isEmpty(null); 
  }
{{</highlight>}}

Was haben wir geändert?

Wir haben an den Typ ein `?`gehängt. Dies weist den Compiler darauf hin der Wert `null`sein kann.

Für das Aufrufen der Werte müssen wir nun den Assertion operator benutzten damit wir dem Compiler mitteilen, dass der Inhalt der Variable sicher ist.



