# Flutter.de - Die Deutsche Community-Webseite

## Wie starte ich das Projekt?

1. Run NPM
```
npm i && npm --prefix ./themes/fluttery install ./themes/fluttery
```

2. install nvm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

3. node version auf v12.22.12 setzen
```
nvm install v12.22.12
```

4. Run the project
```
npm run start
```

5. Anschließend http://localhost:1313 aufrufen.

## Einen neuen Artikel anlegen

Jeder Artikel wird in einem neuen Ordner abgelegt nach dem Muster (Datum + Artikelname). Bilder werden im gleichen Artikelordner in dem Unterordner images abgelegt. Der Artikel muss auf .md enden und den gleichen Namen wie der Ordner haben.
Zum Beispiel so: **"artikel/20190617-group-work/20190617-group-work.md"**

```
$(npm bin)/hugo new artikel/20190617-{{deinArtikelName}}/{{deinArtikelName}}.md
```

1. Jeder Artikel braucht einen Titel, einen Slug (URL), Autorenname, einen Beschreibungstext (description), ein Beitragsbild (header_image), ein Social Bild (images), Tags, Categories, Link-Pfad zum Git-Repo usw. Einfach bei den anderen Artikeln abschauen.

2. Categories: Bei den Categories bitte immer zuerst den Schwierigkeitsgrad des Tutorials schreiben (Anfänger, Fortgeschrittene, Experte), dann das Überthema (Design, Architektur, Widget o.ä.) und dann das spezifische Thema (assets, text-to-speech, usw.)

3. Ist der Artikel fertig, belasst ihn auf draft: true. Wir werden ihn dann nach einer Überprüfung veröffentlichen.

4. Autorenprofil anlegen
Wenn ihr einen Artikel geschrieben habt, könnt ihr auch ein dazu gehöriges Autorenprofil anlegen. Geht dazu in content/authors und legt euch dort einen Ordner mit {{vorname}}-{{nachname}} an. Legt darin eine _index.md an. Beachtet den Unterstrich am Anfang. Dieser ist zwingend notwendig. Füllt dann die _index.md mit euren Daten aus. Wie das geht, könnt ihr in den anderen Autorenprofilen abschauen.
Legt im gleichen Ordner noch ein Avatar-Bild von euch ab. Fertig!
