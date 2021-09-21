---
title: "Singletons, Singletons in Flutter überall"
slug: "flutter-singletons" 
date: 2021-09-21T10:00:25+02:00
draft: false
header_image: "/artikel/20210921-writing-a-singleton/images/5npfgs.jpg"
images: ["/artikel/20210921-writing-a-singleton/images/5npfgs.jpg"]
description: "Wie schreibe ich ein Singleton in Dart und wie nutze ich es"
tags: ["flutter", "splash"]
categories: Anfänger * Flutter * Dart * Architecture
authors: ["marcel-ploch"]
link: 20210921-writing-a-singleton/writingASingleton.md
---
Singletons sind in der Software Entwicklung nicht weg zu denken.
Sie dienen vor allem dazu, immer das gleiche Objekt einer Instanz überall in unserer Software zu erhalten. Hierbei haben wir Zugriff auf alle Informationen unseres Objektes.

Innerhalb von Flutter können wir Singletons dann nutzen, wenn wir Daten von APIs oder externen Datenquellen vorhalten und in diversen Widgets nutzen wollen.

Hier müssen wir nicht noch einmal die Daten laden, sondern können die vorgehaltenen Daten an allen Stellen in unserem Code nutzen, da wir überall die gleiche Instanz haben.

Aber wie erzeugen wir solch ein Singelton in Dart? Da Dart das Factory Pattern nutzt, können wir ein Singleton einfach über den Factory Constructor lösen.

Unsere Service Klasse soll ein Singleton werden. Schauen wir uns dazu den Code an.

{{<highlight dart>}}
class DeskService {

  /// Unsere Singleton Instanz, die einmalig instanziiert wird
  static final DeskService _singleton = DeskService._internal();
  
  /// Unsere Referenz, die wir zugreifbar machen wollen innerhalb unseres Singletons, muss final sein
  final CollectionReference desks = FirebaseFirestore.instance.collection('desk');

  /// Member Variable, die zugreifbar gemacht werden soll
  late List<DeskModel> data = [];

  /// Factory Constructor, der die Instanz der Klasse zurückgibt, egal wann sie aufgerufen wird
  factory DeskService() {
    return _singleton;
  }

  //
  DeskService._internal();

  /// Diese Methode ist nicht mehr static und kann direkt aufgerufen werden
  Future<List<DeskModel>> fetchData() async {
    List<DeskModel> response = [];
    await desks.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            Logger().d(element.data());
            Logger().d(element.id);
            response.add(DeskModel.fromJson(element));
          })
        });
    return response;
  }

  /// 
  Future<void> changeReserved(DeskModel ele) {
    return desks.doc(ele.id)
    .update({'reserved': ele.reserved})
    .then((value) {
      Logger().d('Desk Upadted');
    })
    .catchError((error) {
      Logger().d(error);
      throw Exception(error);
    });
  }
}
{{</highlight>}}

Unsere Klasse ist jetzt ein Singleton und kann überall in unserem Code genutzt werden.
Dazu rufen wir nur noch unsere Klasse auf und können direkt auf die Methoden zugreifen, wie im zweitem Beispiel aufgezeigt.

{{<highlight dart>}}
  class DeskState extends ChangeNotifier {
    late List<DeskModel> data = [];
    late DeskModel currentDeskModel;

  DeskState() {
    /// Nutzung unsere Singleton Klasse und Aufruf der Methode
    DeskService().fetchData().then((data) => {this.data = data});
  }
}
{{</highlight>}}

Nun können wir einfach Singletons in Dart schreiben und diese an allen Stellen unserer App nutzen.
Jedes Widget kann auf die Daten und Methoden des Singletons zugreifen und das an jeder Stelle im Code.

Beste Grüße und Happy Coding