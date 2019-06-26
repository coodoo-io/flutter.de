---
title: "Bottomsheet Modals verwenden"
slug: "bottom-sheet-modal" 
date: 2019-06-25T13:35:45+02:00
draft: true
description: "abgerundetes Bottom Sheet Modal implementieren"
tags: ["modal", "sheet", "bottom", "abgerundet"]
categories: []
author: Tobias Mautes
---


<!-----
Original Google Doc Post: 
----->

Bottomsheet Modals sind ein immer weiter verbreitetes Element da sie dem User eine Auswahl an Dingen geben welche leicht mit dem Daumen zu erreichen sind, das ist besonders wichtig im Zeitalter von immer größer werdenden Smartphones und sieht auch noch um einiges besser aus! Hier zeige ich dir wie du dir selbst eins bauen kannst. 

An sich ist das ganz einfach, du musst einfach nur diese Funktion irgendwie auslösen lassen und du hast ein simples Bottomsheet Modal:

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

{{< figure src="images/example-1.png" height="600" >}}

Dabei lässt sich der Inhalt im Modal mehr oder weniger komplett frei gestalten indem du was du willst im Wrap widget als child hinzufügst: 

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

{{< figure src="images/example-2.png" height="600" >}}

Und zu guter letzt kannst du dir ab Flutter version 1.3.6 das ganze auch noch ein wenig schöner gestalten indem du die Form mit angibst, das geht so:

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

Und damit hast du ein gut aussehendes Bottom Sheet modal welches du aussehen lassen kannst wie du möchtest!

{{< figure src="images/example-3.png" height="600" >}}

Wie immer kannst du in unserem GitHub Konto [hier](https://github.com/coodoo-io "Coodoo-IO Github") eine Demo zu finden.