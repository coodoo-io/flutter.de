---
title: "Layout Cheat Sheet für Flutter auf deutsch"
slug: "layout-cheat-sheet-flutter-deutsch" 
date: 2019-08-18T07:23:32+02:00
draft: true
header_image: "/artikel/20190718-layout-cheat-sheet/images/layout.png"
images: ["/artikel/20190718-layout-cheat-sheet/images/layout.png"]
description: "Perfekte Layouts in Flutter gestalten mit dem Layout Cheat Sheet auf deutsch."
tags: ["cheat sheet", "ui", "layout"]
categories: Anfänger * UI * Layout
authors: ["simon-stevens"]
link: 20190818-layout-cheat-sheet/20190818-layout-cheat-sheet.md
---
Flutter lernen ist sehr einfach. Und mit diesem Layout Cheat Sheet ist es noch einfacher schöne Apps in Flutter zu bauen. Dieser Artikel wird euch helfen, euer UI unter Kontrolle zu bringen, damit die Layout Gestaltung in Flutter noch einfacher wird. 

# Übersicht
- Row und Columns
- ConstrainedBox
- BoxDecoration

## Row und Column

Bei der Ausrichtung der Objekte benutzt Flutter das gleiche System wie auch Bootstrap. Hier hängt man an das Objekt den Zusatz start, end, center, spaceBetween usw an. 

#### MainAxisAlignment.start

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/1.png" width="300" >}}

#### MainAxisAlignment.center

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/2.png" width="300" >}}

#### MainAxisAlignment.end

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/3.png" width="300" >}}

#### MainAxisAlignment.spaceBetween

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/4.png" width="300" >}}

#### MainAxisAlignment.spaceEvenly

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/5.png" width="300" >}}

#### MainAxisAlignment.spaceAround

{{< highlight xml >}}
Row /*or Column*/( 
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/6.png" width="300" >}}

## ConstrainedBox

Mit ConstrainedBox nutzt ein Widget allen verfügbaren Platz.

{{< highlight xml >}}
ConstrainedBox( 
  constraints: BoxConstraints.expand(),
  child: const Card(
    child: const Text('Hello World!'), 
    color: Colors.yellow,
  ), 
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/7.png" width="300" >}}

Mit BoxConstraints kannst du beeinflussen, wie viel Platz ein Widget einnimmt. Hier stehen dir die Zusätze: min/max/height/width. 

{{< highlight xml >}}
ConstrainedBox(
  constraints: BoxConstraints.expand(height: 300),
  child: const Card(
    child: const Text('Hello World!'), 
    color: Colors.yellow,
  ),
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/8.png" width="300" >}}

oder:

{{< highlight xml >}}
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: double.infinity,
    maxWidth: double.infinity,
    minHeight: 300,
    maxHeight: 300,
  ),
  child: const Card(
    child: const Text('Hello World!'), 
    color: Colors.yellow,
  ),
),
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/9.png" width="300" >}}

## BoxDecoration

Mit BoxDecoration kannst du das Aussehen des Containers verändern. 

#### DecorationImage
Verschiebt ein Bild in den Hintergrund.

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('image: DecorationImage')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: NetworkImage(
            'https://flutter.io/images/catalog-widget-placeholder.png',
          ),
        ),
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/10.png" width="300" >}}

#### Border

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('border: Border')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black, width: 3),
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/11.png" width="300" >}}

#### BorderRadius

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('borderRadius: BorderRadius')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/12.png" width="300" >}}

#### BoxShape

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('shape: BoxShape')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/13.png" width="300" >}}

#### boxShadow

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('boxShadow: List<BoxShadow>')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        boxShadow: const [
          BoxShadow(blurRadius: 10),
        ],
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/14.png" width="300" >}}

#### Gradient

Man unterscheidet drei Arten von Gradienten: `LinearGradient`, `RadialGradient`und `SweepGradient`. Hier sei beispielhaft der LinearGradient aufgeführt.

{{< highlight xml >}}
Scaffold(
  appBar: AppBar(title: Text('gradient: LinearGradient')),
  body: Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Colors.red,
            Colors.blue,
          ],
        ),
      ),
    ),
  ),
);
{{< /highlight >}}
{{< figure src="20190718-layout-cheat-sheet/images/15.png" width="300" >}}

Ich werde den Cheat Sheet Artikel noch erweitern, aber erst einmal sind die Grundlagen gedeckt.

