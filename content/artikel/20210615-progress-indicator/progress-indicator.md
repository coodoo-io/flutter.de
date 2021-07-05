---
title: "Ladeanzeige mit ProgressIndicator in Flutter"
slug: "progress-indicator-flutter" 
date: 2021-06-15T07:45:30+02:00
draft: false
header_image: "/artikel/20210615-progress-indicator/images/lb.png"
images: ["/artikel/20210615-progress-indicator/images/lb.png"]
description: "ProgressIndicator in Flutter"
tags: ["flutter","ProgressIndicator",]
categories: Anfänger * Widgets 
authors: ["andreas-mayer"]
link: 20210615-progress-indicator/progress-indicator.md
---

Wenn der Nutzer deiner Flutter App über den Fortschritt eines Vorgangs, oder einfach nur darüber, dass gerade ein Vorgang ausgeführt wird, informiert werden soll, gibt es in Flutter die Möglichkeit, genau das mit einem ProgressionIndicator zu tun.

### ProgressIndicator die den Fortschritt eines Vorgangs zeigen
Um einen fortschittszeigenden Progressindicator erscheinen zu lassen, muss man dieses lediglich als Widget an der gewünschten Stelle hinzufügen:

Dabei gibt es Runde:
{{<highlight dart>}}
CircularProgressIndicator(
    value: _value,
    backgroundColor: Colors.red,
    color: colors.green,
    strokeWidth: 10,
),
{{</highlight>}}

Und Balkenförmige:
{{<highlight dart>}}
LinearProgressIndicator(
    value: _value,
    backgroundColor: Colors.red,
    color: colors.green,
),
{{</highlight>}}

value repräsentiert den Fortschritt im Bereich [0,1].
backgroundColor ist die Farbe, die der noch nicht aufgefüllte Teil des Indikators hat, color die die der gefüllte Teil hat.
strokeWidth ist die Breite des Indikators (Nur für CircularProgressIndicator).

### ProgressIndicator zeigen das ein Vorgang bearbeitet wird
Häufiger anzutreffen sind ProgressIndikatoren, welche nur zeigen, dass die App arbeitet, um keine Ressourcen an die Berechnung des Fortschritts zu verschwenden. Diese zu benutzen ist ähnlich einfach wie die Forschrittsanzeigenden. Man muss einfach nur den value weglassen.

Auch hier gibt es deshalb wieder Runde:
{{<highlight dart>}}
CircularProgressIndicator(
    backgroundColor: Colors.red,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    strokeWidth: 10,
),
{{</highlight>}}

Und Balkenförmige:
{{<highlight dart>}}
LinearProgressIndicator(
    backgroundColor: Colors.red,
),
{{</highlight>}}

Zu beachten ist noch, dass es das Attribut color nicht mehr gibt. Stattdessen kann man, falls gewünscht, mit **AlwaysStoppedAnimation<Color>(color)** eine statische Farbe auswählen oder mit einem **AnimationController** einen dynamischen Farbübergang für den Indikator auswählen. 

Dazu muss dieser zunächst erstellt werden:
{{<highlight dart>}}
animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 15),
)
    ..addListener(
    () {
        setState(() {});
    },
    )
    ..repeat();
{{</highlight>}}

duration gibt an wie lange der Übergang dauert, repeat, dass der Vorgang (der Farbübergang) permanent wiederholt wird (falls gewüsncht kann repeat reverse=true mitgegeben werden, um den Vorgang abwechselnd vorwärts und rückwärts zu zeigen).

Diesem ist es möglich, einen Farbübergang zu animieren, der dem Indikator hinzugefügt werden kann.
{{<highlight dart>}}
LinearProgressIndicator(
        backgroundColor: colorList[2],
        valueColor: animationController.drive(
            ColorTween(
                begin: Colors.red,
                end: Colors.blue,
            ),
        ),
    ),
{{</highlight>}}