---
title: "Seiten Navigation mit Flutter"
slug: "seiten-navigation-mit-flutter" 
date: 2019-06-26T13:35:45+02:00
draft: true
header_image: "/artikel/seiten-navigation-mit-flutter/images/head.jpg"
description: ""
tags: ["navigation", "routes", "transition"]
categories: []
author: Marcel Ploch
---

# Seiten Navigation mit Flutter

## Einfache Version

Eine Mobile App besteht zumeist aus mehreren Seiten / Views, die ein Nutzer betreten kann.
Auch mit Flutter kann man seine App so strukturieren, dass man seine einzelnen Views als Pages darstellt. Dies ist auch grundsätzlich zu empfehlen, da man sonst schnell in eine unübersichtliche Code Hölle kommt.

Aber wie navigiert man in Flutter von einer zur anderen Seite?

Zunächst benötigen wir in unserer App die Definition der Routen, die wir anspringen wollen.
Diese können wir wie im Gist beschrieben anlegen.

{{< gist marcel-ploch 5003be5eba6410a5eddfba9731088697 >}}

Hier empfiehlt es sich immer Konstanten für die Routen Strings anzulegen, welche dann zentral verwaltet werden. Da wir nun Routen zu unseren einzelnen Seiten haben, schauen wir uns als nächstes an, wie wir diese ansteuern können.

In unsere Seite selbst können wir nun über die Klasse `Navigator` einfach eine neue Route pushen. Dies sieht wie folgt aus:

{{< highlight dart >}}
Navigator.pushNamed(context, #Routen Name#);
{{< / highlight >}}

Die Navigator Klasse besitzt noch weitere Methoden, um auf das Routing zu reagieren und somit vor und zurück zu navigieren.

## Erweiterte Version - Routing mit Transitions
Wenn man nicht nur den Standard Flutter Seiten Übergang wünscht, sollte man sich die Bibliothek page_transition (https://pub.dev/packages/page_transition) anschauen. Diese ermöglicht es, verschiedene Transitions für seinen Seitenwechsel hinzuzufügen, die dann auch noch schön aussehen.

Hierzu müssen wir unseren bisherigen Code nur geringfügig anpassen.
Im Gist kann man genau sehen was sich geändert hat:

{{< gist marcel-ploch 5e6e865e7bb3d07972ddb2dcb9d85409 >}}

Im ersten Gist haben wir eine Liste an Routen definiert. Im zweiten benutzen wir die Callback Methode onGenerateRoute, um die Routing Settings zu definieren.
Hierzu verwenden wir von der Bibliothek bereitgestellte Methoden zum Setzen der Transition, wenn eine unserer Routen eintrifft. 
Im Beispiel wäre dies ein Seitenübergang von Links nach Rechts

return PageTransition(child: PlanPage(), type: PageTransitionType.leftToRight);

Nun können wir uns einfach zwischen Seiten unserer App hin und her bewegen und dies auch noch mit schönen Animationen begleiten.

![Page Transition](./images/app_transitions.gif#center)