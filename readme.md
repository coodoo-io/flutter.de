# Flutter.de - Die Deutsche Community-Webseite

## Wie starte ich das Projekt?
1. Run NPM
```
npm i && npm --prefix ./themes/fluttery install ./themes/fluttery
```

2. Run the project
```
npm run start
```

3. Anschließend http://localhost:1313 aufrufen.

4. Einen neuen Artikel anlegen

Jeder Artikel wird in einem neuen Ordner abgelegt nach dem Muster (Datum + Artikelname). Bilder werden im gleichen Artikelordner abgelegt. Die .md muss den gleichen Namen haben wie der Ordner. Zum Beispiel so:
**"artikel/20190617-group-work/index.md"**
```
$(npm bin)/hugo new artikel/20190617-{{deinArtikelName}}/index.md
```
5. Jeder Artikel braucht einen Titel, Autorenname, einen Beschreibungstext (description), ein Bild, Tags, Categories, Link-Pfad usw. Einfach bei den anderen Artikeln abschauen. Wenn der Artikel fertig ist, einfach auf "draft: false" setzen.