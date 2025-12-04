# HTML: primi passi pratici

## Introduzione

Perche usare l'HTML? E il linguaggio che descrive la struttura dei contenuti di una pagina web. Il CSS invece li veste.

- Struttura vs presentazione: HTML organizza i pezzi, CSS decide colori, font e spazi. Tenerli separati rende il codice piu chiaro e riutilizzabile.
- Cosa serve: un file `.html`, un editor di testo, un browser per aprirlo.

```plain
HTML = struttura        CSS = vestito
<h1>Titolo</h1>         h1 { color: red; }
```

Errore tipico: scrivere tutto inline (`style=""` ovunque). Inizia subito con un file CSS esterno, anche minimale.

## Concetti base di HTML

- Tag: parola chiave tra `< >` che descrive un elemento.
- Apertura/chiusura: I tag vanno aperti e chiusi. L'elemento rimane all'interno dei tag. Es: `<p> ... </p>`. Alcuni invece sono auto-chiudenti (es. `<img />`).
- Attributi: info aggiuntive dentro il tag di apertura (`<a href="...">`).
- Annidamento corretto: chiudi gli elementi nello stesso ordine in cui li apri.
- Commenti: `<!-- questo e un commento -->`. Non vengono interpretati dal browser.

Struttura minima:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Titolo pagina</title>
  </head>
  <body>
    <p>Contenuto visibile nella pagina.</p>
  </body>
</html>
```

## Primi tag fondamentali

Ecco il vocabolario minimo per scrivere contenuti leggibili.

- Titoli: da `<h1></h1>` fino ad `<h6></h6>` (un solo `<h1>` principale).
- Paragrafi: `<p></p>`.
- Link: `<a href="...">testo</a>` (usa `target="_blank"` solo se serve).
- Immagini: `<img src="..." alt="testo alternativo" />` (`alt` e per accessibilita e SEO).
- Elenchi: `<ul>` (puntato), `<ol>` (numerato) con `<li>` per ogni voce.
- Inline vs block (concetto rapido): block occupa tutta la riga (`div`, `p`, `h1`), inline solo lo spazio necessario (`a`, `strong`, `img`).

Schema rapido inline vs block

```plain
Block:   [=======riga intera=======]
Inline:  [link][img][span] nello stesso flusso
```

Esempio pratico:

```html
<main>
  <h1>Ricetta pancake</h1>
  <p>Pronti in 10 minuti, soffici e leggeri.</p>
  <ul>
    <li>Farina 00</li>
    <li>Latte</li>
    <li>Uovo</li>
    <li>Lievito</li>
  </ul>
  <p>Fonte: <a href="https://example.com">ricetta completa</a></p>
  <img src="pancake.jpg" alt="Pila di pancake dorati" />
</main>
```

Errori tipici:

- Titoli fuori ordine (`h4` dopo `h1`). Mantieni la gerarchia.
- Dimenticare `alt` sulle immagini.
- Mescolare lista puntata e numerata senza motivo.

Esercizio 2 (guidato):

1. In `index.html` aggiungi:
   - un titolo grande (`<h1>`),
   - un paragrafo (`<p>`),
   - una lista puntata (`<ul><li>...</li></ul>`),
   - un link esterno,
   - un'immagine con testo alternativo.
2. Aggiungi un `<h2>` con un paragrafo breve sotto.

Sfida extra:

- Trasforma la lista puntata in numerata, poi aggiungi un link dentro un `<li>`.

## Parte 3: tag semantici HTML5

Perche servono: danno senso al documento, aiutano accessibilita e motori di ricerca.

- Tag chiave: `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`.
- Regola base: se esiste un tag semantico per un ruolo, preferiscilo a un `div`.

Schema visivo di pagina

```html
<header>   logo, titolo, nav
<main>     contenuto principale
  <section>/<article> blocchi di contenuto
<footer>   contatti, crediti
```

Esempio: riscrivere un blocco

```html
<header>
  <h1>Guida viaggio</h1>
  <nav>
    <a href="#mangiare">Mangiare</a>
    <a href="#visitare">Visitare</a>
  </nav>
</header>
<main>
  <section id="mangiare">
    <h2>Ristoranti</h2>
    <p>Consigli di cucina locale.</p>
  </section>
  <section id="visitare">
    <h2>Luoghi da vedere</h2>
    <p>Centro storico, musei, parchi.</p>
  </section>
</main>
<footer>
  <p>Contatti: info@example.com</p>
</footer>
```

Errore tipico: usare `<section>` senza titolo interno (`<h2>` o simili). Ogni sezione dovrebbe essere identificabile.

Esercizio 3 (guidato):

1. Avvolgi il titolo e i link principali in `<header>`.
2. Metti il contenuto centrale in `<main>` con due `<section>` distinte.
3. Chiudi con `<footer>` e una riga di testo.

Sfida extra:

- Aggiungi un `<article>` dentro una sezione e spiega in un commento quando useresti `article` invece di `section`.

## Parte 4: introduzione al CSS

Perche serve: separare stile da contenuto rende tutto mantenibile e riutilizzabile.

- Collega il CSS nel `<head>`: `<link rel="stylesheet" href="style.css" />`.
- Sintassi: `selettore { proprieta: valore; }`.
- Tre modi CSS:
  - inline: `style=""` (solo per test veloci).
  - interno: `<style>` (ok per demo).
  - esterno: file `.css` (scelta standard).
- Selettori base: tag (`p {}`), classe (`.nota {}`), id (`#titolo {}`), discendente (`header nav a {}`).
- Proprieta fondamentali: `color`, `background-color`, `font-size`, `font-family`, `margin`, `padding`, `border`, `width`, `height`, `text-align`.

Mini nota: le classi si riusano (`.btn` su molti bottoni), gli id no (un solo `#id` per pagina).

Esempio rapido in `style.css`:

```css
body {
  font-family: Arial, sans-serif;
  margin: 16px;
}
h1 {
  color: #1a73e8;
}
p {
  margin-bottom: 12px;
}
```

Errore tipico: dimenticare di collegare il file CSS (controlla la console DevTools per 404 su `style.css`).

Esercizio 4 (guidato):

1. Crea `style.css` e collegalo con `<link>`.
2. Cambia colore del titolo, font del testo, aggiungi margini tra i paragrafi.
3. Aggiungi una classe `.evidenza` che colora di giallo lo sfondo di un paragrafo e applicala.

Sfida extra:

- Usa un selettore discendente per colorare di rosso solo i link dentro il `<header>`.

## Parte 5: bottoni e primi elementi interattivi

Perche serve: distinguere fra pulsanti reali e link mascherati evita problemi di accessibilita e comportamento.

- `<button>`: azione nella pagina (submit form, aprire modale).
- `<a>`: porta a un'altra risorsa; se lo usi da pulsante devi dargli un vero `href`.
- Attributo `type` per `<button>`: `button` (azione generica), `submit` (invia form).

Esempio con stile base:

```html
<button type="button" class="btn-primario">Scopri di piu</button>
```

```css
.btn-primario {
  background: #1a73e8;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
.btn-primario:hover {
  background: #155bb5;
}
```

Errore tipico: dimenticare `type` dentro un form (il default e `submit`, rischi invii involontari).

Esercizio 5 (guidato):

1. Inserisci un `<button>` nella pagina.
2. Stilizzalo con `background`, `padding`, `border-radius`.
3. Aggiungi uno stato `:hover` piu scuro.

Sfida extra:

- Crea una classe `.btn-link` per uno `<a>` che sembra un pulsante, ma mantieni `href` funzionante.

## Parte 6: form HTML di base

Perche serve: il form e il modo standard per raccogliere dati. Capire gli input base ti evita hack.

- `form` con `action` (dove inviare) e `method` (spesso `post`).
- Input fondamentali: `text`, `email`, `password`, `submit`.
- `label` collegata all'input con `for` e `id` per accessibilita.
- `textarea` per testi lunghi; `select` + `option` per scelte multiple.
- Attributi utili: `required`, `placeholder`, `name`, `pattern` (menzione).

Esempio completo:

```html
<form action="/destinazione" method="post">
  <label for="nome">Nome</label>
  <input id="nome" name="nome" type="text" required />

  <label for="email">Email</label>
  <input id="email" name="email" type="email" required />

  <label for="messaggio">Messaggio</label>
  <textarea id="messaggio" name="messaggio" placeholder="Scrivi qui" required></textarea>

  <button type="submit">Invia</button>
</form>
```

Errori tipici:

- Dimenticare `name`: il server riceverebbe un campo senza nome.
- Usare `placeholder` al posto del `label`: il placeholder sparisce quando digiti.
- Lasciare `button` senza `type` dentro il form.

Esercizio 6 (guidato):

1. Crea un form di contatto con: nome, email, messaggio, pulsante invio.
2. Aggiungi `required` ai campi e `placeholder` descrittivi.
3. Collega correttamente ogni `label` al suo `input`.

Sfida extra:

- Aggiungi un `select` con 3 motivi di contatto e un input `type="email"` con `pattern` che accetti solo domini `example.com`.

## Parte 7: stilizzare un form con CSS

Perche serve: un form leggibile invoglia a compilarlo; uno disordinato fa scappare l'utente.

- Selettori utili: `form input`, `form textarea`, `form button`, `label`.
- Stile di base: `padding`, `border`, `border-radius`, `margin-bottom`.
- Stato focus: `input:focus { outline: ...; border-color: ...; }`.
- Allineamento: impila gli elementi in colonna per leggibilita.

Esempio stile form:

```css
form {
  max-width: 480px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}
label {
  font-weight: 600;
}
input, textarea {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
}
input:focus, textarea:focus {
  border-color: #1a73e8;
  outline: 2px solid #e3f2fd;
}
button[type="submit"] {
  background: #1a73e8;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
```

Errore tipico: togliere l'outline senza fornire un'alternativa visibile al focus. Non rimuovere mai il focus a vuoto.

Esercizio 7 (guidato):

1. Applica uno stile coerente agli input e al pulsante.
2. Aggiungi un bordo morbido e spazio verticale (`gap` o `margin-bottom`).
3. Definisci uno stato `:focus` evidente.

Sfida extra:

- Allinea etichette e campi in due colonne su desktop e una colonna su mobile (puoi iniziare con flex e `flex-direction` diversa con una media query semplice).

## Parte 8: mini-progetto finale

Obiettivo: unire tutto in una pagina completa con HTML + CSS esterno.

Check-list contenuti:

- `<header>` con titolo e (opzionale) una piccola navigazione.
- Un'immagine di apertura.
- Testo introduttivo con paragrafi e lista.
- Un pulsante call-to-action.
- Un form di contatto finale.
- File `style.css` per colori, font, spaziature.

Schema visivo (testo)

```
HEADER  [Titolo + nav]
BANNER  [Immagine + titolo H1]
TESTO   [Paragrafi + lista]
CTA     [Bottone]
FORM    [Nome, Email, Messaggio, Submit]
FOOTER  [Contatti, crediti]
```

Mini-guida per chiuderlo:

1. Crea `index.html` con struttura semantica completa.
2. Collega `style.css` e definisci palette e font semplici.
3. Controlla annidamento e gerarchia dei titoli.
4. Prova in browser e ridimensiona la finestra per verificare che tutto resti leggibile.

Sfida finale:

- Aggiungi un link di salto rapido: `<a href="#contatti">Vai al form</a>` in cima e un `id="contatti"` sul form.
- Crea una versione scura cambiando solo variabili CSS (definisci `--bg`, `--fg`, ecc.) e commuta aggiungendo una classe `dark` sul `body` (anche manualmente).

Risultato atteso

- Comprendi i concetti base dell'HTML.
- Sai costruire una pagina ordinata con i tag principali, anche semantici.
- Colleghi e usi un CSS esterno.
- Stilizzi testo, immagini, bottoni e form.
- Distingui struttura (HTML) da presentazione (CSS) e sai evitare gli errori piu comuni.
