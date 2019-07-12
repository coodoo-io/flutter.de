---
title: "Bottomsheet Modals in Flutter verwenden"
slug: "bottom-sheet-modal-in-flutter" 
date: 2019-06-22T07:35:45+02:00
draft: true
description: "Wie man in Flutter ein abgerundetes Bottom Sheet Modal implementiert."
images: ["/artikel/20190722-bottom-sheet-modal/images/bottom-sheet-modal.jpg"]
header_image: "/artikel/20190722-bottom-sheet-modal/images/bottom-sheet-modal.jpg"
tags: ["modal", "sheet", "bottom", "abgerundet"]
categories: Anfänger * Design * Styling
author: Tobias Mautes
link: 20190722-bottom-sheet-modal/20190722-bottom-sheet-modal.md
---

Bottomsheet Modals sind ein immer weiter verbreitetes Element, da sie dem User eine Auswahl an Dingen geben, die leicht mit dem Daumen zu erreichen sind. Das ist besonders wichtig im Zeitalter von immer größer werdenden Smartphones und sieht auch noch um einiges besser aus! Hier zeige ich dir, wie du dir ein Bottom Sheet Modal in Flutter selbst bauen kannst. 

An sich ist das ganz einfach. Du musst einfach nur diese Funktion ausführen und schon hast du ein simples Bottomsheet Modal:

{{< highlight dart >}}
showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.access_alarms),
                title: new Text('Neuer Alarm'),
                onTap: () => {},
              ),
            ],
          ),
        );
      },
    );
{{< /highlight >}}

Das dadurch erzeugte Modal sieht so aus:

{{< figure src="20190625-bottom-sheet-modal/images/example-1.png" height="600" >}}

Dabei lässt sich der Inhalt im Modal frei gestalten, indem du was du willst, im Wrap Widget als `child` hinzufügst: 

{{< highlight dart >}}
showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(

          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.access_alarms),
                title: new Text('Neuer Alarm'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(Icons.hourglass_empty),
                title: new Text('Timer'),
                onTap: () => {},
              ),
              SizedBox(
                height: 70,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListBody(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('2:00:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('15:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('30:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('5:00'),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),

        );
      },
    );
{{< /highlight >}}

{{< figure src="20190625-bottom-sheet-modal/images/example-2.png" height="600" >}}

Zu guter Letzt kannst du ab Flutter Version 1.3.6 das Ganze ein wenig schöner gestalten, indem du die Form mit angibst. Das geht so:

{{< highlight dart >}}
   showModalBottomSheet(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),

      context: context,
      builder: (BuildContext context) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.access_alarms),
                title: new Text('Neuer Alarm'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(Icons.hourglass_empty),
                title: new Text('Timer'),
                onTap: () => {},
              ),
              SizedBox(
                height: 70,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListBody(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('2:00:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('15:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('30:00'),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text('5:00'),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
{{< /highlight >}}

Damit hast du ein gut aussehendes Bottom Sheet Modal in Flutter, das du gestalten kannst, wie du möchtest!

{{< figure src="20190625-bottom-sheet-modal/images/example-3.png" height="600" >}}

Wie immer findest du im coodoo GitHub Konto [hier](https://github.com/coodoo-io "Coodoo-IO Github") eine Demo hierzu.