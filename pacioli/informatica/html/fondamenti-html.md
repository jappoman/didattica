# Lezione 1 - HTML: primi passi pratici

## Perchè ci serve l'HTML

HTML (HyperText Markup Language) descrive il contenuto di una pagina web. Il browser legge i tag e li trasforma in titoli, paragrafi, link, immagini. Non decide i colori o i font (quello lo fa il CSS) ma si concentra solo sulla struttura.

Un tag ha quasi sempre un'apertura e una chiusura:

```html
<p>Ciao!</p>
```

## Struttura minima di una pagina

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>La mia prima pagina</title>
  </head>
  <body>
    <h1>Benvenuti nella mia pagina</h1>
    <p>Questo e il mio primo paragrafo HTML.</p>
  </body>
</html>
```

Ecco cosa fanno le varie righe:

- `<!DOCTYPE html>`: dice al browser che il documento segue lo standard HTML5.
- `<html>`: è l'elemento radice che racchiude tutto il resto (testa e corpo della pagina).
- `<head>`: area non visibile che contiene metadati e collegamenti (charset, titolo, CSS, script).
- `<meta charset="UTF-8">`: definisce la codifica dei caratteri; con UTF-8 puoi usare lettere accentate e simboli senza problemi.
- `<title>`: testo che appare nella scheda del browser e nei preferiti; aiuta anche i motori di ricerca a capire il titolo della pagina.
- `<body>`: la parte visibile all'utente; qui vanno titoli, paragrafi, immagini, link, liste e tutti i contenuti.

## Tag fondamentali

- Titoli: `<h1>` (principale) e `<h2>` (sottotitolo). È possibile usare fino a 6 livelli in totale, da `<h1>` a `<h6>`.
- Paragrafi: `<p>Testo del paragrafo</p>`. Testo normale diviso in blocchi.
- Link: `<a href="https://www.example.com" title="Descrizione del link">Visita il sito</a>`.
  - Attributi utili: `href` per la destinazione, `title` come nota breve (tooltip).
- Immagini: `<img src="immagine.jpg" alt="Descrizione" width="320" />`.
  - Attributi utili: `src` (posizione del file o URL), `alt` (testo alternativo), `width`/`height` per ridimensionare rapidamente l'immagine.
  - Il tag non ha chiusura; si chiude da solo.

## Dove scrivere il codice HTML

Useremo https://jsfiddle.net/ per fare i primi passi. Nel pannello HTML scrivere solo il contenuto del `body`: non servono `<!DOCTYPE>`, `<html>`, `<head>` e `<body>` per queste prove. Aggiungere i tag direttamente come comparirebbero dentro il `body`.

Esempio minimo in JSFiddle (solo corpo):

```html
<h1>Benvenuti nella mia pagina</h1>
<p>Questo e il mio primo paragrafo HTML.</p>
<img src="https://example.com/foto.jpg" alt="Foto di esempio" width="200" />
<p>Visita il mio sito preferito:</p>
<a href="https://www.wikipedia.org">Vai su Wikipedia</a>
```

## Mini esercizio guidato

Crea una mini homepage personale con:

- un titolo
- una breve descrizione
- un'immagine (link online)
- un link a un sito a scelta

Esempio completo (versione file .html):

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Homepage di Mario Rossi</title>
  </head>
  <body>
    <h1>Benvenuti nella mia homepage</h1>
    <p>Mi chiamo Mario e questa e la mia prima pagina creata in HTML.</p>
    <img src="https://placekitten.com/400/250" alt="Foto di esempio" width="320" />
    <p>Visita il mio sito preferito:</p>
    <a href="https://www.wikipedia.org">Vai su Wikipedia</a>
  </body>
</html>
```

## Conclusione

- HTML descrive la struttura, non l'aspetto grafico.
- Ogni tag ha una funzione precisa: aprilo, chiudilo e annidalo bene.
- Mantieni il file ordinato e indentato per leggerlo facilmente.
- Frase di chiusura: "Oggi abbiamo imparato a far comparire contenuti sullo schermo. Dalla prossima volta impareremo a organizzarli meglio".
