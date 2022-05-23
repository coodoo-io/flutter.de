---
title: "Bottom Navigation Bar in Flutter"
date: 2021-06-14T19:15:59+02:00
dateOfUpdate: 2022-05-17T19:15:59+02:00
draft: false
header_image: "/artikel/20210614-bottom-navigation-bar/images/bottom_nav_bar.png"
images: ["/artikel/20210614-bottom-navigation-bar/images/bottom_nav_bar.png"]
authors: ["oualid-boutakhrit"]
description: "Bottom Navigation Bar in Flutter"
tags: ["flutter","bottomnavigationbar", "flutter navigation bar"]
categories: Anfänger * Flutter
link: 20210614-bottom-navigation-bar/20210614-bottom-navigation-bar.md
---

In diesem Artikel werden wir lernen, wie die Bottom Navigation Bar in Flutter verwendet wird.\
Eine Bottom Navigation Bar ist ein materielles Widget, das sich am unteren Rand einer App befindet 
und zur Navigation zu verschiedenen Seiten der App dient.

Hier ist eine Beispiel App mit BottomNavigationBar zu sehen, die während diesen Artikels entwickelt 
wird:\
<img width="350" height="450" src="/artikel/20210614-bottom-navigation-bar/images/bottom_nav_bar_gif.gif">


---

# Inhaltsverzeichnis
1. [Einbinden der BottomNavigationBar](#first)
2. [Die onTap Methode](#second)
3. [Definition der einzelnen Seiten der Navigationsoptionen](#third)
4. [Verbindung der Seiten mit der BottomNavigationBar](#fourth)
5. [Zusammenfassung](#fifth)
5. [Wie geht es weiter?](#sixth)

### 1. Einbinden der BottomNavigationBar <a name="first"></a>
Eine Bottom Navigation Bar kann leicht ins Projekt eingebaut werden, indem das entsprechende 
Attribut, also bottomNavigationBar, beim Scaffold hinzugefügt wird.

Als erstes wird das `material.dart` Package importiert.
{{<highlight dart>}}
import 'package:flutter/material.dart';
{{</highlight>}}

Danach wird die Scaffold mit `bottomNavigationBar` ergänzt.

{{<highlight dart>}}
bottomNavigationBar: BottomNavigationBar(
items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Messages',
    ),
],
currentIndex: _selectedIndex,
onTap: _onItemTapped,
),
{{</highlight>}}

> **Hinweis:**
>
> * Es müssen __mindestens zwei__ BottomNavigationBarItems in items aufgelistet werden.
> * Für iOS Geräte __muss__ ein Label angegeben werden.\

Hier beschreibt ein `BottomNavigationBarItem` eine klickbare Option der unteren Navigationsleiste.\
Mit dem Attribut `currentIndex` wird die aktive Option der Navigationsleiste angegeben. Dieser ist 
an dieser Stelle mit der Variable `_selectedIndex` belegt, sodass die aktive Option der 
Navigationsleiste angepasst werden kann. Wie das funktioniert wird in diesem Artikel weiter unten
beschrieben. Das Attribut `onTap` ist die Methode, die durch einen Tap auf die Navigationsleiste ausgeführt wird.
Diesem kann eine Methode übergeben werden, sodass ein Tap die `_selectedIndex` einen neuen Wert 
übergibt.

___

### 2. Die onTap Methode <a name="second"></a>

Hier wird die `_onItemTapped` Methode definiert. Der Parameter `index` wird von dem 
`BottomNavigationBar` Widget bereit gestellt. Der `index` nimmt den korrespondierenden Wert zum
geklickten Tab an. Durch `setState` wird das neue Bauen der Seite inszeniert und zuvor die 
`_selectedIndex` Variable mit `index` überschrieben. Damit wird
{{<highlight dart>}}
void _onItemTapped(int index) {
    setState(
        () {
            _selectedIndex = index;
        },
    );
}
{{</highlight>}}

---

### 3. Definition der einzelnen Seiten der Navigationsoptionen <a name="third"></a>

Nachdem die Verbindung zwischen der `BottomNavigationBar` und der `onTap` Methode hergestellt ist, 
fehlt jetzt noch die entsprechende Seite anzuzeigen. Nachfolgend wird eine Liste definiert mit 
Beispiel-Widgets für die jeweilige Seite.

{{<highlight dart>}}
final List<Widget> _pages = <Widget>[
    Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
                Text("Settings"),
                Icon(Icons.settings),
            ],
        ),
    ),
    Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
                Text("Home"),
                Icon(Icons.home),
            ],
        ),
    ),
Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
                Text("Messages"),
                Icon(Icons.message),
            ],
        ),
    ),
];
{{</highlight>}}

> **Hinweis:**\
> An dieser Stelle können auch `Scaffolds` um die `Center` bei den 
> `_pages` angegeben werden. Diese `Scaffolds` können dann auch mit individuellen appBars definiert
> werden. Dann ist es sinnvoll bei dem `Scaffold` bei dem die `bottomNavigationBar` definiert wird, 
> die `appBar` zu entfernen.

---

### 4. Verbindung der Seiten mit der BottomNavigationBar <a name="fourth"></a>
Nun fehlt nur noch der Zugriff, der dem Attribut `body` beim `Scaffold` hinzugefügt wird und wir 
sind fertig. An dieser Stelle wird das `Scaffold` immer mit dem Widget aus der `_pages` an der 
`_selectedIndex` Stelle gebaut.

{{<highlight dart>}}
body: Center(
    child: _pages.elementAt(_selectedIndex),
)
{{</highlight>}}

Schon wurde eine BottomNavigationBar zur App hinzugefügt.\

---

### 5. Zusammenfassung <a name="fifth"></a>
Es wurde eine BottomNavigationBar zum Scaffold hinzugefügt, der Auslösemechanismus implementiert und
die anzuzeigenen Widgets auf der Seite definiert.\
Insgesamt sieht der Code wie folgt aus:
{{<highlight dart>}}
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter BottomNavigationBar Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Settings"),
          Icon(Icons.settings),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Messages"),
          Icon(Icons.message),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
{{</highlight>}}

### 6. Wie geht es weiter? <a name="sixth"/>

Wie eine BottomNavigationBar aus Design-Sicht realisiert werden sollte und welche "Do" and "Don't"
es zu beachten gilt lässt sich hier finden:
[Material IO - BottomNavigationBar]
(https://www.material.io/components/bottom-navigation)


Wie bereits weiter oben im Artikel drauf hingewiesen kann es auch sinnvoll sein weitere Scaffolds je
Seite zu nutzen. Ein interessanter Artikel zu Scaffolds und was zu beachten gilt findet sich hier:
<br> 
[Was du über das Flutter Scaffold Widget wissen solltest]
(https://flutter.de/artikel/flutter-statusbar-farbe-%C3%A4ndern.html)
