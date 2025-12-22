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

## Attributi dei tag

Gli attributi aggiungono informazioni extra a un tag: seguono sempre il nome del tag, vanno dentro l'apertura e usano la forma `nome="valore"`. Alcuni sono obbligatori (`src` per le immagini), altri opzionali o booleani (es. `required` su un input).

Esempi rapidi:

- Link con descrizione e apertura in nuova scheda:

```html
<a href="https://www.example.com" title="Sito di esempio" target="_blank" rel="noopener">Visita il sito</a>
```

- Immagine con testo alternativo e dimensione:

```html
<img src="foto.jpg" alt="Un tramonto sul mare" width="320" />
```

- Paragrafo con classe personalizzata (utile per CSS):

```html
<p class="evidenziato">Questo paragrafo ha uno stile speciale.</p>
```

E i colori o i font? In teoria li gestisce il CSS, ma per le prove rapide è possibile usare l'attributo `style` direttamente sul tag:

```html
<h1 style="color: darkblue; font-family: Georgia, serif;">Titolo colorato</h1>
<p style="color: #555; font-size: 18px;">Paragrafo con colore e dimensione personalizzati.</p>
```

Usalo solo per esperimenti veloci; nei progetti veri conviene spostare questi stili in un file CSS o in una classe.

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
    <h1 style="color: darkblue; font-family: Georgia, serif;">Benvenuti nella mia homepage</h1>
    <p style="color: #555; font-size: 18px;">Mi chiamo Mario e questa e la mia prima pagina creata in HTML.</p>
    <img src="https://placekitten.com/400/250" alt="Foto di esempio" width="320" />
    <p style="color: #555;">Visita il mio sito preferito:</p>
    <a href="https://www.wikipedia.org" style="color: seagreen; font-weight: bold;">Vai su Wikipedia</a>
  </body>
</html>
```

## Conclusione

- HTML descrive la struttura, non l'aspetto grafico.
- Ogni tag ha una funzione precisa: aprilo, chiudilo e annidalo bene.
- Mantieni il file ordinato e indentato per leggerlo facilmente.
- Frase di chiusura: "Oggi abbiamo imparato a far comparire contenuti sullo schermo. Dalla prossima volta impareremo a organizzarli meglio".



# Lezione 2: liste, immagini avanzate, ancore interne, tabelle

## Prima di iniziare
- Non tradurre la pagina dall'inglese, rischia di creare errori nei tag.
- Recupera il link del tuo progetto su JSFiddle e aprilo.
- Ricordati di salvare spesso.


## `<section>` per organizzare la pagina
- Raggruppa blocchi di contenuto che hanno un tema (es. “Biografia”, “Progetti”, “Contatti”) e li rende più chiari per browser, screen reader e per te che modifichi il codice.
- Regola base: ogni `<section>` dovrebbe avere un titolo interno (di solito `<h2>`). Se la pagina ha un solo grande argomento, l' `<h1>` sta in cima alla pagina e gli `<h2>` sono i titoli delle sezioni.
- Link interni: assegna un `id` alla `<section>` così che sarà possibile riferirsi ad essa per creare dei collegamenti.
- Non abusare delle sezioni per non creare confusione nella struttura della pagina.

```html
<section id="chi-sono">
  <h2>Chi sono</h2>
  <p>Mi chiamo Gabriele, studio informatica e mi piace  il web design.</p>
</section>

<section id="progetti">
  <h2>Progetti</h2>
  <ul>
    <li>Sito per una biblioteca di quartiere</li>
    <li>Portfolio foto di viaggio</li>
  </ul>
</section>

<section id="contatti">
  <h2>Contatti</h2>
  <p>Email: gabriele@example.com</p>
</section>
```

## Liste
- Liste puntate: `<ul>` è il tag che apre e chiude una lista. Ogni elemento della lista è racon `<li>`. Utile per elementi senza ordine preciso.
- Liste numerate: `<ol>` con elementi `<li>`. Utile per sequenze o passi da seguire.
- Liste annidate: è possibile avere elementi `<li>` che contengono delle nuove liste `<ul>` o `<ol>` per creare delle sotto-voci. Ricorda di chiudere correttamente tutti i tag.

```html
<section id="cose-da-fare">
  <h2>Cose da fare nel weekend</h2>
  <ul>
    <li>Visitare il museo</li>
    <li>Provare un ristorante
      <ol>
        <li>Cercare recensioni</li>
        <li>Prenotare il tavolo</li>
      </ol>
    </li>
    <li>Allenamento corsa 5 km</li>
  </ul>
</section>
```

## Immagini avanzate
- Attributo obbligatorio `alt="testo descrittivo"`. Viene in nostro aiuto se l'immagine non si dovesse caricare, oppure per i lettori di schermo usati da persone con disabilità visive.
- Dimensioni: usa `width` e/o `height` in pixel per ridimensionare l'immagine a piacimento. Per ridimensionarla senza distorsioni, usa solo uno dei due e lascia l’altro vuoto. Esempio: `width="300"` ridimensiona l'immagine a 300 pixel di larghezza mantenendo le proporzioni originali.

```html
<section id="galleria">
  <h2>Galleria</h2>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/SelbstPortrait_VG2.jpg"
       alt="Ritratto dell'autore del sito"
       width="400" />
</section>
```

## Ancore interne (link interni alla stessa pagina)
- Aggiungi un `id` al blocco di destinazione.
- Crea un link con `href="#id"` per saltare a quel punto.
- Con il tag `<nav>` puoi racchiudere i link di navigazione principali della pagina in una sezione dedicata.

```html
<nav>
  <a href="#cose-da-fare">Cose da fare</a>
  <a href="#galleria">Galleria</a>
  <a href="#contatti">Contatti</a>
</nav>

<section id="contatti">
  <h2>Contatti</h2>
  <p>Email: autore@example.com</p>
</section>
```


## Tabelle
- Struttura base: `<table>` contiene righe `<tr>`, intestazioni `<th>`, celle `<td>`.
- Intestazione separata: racchiudi i titoli in `<thead>`, i dati in `<tbody>`.
- Titolo tabella facoltativo: `<caption>`.

```html
<section id="programma">
  <h2>Programma settimana</h2>
  <table>
    <caption>Attività principali</caption>
    <thead>
      <tr>
        <th>Giorno</th>
        <th>Attività</th>
        <th>Durata</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Lunedì</td>
        <td>Studio HTML</td>
        <td>1h</td>
      </tr>
      <tr>
        <td>Mercoledì</td>
        <td>Scrittura contenuti</td>
        <td>1h</td>
      </tr>
    </tbody>
  </table>
</section>
```

## Esercizio
1) Aggiungi almeno una lista puntata e una numerata in sezioni diverse del tuo sito.
2) Inserisci almeno due immagini: entrambe con `alt` significativo e dimensione impostata.
3) Crea un piccolo menu con ancore interne che porti alle tue sezioni principali (almeno 3 link).
4) Aggiungi una tabella con almeno 3 colonne e 4 righe di dati reali per il tuo tema (es. elenco prodotti, orario settimanale, tappe di viaggio).
5) Inserisci un `<caption>` descrittivo.


# Lezione 3: HTML5 multimedia

## Perche usare `<video>` e `<audio>`
HTML5 permette di inserire contenuti multimediali senza plugin esterni.
Il browser gestisce direttamente riproduzione, pausa e volume.

## Tag `<video>`
Struttura base:

```html
<video src="video.mp4" controls></video>
```

Attributi principali:
- `controls`: mostra i comandi di riproduzione.
- `width` e `height`: dimensioni del video.
- `autoplay`: parte automaticamente (attenzione).
- `loop`: ripete il video.
- `muted`: audio disattivato.

Esempio completo:

```html
<video src="video.mp4" controls width="400">
  Il tuo browser non supporta il video.
</video>
```

## Tag `<audio>`
Struttura base:

```html
<audio src="audio.mp3" controls></audio>
```

Esempio:

```html
<audio src="musica.mp3" controls>
  Il tuo browser non supporta l'audio.
</audio>
```

## Uso corretto dei media
- Non avviare audio o video automaticamente.
- Usa dimensioni ragionevoli.
- Inserisci sempre una frase di fallback tra i tag.

Esempio con sezione multimedia:

```html
<section id="media">
  <h2>Contenuti multimediali</h2>

  <p>Video di presentazione:</p>
  <video src="presentazione.mp4" controls width="400"></video>

  <p>Audio di sottofondo:</p>
  <audio src="intro.mp3" controls></audio>
</section>
```

## Esercizio
1) Inserisci un video e un audio nella tua pagina.
2) Usa `controls` su entrambi.
3) Racchiudi i media in una `<section>` con titolo.
4) Imposta almeno una dimensione sul video.
