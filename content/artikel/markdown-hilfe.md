+++ 
draft = true
date = 2019-05-28T00:56:05+02:00
title = "Markdown Hilfe von Jan"
description = ""
slug = "markdown-hilfe"
tags = []
categories = []
externalLink = ""
author = "Jan Marsh"
series = []
+++

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

# Heading 1

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

## Heading 2

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

### Heading 3

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

#### Heading 4

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

##### Heading 5

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

###### Heading 6

Lid est laborum et dolorum fuga. Et harum quidem rerum facilis est et expeditasi distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihilse impedit quo minus id quod amets untra dolor amet sad. Sed ut perspser iciatis unde omnis iste natus error sit voluptatem accusantium doloremque laste. Dolores sadips ipsums sits.

## Typography

Lid est laborum et dolorum fuga, This is [an example](http://example.com/ "Title") inline link. Et harum quidem rerum facilis, **This is bold** and *emphasis* cumque nihilse impedit quo minus id quod amets untra dolor amet sad. While this is `code block()` and following is a `pre` tag

	print 'this is pre tag'

This is blockquote, Will make it better now

> 'I want to do with you what spring does with the cherry trees.' <cite>cited ~Pablo Neruda</cite>*

Unordered list

*   Red
*   Green
*   Blue

Ordered list

1.	Red
2.  Green
3.  Blue

## Images

{{< figure src="/images/N90.jpg" title="Steve Francia" caption="Testbild" height="300" >}}

## Source Code Embedding

#### Direct via Syntax-Highlighting

{{< highlight dart >}}
// Mathematik-Bibliothek für die Wurzel-Funktion einbinden
import 'dart:math' as math;

// eine Klasse definieren
class Point {
  Point(num this.x, num this.y); // einen Konstruktor über eine syntaktische Besonderheit definieren
  distanceTo(Point other) { // eine Methode
    methodCalls++;
    num dx = x - other.x;
    num dy = y - other.y;
    return math.sqrt(dx * dx + dy * dy);
  }
  num x, y; // Member-Variablen
  static int methodCalls = 0; // statische Variable
}

// eine Unterklasse definieren, die von "Point" erbt
class ColorPoint extends Point {
  ColorPoint(x, y, this.color) : super(x, y);
  var color;
}

main() {
  Point p = new Point(2, 3);
  Point q = new ColorPoint (3, 4, 'rot');
  print('Abstand von p nach q = ${p.distanceTo(q)} ');
  print('Methoden-Aufrufe = ${Point.methodCalls}');
}

// Ausgabe: Abstand von p nach q = 1.41421356237; Methoden-Aufrufe = 1
{{< /highlight >}}

#### Indirect via gists from github

{{< gist spf13 7896402 "img.html" >}}


## Social Media

#### Youtube
{{< youtube w7Ft2ymGmfc >}}

#### Vimeo

{{< vimeo 146022717 >}}

#### Twitter

{{< tweet 877500564405444608 >}}

#### Instagram

{{< instagram BWNjjyYFxVx >}}

## Emoji
:see_no_evil: :smile: