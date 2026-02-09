# Lezione 1 - HTML: primi passi pratici

## Perchè ci serve l'HTML

HTML (HyperText Markup Language) è un linguaggio di markup, cioè un linguaggio che usa dei tag per descrivere la struttura e il significato dei contenuti di una pagina web. Il browser legge i tag e li trasforma in titoli, paragrafi, link, immagini. Non decide i colori o i font (quello lo fa il CSS) ma si concentra solo sulla struttura.

Un tag ha quasi sempre un'apertura e una chiusura:

```html
<p>Ciao!</p>
```

Un tag HTML è un elemento che indica al browser che tipo di contenuto stiamo scrivendo. La maggior parte dei tag è composta da:

- un tag di apertura
- un contenuto
- un tag di chiusura

L'insieme formato da tag di apertura, contenuto e tag di chiusura si chiama elemento HTML.

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
    <p>Questo è il mio primo paragrafo HTML.</p>
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

Gli attributi HTML sono informazioni aggiuntive associate a un tag e servono a specificarne il comportamento o le caratteristiche. Seguono sempre il nome del tag, vanno dentro l'apertura e usano la forma `nome="valore"`. Alcuni sono obbligatori (`src` per le immagini), altri opzionali o booleani (es. `required` su un input).

Esempi rapidi:

- Link con descrizione e apertura in nuova scheda:

```html
<a
  href="https://www.example.com"
  title="Sito di esempio"
  target="_blank"
  rel="noopener"
  >Visita il sito</a
>
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
<p style="color: #555; font-size: 18px;">
  Paragrafo con colore e dimensione personalizzati.
</p>
```

Usalo solo per esperimenti veloci; nei progetti veri conviene spostare questi stili in un file CSS o in una classe.

## Dove scrivere il codice HTML

Useremo https://jsfiddle.net/ per fare i primi passi. Nel pannello HTML scrivere solo il contenuto del `body`: non servono `<!DOCTYPE>`, `<html>`, `<head>` e `<body>` per queste prove. Aggiungere i tag direttamente come comparirebbero dentro il `body`.

Esempio minimo in JSFiddle (solo corpo):

```html
<h1>Benvenuti nella mia pagina</h1>
<p>Questo è il mio primo paragrafo HTML.</p>
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
    <h1 style="color: darkblue; font-family: Georgia, serif;">
      Benvenuti nella mia homepage
    </h1>
    <p style="color: #555; font-size: 18px;">
      Mi chiamo Mario e questa è la mia prima pagina creata in HTML.
    </p>
    <img
      src="https://placekitten.com/400/250"
      alt="Foto di esempio"
      width="320"
    />
    <p style="color: #555;">Visita il mio sito preferito:</p>
    <a
      href="https://www.wikipedia.org"
      style="color: seagreen; font-weight: bold;"
      >Vai su Wikipedia</a
    >
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
  <p>Mi chiamo Gabriele, studio informatica e mi piace il web design.</p>
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

- Liste puntate: `<ul>` è il tag che apre e chiude una lista. Ogni elemento della lista è racchiuso in `<li>`. Utile per elementi senza ordine preciso.
- Liste numerate: `<ol>` con elementi `<li>`. Utile per sequenze o passi da seguire.
- Liste annidate: è possibile avere elementi `<li>` che contengono delle nuove liste `<ul>` o `<ol>` per creare delle sotto-voci. Ricorda di chiudere correttamente tutti i tag.

```html
<section id="cose-da-fare">
  <h2>Cose da fare nel weekend</h2>
  <ul>
    <li>Visitare il museo</li>
    <li>
      Provare un ristorante
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
  <img
    src="https://upload.wikimedia.org/wikipedia/commons/6/6b/SelbstPortrait_VG2.jpg"
    alt="Ritratto dell'autore del sito"
    width="400"
  />
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
    <caption>
      Attività principali
    </caption>
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

1. Aggiungi almeno una lista puntata e una numerata in sezioni diverse del tuo sito.
2. Inserisci almeno due immagini: entrambe con `alt` significativo e dimensione impostata.
3. Crea un piccolo menù con ancore interne che porti alle tue sezioni principali (almeno 3 link).
4. Aggiungi una tabella con almeno 3 colonne e 4 righe di dati reali per il tuo tema (es. elenco prodotti, orario settimanale, tappe di viaggio).
5. Inserisci un `<caption>` descrittivo.

# Lezione 3: HTML5 multimedia

## Perchè usare `<video>` e `<audio>`

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

Se vuoi incorporare un video di YouTube non usare `<video>`, ma un `<iframe>` con il codice di incorporamento:

```html
<iframe
  width="560"
  height="315"
  src="https://www.youtube.com/embed/dQw4w9WgXcQ?si=JA_VG0TCtxwuzIlN"
  title="YouTube video player"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
  allowfullscreen
>
</iframe>
```

Un `<iframe>` e' una "finestra" che inserisce una pagina esterna dentro la tua pagina. Gli attributi principali qui sono:

- `width` e `height`: dimensioni dell'area video.
- `src`: URL del video incorporato.
- `title`: descrizione per l'accessibilita.
- `allow`: permessi concessi al player (es. autoplay, fullscreen, ecc.).
- `allowfullscreen`: abilita il pulsante schermo intero.

## Tag `<audio>`

Struttura base:

```html
<audio src="audio.mp3" controls></audio>
```

Esempio:

```html
<audio src="musica.mp3" controls>Il tuo browser non supporta l'audio.</audio>
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

1. Inserisci un video e un audio nella tua pagina.
2. Usa `controls` su entrambi.
3. Racchiudi i media in una `<section>` con titolo.
4. Imposta almeno una dimensione sul video.

# Lezione 4: Form HTML

## A cosa serve un form

Un form raccoglie dati inseriti dall'utente e li invia a un server. Anche senza server, è utile per imparare la struttura e i campi di input.

## Struttura base con `<form>`

Il tag `<form>` contiene tutti i campi. Gli attributi principali:

- `action`: dove inviare i dati (URL).
- `method`: come inviarli (`get` o `post`). Il metodo `get` aggiunge i dati all'URL, `post` li invia in modo nascosto.

```html
<form action="https://formtester.goodbytes.be/post.php" method="post">
  <!-- campi qui dentro -->
</form>
```

Esempio di url quando viene usato il metodo `get`:

```
https://formtester.goodbytes.be/post.php?nome=Mario&cognome=Rossi
```

## Campi essenziali

- `<label>`: descrive il campo; si collega con `for` uguale all'`id` dell'input.
- `<input type="text">`: testo breve (nome, cognome).
- `<input type="email">`: email con validazione base del browser.
- `<input type="password">`: password (testo nascosto).
- `<input type="number">`: numeri (con frecce per aumentare/diminuire).
- `<input type="date">`: selezione data (calendario).
- `<input type="time">`: selezione ora (ora, minuto, secondo).
- `<input type="checkbox">`: scelta multipla (opzioni selezionabili).
- `<input type="radio">`: scelta singola (opzioni esclusive).
- `<select>` e `<option>`: menù a tendina.
- `<textarea>`: testo lungo (messaggio).
- `<button type="submit">`: invia il form.

## Attributo `required`

`required` è un attributo booleano: se presente, il browser blocca l'invio finché il campo non è compilato.
Puoi usarlo su `input` e `textarea` quando un dato è obbligatorio.

## Altri attributi utili

- `placeholder`: suggerisce cosa scrivere nel campo (testo guida, sparisce quando si digita).
- `name`: è il nome con cui il dato viene inviato al server; senza `name` il campo non viene inviato.
- `id`: serve per collegare il `label` con `for` ed è utile per CSS/Javascript.
- `value`: valore predefinito del campo (utile per esempi o moduli precompilati).
- `maxlength`: limita il numero massimo di caratteri.
- `minlength`: imposta un minimo di caratteri (supporto moderno).
- `rows` e `cols` su `<textarea>`: definiscono altezza (righe) e larghezza (colonne). Di solito si usa `rows` e si lascia la larghezza al CSS.

Esempio di form contatto con i campi essenziali:

```html
<form action="https://formtester.goodbytes.be/post.php" method="post">
  <label for="nome">Nome</label>
  <input type="text" id="nome" name="nome" required />

  <label for="email">Email</label>
  <input type="email" id="email" name="email" required />

  <label for="messaggio">Messaggio</label>
  <textarea id="messaggio" name="messaggio" rows="4"></textarea>

  <label for="telefono">Telefono</label>
  <input type="tel" id="telefono" name="telefono" required />

  <label for="numero">Numero</label>
  <input type="number" id="numero" name="numero" required />

  <label for="data">Data</label>
  <input type="date" id="data" name="data" required />

  <label for="ora">Ora</label>
  <input type="time" id="ora" name="ora" required />

  <button type="submit">Invia</button>
</form>
```

Per simulare il server che riceve i dati, questo `action` invia il form a una pagina di test che mostra
subito tutti i campi ricevuti. Se hai dimenticato un `name` o lo hai scritto male, lo vedi subito.

## Esercizio

1. Crea un form "Iscrizione a un laboratorio" con `method="post"` e `action="https://formtester.goodbytes.be/post.php"`.
2. Inserisci questi campi, tutti con `label` collegato tramite `for` e `id`:
   - Nome e cognome (`type="text"`), con `placeholder`, `maxlength="30"` e `required`.
   - Email (`type="email"`), con `placeholder` e `required`.
   - Password di accesso (`type="password"`), con `minlength="8"` e `placeholder`.
   - Età (`type="number"`), con `min="14"` e `max="99"`.
   - Data di nascita (`type="date"`).
   - Orario preferito (`type="time"`).
3. Inserisci un `<textarea>` per "note aggiuntive" con `rows="6"` e `cols="40"`, con `placeholder`.
4. Aggiungi un campo `tel` facoltativo con `placeholder` e `name` corretto.
5. Imposta un valore predefinito (`value`) per almeno un campo.
6. Chiudi con un bottone `type="submit"` con testo "Invia iscrizione".

Per provarlo senza server, imposta `method="post"` e `action="https://formtester.goodbytes.be/post.php"`.
Quando invii il form, la pagina di test mostra i dati ricevuti.

# Lezione 5: Form HTML - scelte

## Scelta singola e scelta multipla

- Scelta singola: si usa `<input type="radio">` con lo stesso `name`.
- Scelta multipla: si usa `<input type="checkbox">` e si possono selezionare più opzioni (stesso `name[]`).
- Scelta da menù a tendina: si usa `<select>` con più `<option>`.

## Radio (scelta singola)

Stesso `name`, `value` diverso per ogni opzione.

```html
<p>Metodo di contatto preferito:</p>
<label><input type="radio" name="contatto" value="email" /> Email</label>
<label><input type="radio" name="contatto" value="telefono" /> Telefono</label>
```

## Checkbox (scelta multipla)

Ogni checkbox ha lo stesso `name[]` se vuoi inviare un elenco di preferenze. Il server riceve tutti i valori selezionati come lista.

```html
<p>Argomenti di interesse:</p>
<label><input type="checkbox" name="interessi[]" value="html" /> HTML</label>
<label><input type="checkbox" name="interessi[]" value="css" /> CSS</label>
<label
  ><input type="checkbox" name="interessi[]" value="js" /> JavaScript</label
>
```

## Select (menù a tendina)

```html
<label for="corso">Scegli un corso:</label>
<select id="corso" name="corso">
  <option value="html">Corso HTML</option>
  <option value="css">Corso CSS</option>
  <option value="js">Corso JavaScript</option>
</select>
```

## Esempio di estensione del form

```html
<form action="https://formtester.goodbytes.be/post.php" method="post">
  <label for="nome">Nome</label>
  <input type="text" id="nome" name="nome" />

  <p>Metodo di contatto preferito:</p>
  <label><input type="radio" name="contatto" value="email" /> Email</label>
  <label
    ><input type="radio" name="contatto" value="telefono" /> Telefono</label
  >

  <p>Argomenti di interesse:</p>
  <label><input type="checkbox" name="interessi[]" value="html" /> HTML</label>
  <label><input type="checkbox" name="interessi[]" value="css" /> CSS</label>

  <label for="corso">Scegli un corso:</label>
  <select id="corso" name="corso">
    <option value="html">Corso HTML</option>
    <option value="css">Corso CSS</option>
    <option value="js">Corso JavaScript</option>
  </select>

  <button type="submit">Invia</button>
</form>
```

Anche qui, l'`action` punta alla pagina di test: dopo l'invio vedrai quali `name` sono arrivati e con che valore.
Serve per verificare che radio e checkbox abbiano i nomi corretti.

## Esercizio

1. Aggiungi all'esercizio precedente uno o più scelte singole con radio (es. metodo di contatto).
2. Aggiungi una scelta multipla con checkbox (es. preferenze).
3. Aggiungi una selezione da menù a tendina (es. corso di laurea).

Per verificare i dati, imposta `method="post"` e `action="https://formtester.goodbytes.be/post.php"`.
Dopo l'invio, la pagina di test elenca tutte le scelte inviate dal form.

# Lezione 6: CSS

## Cos'è il CSS

Il CSS (Cascading Style Sheets) serve per definire l'aspetto grafico della pagina web: colori, font, spazi, dimensioni e bordi. L'HTML dice che cosa c'è nella pagina, il CSS dice come appare.

## Dove si scrive il CSS

In JSFiddle ci sono tre riquadri principali: HTML, CSS e JS. Quando fai gli esercizi, il CSS va scritto nell'apposito riquadro CSS, non dentro l'HTML.

## Sintassi base del CSS

Una regola CSS è composta da un selettore e un blocco di dichiarazioni:

```css
selettore {
  proprieta1: valore1;
  proprieta2: valore2;
}
```

Esempio:

```css
h1 {
  color: darkblue;
  font-family: Georgia, serif;
}
```

Nell'esempio, `h1` è il selettore (tutti gli elementi `<h1>`), `color` e `font-family` sono le proprietà, e `darkblue` e `Georgia, serif` sono i valori assegnati a quelle proprietà.

## Selettori: come scegliere cosa stilizzare

Un selettore indica quali elementi della pagina devono ricevere le regole CSS.

Selettori base:

- Tag singoli: `h1`, `p`, `ul` (tutti gli elementi di quel tipo).
- Classe: `.evidenziato` (tutti gli elementi con class="evidenziato"). Una classe è un'etichetta riutilizzabile che puoi assegnare a più elementi per applicare lo stesso stile.
- ID: `#titolo` (un elemento con id="titolo", di solito unico).

Selettori avanzati:

- Combinati: `p.evidenziato` (solo i paragrafi con quella classe).
- Discendenti: `section p` (tutti i p dentro una section).
- Gruppi: `h1, h2, h3` (stessa regola per più tag).

## Collegamento tra HTML e selettori CSS

Il CSS non funziona da solo: per applicare uno stile deve “agganciarsi” agli elementi HTML tramite i selettori.
Per questo motivo, nel codice HTML possono comparire `tag`, `classi` e `id`, che servono esclusivamente a permettere al CSS di individuare gli elementi da stilizzare.

### Tag HTML

Ogni elemento HTML ha un nome di tag (h1, p, div, ul, li, ecc.).
Un selettore per tag applica lo stile a tutti gli elementi di quel tipo presenti nella pagina.

Esempio:

```css
p {
  color: blue;
}
```

Tutti i paragrafi p della pagina verranno stilizzati.

### Classi

Una classe è un’etichetta assegnata a uno o più elementi HTML tramite l’attributo `class`. Le classi servono per applicare uno stile solo ad alcuni elementi, non a tutti.

Esempio:

```html
<p class="testo-importante">Testo</p>
```

Selettore CSS corrispondente:

```css
.testo-importante {
  background-color: yellow;
}
```

La classe può essere riutilizzata più volte nella pagina.

### ID

Un id identifica un elemento specifico della pagina ed è pensato per essere unico.

Esempio:

```html
<h1 id="titolo">Titolo</h1>
```

Selettore CSS:

```css
#titolo {
  text-align: center;
}
```

## Il tag div

`<div>` è un contenitore generico usato per raggruppare altri elementi HTML. Non ha significato semantico, ma è utile per applicare stili CSS o per organizzare il layout. Esempio:

HTML:

```html
<div class="card">
  <h2>Titolo della card</h2>
  <p>Contenuto della card.</p>
</div>
```

Selettore CSS:

```css
.card {
  border: 1px solid #ccc;
  padding: 16px;
  background-color: #f9f9f9;
}
```

In questo caso abbiamo creato una "card" stilizzata usando un `<div>` con una classe.

## Proprietà CSS principali

Testo e titoli

- color: imposta il colore del testo. Esempio: `color: #333333;`.
- font-family: sceglie il carattere tipografico. Esempio: `font-family: "Arial", sans-serif;`.
- font-size: dimensione del testo. Esempio: `font-size: 18px;`.
- font-weight: spessore del testo (normale, grassetto). Esempio: `font-weight: bold;` o `font-weight: 600;`.
- text-align: allinea il testo. Esempio: `text-align: center;`.
- line-height: distanza tra le righe. Esempio: `line-height: 1.5;`.
- letter-spacing: spazio tra le lettere. Esempio: `letter-spacing: 1px;`.

Spaziatura e contenitore

- margin: spazio esterno tra l'elemento e gli altri. Esempio: `margin: 16px;`.
- padding: spazio interno tra contenuto e bordo. Esempio: `padding: 12px;`.
- border: bordo con spessore, stile e colore. Esempio: `border: 1px solid #ccc;`.
- border-radius: arrotonda gli angoli. Esempio: `border-radius: 8px;`.
- background-color: colore di sfondo. Esempio: `background-color: #f0f0f0;`.

Link

- color: colore del link. Esempio: `color: #c15a00;`.
- text-decoration: decorazione del testo del link. Esempio: `text-decoration: underline;`.
- font-weight: spessore del testo del link. Esempio: `font-weight: bold;`.
- cursor: cursore del mouse sopra il link. Esempio: `cursor: pointer;`.

Liste

- list-style-type: tipo di pallino o numerazione. Esempio: `list-style-type: square;` o `list-style-type: decimal;`.
- margin: spazio esterno della lista. Esempio: `margin: 12px 0;`.
- padding: spazio interno della lista. Esempio: `padding: 20px;`.

Tabelle

- border: bordo di tabella e celle. Esempio: `border: 1px solid #999;`.
- padding: spazio interno delle celle. Esempio: `padding: 8px;`.
- text-align: allinea testo nelle celle. Esempio: `text-align: left;`.
- background-color: colore di sfondo di righe o intestazioni. Esempio: `background-color: #f9f9f9;`.

Form, input e bottoni

- font-family: font dei campi e dei bottoni. Esempio: `font-family: "Arial", sans-serif;`.
- font-size: dimensione del testo. Esempio: `font-size: 16px;`.
- padding: spazio interno dei campi. Esempio: `padding: 8px 10px;`.
- border: bordo dei campi. Esempio: `border: 1px solid #ccc;`.
- border-radius: angoli arrotondati. Esempio: `border-radius: 6px;`.
- background-color: colore di sfondo. Esempio: `background-color: #ffffff;`.

## Esempio completo (da copiare nel riquadro CSS di JSFiddle)

Applica questo CSS nella sezione CSS di JSFiddle:

```css
h1 {
  color: #1f4e79;
  text-align: center;
  letter-spacing: 1px;
}

p {
  line-height: 1.6;
  margin: 12px;
  color: #333333;
}

.card {
  background-color: #ffffff;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 16px;
}

a {
  color: #c15a00;
  text-decoration: none;
  font-weight: bold;
  cursor: pointer;
}

li {
  margin: 6px;
}

.testo-importante {
  background-color: #fff3b0;
  padding: 4px 8px;
  border: 4px solid #f0b429;
}
```

Poi utilizza questo HTML di esempio da mettere nel riquadro HTML di JSFiddle:

```html
<h1 id="titolo">Mini pagina di prova</h1>

<div class="card">
  <p>Questo è un paragrafo introduttivo.</p>

  <p class="testo-importante">
    Questo paragrafo sarà reso evidenziato tramite CSS.
  </p>

  <p>Visita il mio <a href="https://www.wikipedia.org">sito preferito</a>.</p>

  <h2>Lista di cose</h2>
  <ul>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
  </ul>
</div>
```

## Esercizio

1. Cancella il CSS dell'esempio precedente e mantieni solo l'HTML.
1. Crea almeno 3 selettori diversi: uno per tag uno per classe e uno per id.
1. Applica almeno 6 proprietà diverse (es. color, background-color, font-size, margin, padding, border).
1. Aggiungi una classe a un paragrafo e rendilo "evidenziato" con sfondo, bordo e padding.
1. Fai in modo che la pagina sia più leggibile aumentando spazi e line-height.

# Lezione 7: JavaScript

## Cos'è JavaScript

JavaScript è il linguaggio che rende una pagina web interattiva. Se HTML struttura i contenuti e CSS li rende belli, JavaScript aggiunge comportamenti: click, messaggi, aggiornamenti del testo, controlli sui dati. È un linguaggio di programmazione client side: viene eseguito direttamente dal browser dell'utente, senza bisogno di server.

## Dove scrivere JavaScript in JSFiddle

In JSFiddle usa il pannello `JS` per il codice JavaScript e il pannello `HTML` per gli elementi della pagina.
Quando vuoi collegare JavaScript a un elemento HTML, assegna un `id` e recuperalo con JavaScript, così come abbiamo imparato con il CSS.

## Primo concetto fondamentale: JavaScript aspetta eventi e lavora su elementi già presenti

JavaScript rimane in attesa finché non si verifica un evento. Un evento è un'azione dell'utente, come un click, un passaggio del mouse o la pressione di un tasto. Quando l'evento si verifica, JavaScript esegue una funzione associata a quell'evento.

JavaScript non può modificare un elemento HTML che non esiste ancora. Per questo motivo, è importante seguire un flusso logico: prima creare l'elemento in HTML, poi assegnargli un `id`, poi selezionarlo in JavaScript e infine modificarlo o assegnargli un comportamento.

Il flusso è sempre questo:

1. creo l’elemento in HTML
2. gli assegno un `id`
3. lo seleziono in JavaScript
4. lo modifico o gli assegno un comportamento

## Concetti base

### Variabili

Una variabile serve per **memorizzare un valore**. Esempio:

```javascript
let nome = "Luca";
```

Qui stiamo dicendo: creo una variabile che si chiama `nome` e dentro ci metto la scritta Luca. In JavaScript si usano spesso le variabili per salvare riferimenti agli elementi HTML, così da poterli modificare. Nel caso di variabili che rappresentano elementi HTML, è comune usare `const` (constant) invece di `let`, perché non cambieranno mai (non cambierà il riferimento all'elemento, anche se il contenuto dell'elemento può essere modificato). Esempio:

```javascript
const titolo = document.getElementById("titolo");
```

### Funzioni

Una funzione è un blocco di codice che viene eseguito solo quando richiesto. La sintassi è questa:

```javascript
function saluta() {
  console.log("Ciao!");
}
```

`function` è la parola chiave per definire una funzione, `saluta` è il nome della funzione, tra le parentesi tonde ci vanno gli eventuali parametri della funzione e tra le parentesi graffe `{}` c'è il codice che verrà eseguito quando la funzione viene chiamata.

In questo caso, questa funzione scrive il messaggio "Ciao!" nella console del browser quando viene chiamata. Finchè non viene chiamata, non fa nulla.

### Eventi

Un evento è un’azione dell’utente. Può essere ad esempio:

- click
- passaggio del mouse
- pressione di un tasto

JavaScript ascolta questi eventi e reagisce eseguendo una funzione.

## Le 3 operazioni fondamentali in JavaScript

Per iniziare con JavaScript è necessario conoscere almeno queste tre operazioni fondamentali:

### 1. Selezionare un elemento HTML

```javascript
const elemento = document.getElementById("id-elemento");
```

Serve per creare un riferimento JavaScript ad un elemento della pagina.

### 2. Reagire a un’azione dell’utente

```javascript
elemento.addEventListener("click", funzione);
```

Dice al browser di eseguire una funzione quando l’utente compie un’azione. La sintassi è `elemento.metodo(parametri)`. In questo caso, `addEventListener` è un metodo che permette di ascoltare un evento specifico (in questo caso, "click") su un elemento HTML. Quando l'utente clicca su quell'elemento, la funzione specificata come secondo parametro viene eseguita. Bisogna ricordarsi di definire in precedenza la funzione.

### 3. Modificare il testo di un elemento

```javascript
elemento.textContent = "Nuovo testo";
```

Cambia il testo visibile nella pagina di quell'elemento. Nota come la sintassi sia `elemento.proprietà = valore`. In questo caso, `textContent` è la proprietà che rappresenta il testo di un elemento HTML, e noi stiamo assegnando a quella proprietà un nuovo valore, che è la stringa "Nuovo testo". Dopo questa operazione, il testo mostrato nella pagina per quell'elemento cambierà in "Nuovo testo". Questa istruzione va inserita all'interno di una funzione che viene chiamata quando si verifica un evento, come un click.

## Lista delle principali proprietà e metodi per lavorare con elementi HTML

In JavaScript:

- le proprietà si modificano con `=`
- gli stili CSS si modificano tramite `elemento.style.proprietàCSS`

Ecco alcuni esempi di proprietà e metodi utili:

- `elemento.textContent = "..."` cambia il testo di un elemento. Esempio: `elemento.textContent = "Ciao mondo!";`
- `elemento.style.color = "...";` cambia il colore del testo. Esempio: `elemento.style.color = "red";`
- `elemento.style.backgroundColor = "...";` cambia il colore di sfondo. Esempio: `elemento.style.backgroundColor = "yellow";`
- `elemento.style.fontSize = "...";` cambia la dimensione del testo. Esempio: `elemento.style.fontSize = "20px";`
- `elemento.style.display = "...";` cambia il modo in cui l'elemento viene visualizzato. Esempio: `elemento.style.display = "none";` nasconde l'elemento, `elemento.style.display = "block";` lo mostra.
- `bottone.disabled = true;` disabilita un bottone, rendendolo non cliccabile. Esempio: `bottone.disabled = true;` disabilita il bottone, mentre `bottone.disabled = false;` lo riabilita.

## Esempio pratico: bottone che cambia testo

Copia e incolla questo codice in JSFiddle per vedere come funziona.

HTML (pannello HTML in JSFiddle):

```html
<h1>Mini prova JavaScript</h1>
<p id="messaggio">Premi il bottone per cambiare questo testo.</p>
<button id="bottone-saluto">Clicca qui</button>
```

Qui abbiamo:

- un paragrafo con id="messaggio"

- un bottone con id="bottone-saluto"

Gli id servono a JavaScript per riconoscere questi elementi.

JavaScript (pannello JS in JSFiddle):

```javascript
const bottone = document.getElementById("bottone-saluto");
const messaggio = document.getElementById("messaggio");

function aggiornaMessaggio() {
  messaggio.textContent = "Ottimo! Hai appena eseguito il tuo primo script.";
}

bottone.addEventListener("click", aggiornaMessaggio);
```

Vediamo riga per riga che cosa fa questo codice:

```javascript
const bottone = document.getElementById("bottone-saluto");
```

Seleziona il bottone HTML e lo salva nella variabile bottone.

```javascript
const messaggio = document.getElementById("messaggio");
```

Seleziona il paragrafo HTML.

```javascript
function aggiornaMessaggio() {
  messaggio.textContent = "...";
}
```

Definisce una funzione che cambia il testo del paragrafo.

```javascript
bottone.addEventListener("click", aggiornaMessaggio);
```

Dice al browser: “Quando l’utente clicca il bottone, esegui la funzione”. Quando l'utente cliccherà sul bottone, il testo del paragrafo cambierà in "Ottimo! Hai appena eseguito il tuo primo script.".

## Esercizio

1. Crea in HTML un titolo, un paragrafo con `id="stato"` e un bottone con `id="azione"`.
2. In JavaScript seleziona i due elementi con `getElementById`.
3. Al click del bottone cambia il testo del paragrafo in "Interazione riuscita".
4. Come estensione, cambia anche il colore del testo del paragrafo usando JavaScript (esempio: `stato.style.color = "green";`).
