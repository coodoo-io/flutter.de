# Flutter.de - Die Deutsche Community-Webseite

## Wie starte ich das Projekt?
1. Install Hugo
```brew install hugo```

2. Run NPM
```
npm i && npm --prefix ./themes/fluttery install ./themes/fluttery
```

2. Run the project
```
hugo server -D
# oder via package.json oder 'ntl' Tool
npm run start
```

3. Anschließen http://localhost:1313 aufrufen.

4. Neue Seite anlegen
```$(npm bin)/hugo new artikel/markus-test.md```