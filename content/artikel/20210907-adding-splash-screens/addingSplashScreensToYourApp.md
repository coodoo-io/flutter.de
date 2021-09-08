---
title: "Splash up your App with Flutter"
slug: "flutter-splash-screen" 
date: 2021-09-07T10:00:25+02:00
draft: false
header_image: "/artikel/20210907-adding-splash-screens/images/splash-screens_header.png"
images: ["/artikel/20210907-adding-splash-screens/images/splash-screens_header.png"]
description: "Erstelle animierte und statische Splash Screens in Flutter"
tags: ["flutter", "splash"]
categories: Anfänger * UI * Flutter
authors: ["marcel-ploch"]
link: 20210907-adding-splash-screens/addingSplashScreensToYourApp.md
---
Splash Screens dienen dazu, einen User abzuholen und den Start einer App mit einem passenden Bild oder einer Lade-Animation zu verkürzen.

Auch wenn Flutter verdammt schnell ist, erscheint beim App-Start ein kurzer weißer Screen, der dazu führt, dass sich der User nicht abgeholt fühlt.

Hier ist es besser, ein kurzes Bild einzufügen, um den User zu zeigen, dass etwas passiert.

Am Einfachsten kann man das Problem mit folgender Erweiterung lösen:

[Pub.dev Native Splash](https://pub.dev/packages/flutter_native_splash)

Nach der Installation erweitert man seine pubsepc.yaml um die benötigten Informationen und legt das Bild als png im Assets Folder ab.

{{<highlight yaml>}}
background_image: "assets/qatar-2022-logo-white-1-700x700.png"
android_gravity: fill
fullscreen: true
{{</highlight>}}

Nach dem Ausführen vom Befehl:

{{<highlight bash>}}
flutter pub run flutter_native_splash:create
{{</highlight>}}

Jetzt kann die App mit Splash Screen gestartet werden und das Ergebnis sieht dann so aus:

![splashsreen_plain](20210907-adding-splash-screens/images/gif1.gif#center300)

Nun haben wir einen passenden, statischen Splash Screen. 

Da muss doch aber mehr gehen und wir müssten diesen doch auch animieren können?

Um eine Animation einzubauen, benötigen wir eine andere Erweiterung:

[Pub.dev - Animated Splash Screen](https://pub.dev/packages/animated_splash_screen)

Die Erweiterung ist schnell und einfach installiert und lässt sich einfach in bestehende Anwendungen integrieren.

{{<highlight dart>}}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.sports_soccer,
          nextScreen: MainScreen(),//MyHomePage(title: "Test it",),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          backgroundColor: Colors.blue
        )
    );
  }
}
{{</highlight>}}

Hierbei ist zu beachten, dass scheinbar nicht alle PageTransitions sauber funktionieren, was man auch auf der GitHub Page nachlesen kann.

![splashsreen_animation](20210907-adding-splash-screens/images/gif2.gif#center300)

Und so haben wir einfach und schnell unsere App um einen Splashscreen erweitert.