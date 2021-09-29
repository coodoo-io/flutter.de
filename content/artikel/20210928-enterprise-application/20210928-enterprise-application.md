---
title: "Enterprise Applications mit Flutter – 
7 Gründe, die dafür sprechen"
slug: "flutter-enterprise-application-gruende-dafuer" 
date: 2021-09-28T10:00:25+02:00
draft: false
header_image: "/artikel/20210928-enterprise-application/images/flutter-logo.jpg"
images: ["/artikel/20210928-enterprise-application/images/flutter-logo.jpg"]
description: "Erstelle animierte und statische Splash Screens in Flutter"
tags: ["flutter", "splash"]
categories: Enterprise * Flutter
authors: ["marcel-ploch"]
link: 20210928-enterprise-application/20210928-enterprise-application.md
---

Flutter ist schon lange die perfekte Cross-Plattform-Technologie für schnelle und einfache App-Entwicklung - ob nun für iOS oder Android. Aber taugt sie auch für die Entwicklung von Enterprise Anwendungen? 

Als Google 2018 die erste stabile Version von Flutter (1.0) ankündigte, stellte sich wohl jeder die Frage, ob es sich tatsächlich um ein gutes Framework für mobile Enterprise Anwendungen handelt. Jetzt 2021 ist die Entscheidung definitiv gefallen. Über 4.000 Libraries unterstützen Flutter-Apps. Medium, YouTube, Stack Overflow und mehr sind überfüllt mit Inhalten, die auf die große Popularität des Frameworks hindeuten. Laut Google nutzen 500.000 Entwickler monatlich das Software Development Kit. Flutters SDK, das am zweitschnellsten wachsende Projekt auf GitHub, stellt seine Konkurrenten in der Branche in den Schatten. In diesem Artikel wollen genauer betrachten, was denn nun wirklich für Flutter spricht.

## Ein Überblick über das Framework

Flutter ist ein Open-Source-UI-Software-Framework, das für die plattformübergreifende Anwendungsentwicklung verwendet wird. Durch die Verwendung einer einzigen Codebasis können Unternehmen effektiv verschiedene Arten von Applikationen erstellen - von einfachen Chat-Apps bis hin zu On-Demand-Lebensmittel-Apps. Der Unterschied zu anderen Frameworks besteht darin, dass Flutter-Apps in Googles objektorientierter Programmiersprache Dart geschrieben sind.

Google hat sich für Dart entschieden und dabei vier Überlegungen berücksichtigt:
<ul>
<li>Produktivität
</li>
<li>Sichere Speicherverwaltung
</li>
<li>Objektorientierung
</li>
<li>Hohe Leistung
</li>
</ul>


UI-Performance, Quellcode Wartung, Sicherheitstests und Funktionalitäten stellen oftmals die größten Herausforderungen für Entwickler dar. Flutter zielt darauf ab, diese Probleme so einfach wie möglich zu lösen.

# Mobile Enterprise Applications
Unternehmensanwendungen erfordern viele Funktionen, hohe Sicherheit und ein nahtloses UI-Design mit einem robusten Framework, das eine hohe Leistung gewährleistet. Sind Flutter und seine Libraries dem gewachsen? 
Folgende Anforderungskategorien gilt es abzudecken: 

<ul>
<li>Mehrschichtige Architektur
</li>
<li>Entwicklungsumgebung
</li>
<li>Benutzeroberfläche
</li>
<li>Hardware-Features
</li>
<li>App-Sicherheit
</li>
<li>Sonstiges
</li>
</ul>


<h2>1. Mehrschichtige Architektur für bessere Funktionalität</h2>
<p>Bei der Entwicklung einer Unternehmensanwendung ist es wichtig, dass diese über mehrschichtige Architekturen verfügt, die eine nahtlose Funktionalität gewährleisten und zu einer besseren Produktivität des gesamten Entwicklerteams führt.
Wenn Architekturebenen eingefügt werden, müssen Entwickler Wege finden, um Folgendes anzubieten:
<ul>
<li>Zugang zu gut dokumentierten Entwurfsmustern</li>
<li>Parallele Entwicklung an der gleichen Code Basis</li>
<li>Einfaches Verständnis für die breite Palette an App Features</li></ul>

Flutter glänzt hier durch die einfache und sichere Vernetzung von Webressourcen, lokalem Speicher, SQLite-Datenbanken und Zugriff auf Hardware über Library-Plugins.
</p>
<ul>

<li><b>State Management</b><p>
<p> Flutter verwendet das Provider Pattern als zentrales Architektur Muster. Es gibt auch andere State-Management-Ansätze, wie Redux, BLoC, InheritedWidget, setState usw., diese haben aber ihre Grenzen.</li>
<li><b>RxDart</b><p>Falls die Streams und das asynchrone Paket von Dart für asynchrone Programmieranforderungen nicht ausreichen, ist es eine kluge Entscheidung, RxDart in Betracht zu ziehen. Es lässt sich nahtlos in Flutter- und State-Management-Frameworks integrieren.
<li><b>Hintergrundverarbeitung</b><p> Sie ermöglicht rechenintensive Arbeiten in der App, bei gleichzeitiger Beibehaltung der Reaktionsfähigkeit der Benutzeroberfläche. Abhängig von der Komplexität der Anforderungen an die Hintergrundverarbeitung müssen möglicherweise native Plattformfunktionen übernommen werden, die über eine reine Dart-Implementierung hinausgehen.
<li><b>Dependency injection</b><p> Um die Code Fragmente unabhängig und wiederverwendbar zu machen, können Entwickler die Dependency Injection verwenden. Es ist ein Entwurfsmuster, das das Testen von Code erleichtert. Der GetIT-Locator ist eine einfach zu verwendende DI-Bibliothek, die nahtlos mit dem State-Management-Framework zusammenarbeitet, um die Trennung der App-Schichten sicherzustellen.
<li><b>JSON-Serialisierung/Deserialisierung</b><p> Ist für jeden RESTful-Client wichtig und in den meisten Unternehmensanwendungen üblich.
<li><b>Deep Linking</b><p> Bietet die richtige Navigation von einer Website oder einer Push-Benachrichtigung heraus, um bestimmte Bereiche innerhalb der App zu starten.
<li><b>Lokaler Speicher</b><p> Flutter bietet die Möglichkeit eine kleine Menge von Schlüssel-/Wertdaten zu speichern und hilft der App, auch dann zu funktionieren, wenn die App im Hintergrund läuft oder gestoppt wird.
<li><b>SQLite</b><p>Kann verwendet werden, um mit größeren Mengen strukturierter Daten zu arbeiten.
<li><b>Push-Benachrichtigungen</b><p> Anwendungen auf Unternehmensebene erfordern normalerweise eine Back-End-Integration, mit der Benutzer über Fälligkeitstermine, Erinnerungen an Dienste und mehr informiert werden können. Dafür ist Firebase Messaging die beste Lösung.</p>
</ul>

<h2>2. Entwicklungsumgebung für native Android- und iOS-Anwendungen</h2>
<p>Für die Entwicklungsumgebung können Entwickler zwischen Android Studio/IntelliJ und Visual Studio Code für ihre Flutter-IDE wählen. All diese werden auf Mac, PC, Linux und Chromebook gut unterstützt. Innerhalb dieser IDEs können Entwickler Code erstellen, Emulatoren bereitstellen, Debugging durchführen und Profiling betreiben. Um jedoch Native iOS Anwendungen zu testen und zu entwickeln, ist Xcode auf einem Mac erforderlich.</p>
<ul><li><p>
<b>Skalierbarkeit:</b> Flutter-Apps sind einfach zu skalieren, da sie auf dem Dart-Ökosystem basieren, das Dart-Pakete importiert, um die Funktionalität externer Bibliotheken bereitzustellen. Flutter-Projekte können in Flutter Dart-Pakete umgestaltet werden, was eine weitere Möglichkeit bietet, die Arbeit auf große Teams aufzuteilen und die Skalierung der App zu vereinfachen.</p></li>
<li><p><b>Testbarkeit:</b> Egal, ob Sie Unit-Tests, Widget-Tests oder Integrationstests verwenden, jedes Flutter-Widget kann einfach getestet werden. All diese Testwerkzeuge ermöglichen die maximale Testabdeckung.</p></li><li><p>
<b>Kontinuierliche Integration/kontinuierliche Bereitstellung:</b> Flutter verwendet das herausragende Android- und iOS-Toolset, um Apps im Google Play Store oder im Apple Store bereitzustellen, um sie mit jedem vorhandenen mobilen CI/CD-Setup für Unternehmen verfügbar zu machen.</li>
</ul><p>
Entwickler mobiler Apps, die mit Flutter arbeiten, können die meiste Zeit in der Flutter/Dart-Umgebung verbringen, während sie die Flutter-Apps auf Android- und iOS-Geräten bereitstellen. Für die Implementierung einer erfolgreichen Flutter-App sind Kenntnisse zum Erstellen und Signieren von Apps und dem Bereitstellen von Profilen usw. unerlässlich.</p>

<h2>3. Benutzeroberfläche </h2><p>
Mobile Apps für Unternehmen leben von einer hervorragenden Benutzeroberfläche. Glücklicherweise verfügt Flutter über umfassende Funktionen um dies zu gewährleisten. 

<b>Animationen:</b> Animations sind schnell zu erlernen und können auf jede beliebige Komplexität skaliert werden. Für die umfassende Nutzung von Flutter kann Flare eingebunden werden, eine vollwertige 2D-Vektoranimationsbibliothek. Entwickler verwenden dieses Tool häufig, um Anwendungen mit einer nahtlosen Schnittstelle anzupassen.<br>
<b>Seitenübergänge:</b> Diese sind ein perfektes Beispiel, wie eine Navigation zwischen App-Seiten mit Animation erreicht werden kann.
Pagination oder unendlich scrollende Listenansicht: Dies ist eine häufige Anforderung, wenn es darum geht, Benutzern große Datenmengen anzuzeigen, ohne viel Gerätespeicher zu verbrauchen. Dies ist der neueste Trend bei Entwicklungsdiensten für mobile Apps, da Flutter unendliches Scrollen für Rich-Content-Repositories bietet.<br>
<b>Bibliothek zum Laden/Caching von Bildern:</b> Sie bietet eine schnelle und einfache Möglichkeit, viele Bilder zu verarbeiten, einschließlich Caching, wenn das Basisbild oder das SVG-Bild nicht für die Verwendung ausreicht. Flutter-App-Entwickler können Bilder einfach durch Laden und Zwischenspeichern von Bibliotheken verwalten.<br>
Schlussendlich kann in Flutter auch der Zugriff auf Google und Apple Maps gewährt werden.</p>

<h2>4. Anforderungen an die Hardware</h2><p>
Es gibt wohl keine App, die ohne die Unterstützung von Hardwarefunktionen vollständig funktioniert. Das macht einen guten Hardware- und Software-Support unerlässlich. Zum Beispiel für folgende Funktionen: 
<ul>
<li> Kamera
</li>
<li> Accelerometer
</li>
<li> GPS
</li>
<li> Biometrische Authentifizierung, einschließlich Fingerabdruck und Gesichtserkennung
</li>
<li> Mikrofon
</li>
</ul>
</p>



<h2>5. Mobile App-Sicherheit</h2>
<p>Sicherheit ist ein Bereich, der von Unternehmen nicht kompromittiert werden kann – sei es für eine Unternehmensanwendung oder eine App auf fortgeschrittener Ebene. Die Sicherung von App-Daten ist eines der Hauptanliegen von Unternehmen. Daher muss beim Erstellen von Unternehmensanwendungen auf verschiedene Dinge geachtet werden. 
Gehen wir davon aus, dass Flutter-Apps auf Android- und iOS-Sandbox-Umgebungen basieren, sodass jede Flutter-App inhärente Sicherheitsaspekte für native iOS- und Android-Apps aufweist.
Die wichtigsten Anforderungen wie Authentifizierung (Biometrie, Fingerabdruck, zweistufiges Passwort) werden von Flutters Simple Auth gut abgedeckt.
Hier sind die anderen Authentifizierungsanbieter, die in Betracht gezogen werden sollten:</p>
<ul>
<li>Amazon
</li>
<li>Facebook
</li>
<li>GitHub
</li>
<li>Google
</li>
<li>Dropbox
</li>
<li>LinkedIn
</li>
<li>Instagram
</li>
<li>Azure Active Directory
</li>
<li>Microsoft Live Connect
</li>
</ul>

Das Anheften von SSL-Zertifikaten ist ebenfalls wichtig, da es die Möglichkeit von Angriffen aufgrund von gemeinsam genutzten Servern verringert. Es sichert Web-Anfragen (HTTPS) und wird unterstützt.
Die sichere Speicherung bietet die Möglichkeit, eine kleine Anzahl von Schlüsseln oder wertvollen Informationen sicher auf einem Gerät zu speichern und die App auch dann funktionsfähig zu machen, wenn keine Verbindung zum Internet besteht.

<h2>6. Sonstige Anforderungen</h2><p>
Abgesehen von all den oben genannten Anforderungen sind hier einige weitere Punkte, die bei der Entwicklung von Unternehmensanwendungen wichtig sind:
<ul>
<li>Analytics: Hierfür bietet Flutter Adobe- oder Firebase Analytics-Bibliotheken.
</li>
<li>Fehlerberichterstattung: Entwickler können die Sentry-Bibliothek von Flutter verwenden.
</li>
<li>Drittanbieter- oder Open-Source-Bibliotheken: Hier gibt es eine umfangreiche Liste mit Bibliotheken und Lizenzen von Drittanbietern, aus der gewählt werden kann.
</li>
<li>Generieren von QR-Codes: Ob für die erweiterte Funktionalität der App oder für Sicherheitszwecke, das Scannen von QR-Codes ist wichtig.
</li>
</ul>

Weiterhin gilt zu beachten:</p>
<ul>
<li>Teilen von App-Details mit Social-Media-Konten.
</li>
<li>Zugriff auf eine persönliche Kontaktliste.
</li>
<li>Zulassen von Kamera oder Standort während der Verwendung der App.
</li>
<li>Senden von SMS oder Multimedia-Mitteilungen oder Empfangen von SMS mit einmaligen Passcodes.
</li>
<li>Durchführen von In-App-Zahlungen mit dem Square In-App-Zahlungs-SDK.
</li>
</ul>





<h2>7. Flutter kann für alle Plattformen genutzt werden, nicht nur iOS und Android</h2><p>
Flutter läuft plattformübergreifend, auch über iOS und Android hinaus. So zum Beispiel funktioniert Flutter für Web, macOS, Windows und Linux. Die Entwicklung einer App, die sich unter Verwendung eines einzigen Codes nahtlos auf all diesen Plattformen bereitstellen und ausführen lässt, ist etwas Besonderes. 
Gleichzeitig muss beachtet werden, dass nicht auf allen Plattformen dieselben Funktionen unterstützt werden können. Google Maps wird beispielsweise derzeit nur auf Android, iOS und im Web unterstützt. Trotzdem eignet sich Flutter sowohl für mobile, als auch Webanwendungen. </p>

# Zusammenfassung
Flutter gewinnt bereits an Popularität für die App-Entwicklung, aber mit der breiten Unterstützung von Libraries hat es sich schnell zu einer praktikablen Option für Unternehmen entwickelt, um Unternehmensanwendungen in kurzer Zeit zu erstellen.
Das Beste daran ist, dass Unternehmen, Startups und einzelne Entwickler in jeder Branchennische Potenzial nutzen und eine App erstellen können, indem sie das richtige Unternehmen für die Entwicklung mobiler Apps beauftragen. Wir von coodoo sind seit der ersten Stunde begeisterte Flutter-Nutzer und haben uns zu Experten auf diesem Gebiet hochentwickelt. Kontaktiert uns für den Start eines Projekts! 


Der Originalartikel von Sophia Martin erschien bei <a href="https://betterprogramming.pub/heres-why-flutter-is-now-ready-for-enterprise-app-development-1986ef2cd3e3">betterprogramming.pub</a>