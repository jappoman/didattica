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
    <h1 style="color: darkblue; font-family: Georgia, serif;">Benvenuti nella mia homepage</h1>
    <p style="color: #555; font-size: 18px;">Mi chiamo Mario e questa è la mia prima pagina creata in HTML.</p>
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
- Liste puntate: `<ul>` è il tag che apre e chiude una lista. Ogni elemento della lista è racchiuso in `<li>`. Utile per elementi senza ordine preciso.
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
width="560" height="315"
src="https://www.youtube.com/embed/dQw4w9WgXcQ?si=JA_VG0TCtxwuzIlN" title="YouTube video player"
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
allowfullscreen>
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

## Campi essenziali
- `<label>`: descrive il campo; si collega con `for` uguale all'`id` dell'input.
- `<input type="text">`: testo breve (nome, cognome).
- `<input type="email">`: email con validazione base del browser.
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

Esempio minimale di form contatto:

```html
<form action="https://formtester.goodbytes.be/post.php" method="post">
  <label for="nome">Nome</label>
  <input type="text" id="nome" name="nome" required>

  <label for="email">Email</label>
  <input type="email" id="email" name="email" required>

  <label for="messaggio">Messaggio</label>
  <textarea id="messaggio" name="messaggio" rows="4"></textarea>

  <button type="submit">Invia</button>
</form>
```

Per simulare il server che riceve i dati, questo `action` invia il form a una pagina di test che mostra
subito tutti i campi ricevuti. Se hai dimenticato un `name` o lo hai scritto male, lo vedi subito.


## Esercizio
1) Crea un form per "richiesta informazioni" con nome, email, oggetto e messaggio.
2) Collega ogni `label` al suo campo con `for` e `id`.
3) Aggiungi `required` a nome ed email.
4) Imposta `rows="6"` sul `textarea`.
5) Inserisci un bottone "Invia".

Per provarlo senza server, imposta `method="post"` e `action="https://formtester.goodbytes.be/post.php"`.
Quando invii il form, la pagina di test mostra i dati ricevuti.



# Lezione 5: Form HTML - scelte

## Scelta singola e scelta multipla
- Scelta singola: si usa `<input type="radio">` con lo stesso `name`.
- Scelta multipla: si usa `<input type="checkbox">` e si possono selezionare più opzioni.

## Radio (scelta singola)
Stesso `name`, `value` diverso per ogni opzione.

```html
<p>Metodo di contatto preferito:</p>
<label><input type="radio" name="contatto" value="email"> Email</label>
<label><input type="radio" name="contatto" value="telefono"> Telefono</label>
```

## Checkbox (scelta multipla)
Ogni checkbox ha lo stesso `name` se vuoi inviare un elenco di preferenze.

```html
<p>Argomenti di interesse:</p>
<label><input type="checkbox" name="interessi" value="html"> HTML</label>
<label><input type="checkbox" name="interessi" value="css"> CSS</label>
<label><input type="checkbox" name="interessi" value="js"> JavaScript</label>
```

## Esempio di estensione del form

```html
<form action="https://formtester.goodbytes.be/post.php" method="post">
  <label for="nome">Nome</label>
  <input type="text" id="nome" name="nome">

  <p>Metodo di contatto preferito:</p>
  <label><input type="radio" name="contatto" value="email"> Email</label>
  <label><input type="radio" name="contatto" value="telefono"> Telefono</label>

  <p>Argomenti di interesse:</p>
  <label><input type="checkbox" name="interessi" value="html"> HTML</label>
  <label><input type="checkbox" name="interessi" value="css"> CSS</label>
</form>
```

Anche qui, l'`action` punta alla pagina di test: dopo l'invio vedrai quali `name` sono arrivati e con che valore.
Serve per verificare che radio e checkbox abbiano i nomi corretti.


## Esercizio
1) Aggiungi una scelta singola con radio (es. metodo di contatto).
2) Aggiungi una scelta multipla con checkbox (es. preferenze).
3) Controlla che le radio abbiano lo stesso `name`.

Per verificare i dati, imposta `method="post"` e `action="https://formtester.goodbytes.be/post.php"`.
Dopo l'invio, la pagina di test elenca tutte le scelte inviate dal form.



# Lezione 6: CSS - selettori, proprieta, spazi

## Cos'e' il CSS
CSS (Cascading Style Sheets) serve per definire l'aspetto grafico: colori, font, spazi, dimensioni e bordi. L'HTML dice che cosa c'è, il CSS dice come appare.

## Dove si scrive il CSS
In JSFiddle ci sono tre riquadri principali: HTML, CSS e JS. Quando fai gli esercizi, il CSS va scritto nell'apposito riquadro CSS, non dentro l'HTML.
Se invece lavori in un file locale, il CSS sta in un file .css collegato all'HTML con:

```html
<link rel="stylesheet" href="style.css">
```

## Selettori: come scegliere cosa stilizzare
Un selettore indica quali elementi della pagina devono ricevere le regole CSS.

Selettori base:
- Tag: h1, p, ul (tutti gli elementi di quel tipo).
- Classe: .evidenziato (tutti gli elementi con class="evidenziato").
- ID: #titolo (un elemento con id="titolo", di solito unico).

Selettori utili:
- Combinati: p.evidenziato (solo i paragrafi con quella classe).
- Discendenti: section p (tutti i p dentro una section).
- Gruppi: h1, h2, h3 (stessa regola per piu' tag).

## Proprieta CSS principali
- color: colore del testo.
- background-color: colore di sfondo.
- font-family, font-size, line-height: font e leggibilita.
- margin, padding: spazi esterni e interni.
- border, border-radius: bordo e angoli arrotondati.
- text-align, text-decoration: allineamento e decorazione del testo.

## Esempio completo (da copiare nel riquadro CSS di JSFiddle)
Applica questo CSS nella sezione CSS di JSFiddle:

```css
body {
  font-family: "Georgia", serif;
  background-color: #f4f1ea;
  color: #2c2c2c;
  margin: 24px;
}

h1 {
  color: #1f4e79;
  text-align: center;
  letter-spacing: 1px;
}

p {
  line-height: 1.6;
  margin-bottom: 12px;
}

.card {
  background-color: #ffffff;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 16px;
  max-width: 600px;
}

a {
  color: #c15a00;
  text-decoration: none;
  font-weight: bold;
}

ul li {
  margin-bottom: 6px;
}

.evidenziato {
  background-color: #fff3b0;
  padding: 4px 8px;
  border-left: 4px solid #f0b429;
}
```

Poi utilizza questo piccolo HTML di esempio da mettere nel riquadro HTML di JSFiddle:

```html
<h1>Mini pagina di prova</h1>

<div class="card">
  <p>Questo e' un paragrafo dentro una card.</p>
  <p class="evidenziato">Questo paragrafo e' evidenziato.</p>
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
1) Crea almeno 3 selettori diversi: uno per tag, uno per classe e uno discendente.
2) Applica almeno 6 proprietà diverse (es. color, background-color, font-size, margin, padding, border).
3) Aggiungi una classe a un paragrafo e rendilo "evidenziato" con sfondo, bordo e padding.
4) Fai in modo che la pagina sia più leggibile aumentando spazi e line-height.
