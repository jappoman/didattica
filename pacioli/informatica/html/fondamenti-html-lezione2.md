# Lezione 2 – HTML semantico, CSS base e form

Prerequisito: sai creare la pagina minima (`<!DOCTYPE>`, `<head>`, `<body>`) con titoli, paragrafi, immagini e link.

## Concetti base di HTML (ripasso veloce)

- Tag: parola chiave tra `< >` che descrive un elemento.
- Apertura/chiusura: es. `<p> ... </p>`. Alcuni tag sono auto-chiudenti (`<img />`).
- Attributi: info aggiuntive nel tag di apertura (`<a href="...">`).
- Annidamento: chiudi gli elementi nello stesso ordine in cui li apri.
- Commenti: `<!-- questo e un commento -->` (il browser li ignora).

## Tag fondamentali estesi

- Elenchi: `<ul>` (puntato), `<ol>` (numerato) con `<li>` per ogni voce.
- Inline vs block: block occupa tutta la riga (`div`, `p`, `h1`); inline usa solo lo spazio necessario (`a`, `strong`, `img`).

Schema rapido inline vs block

```plain
Block:   [=======riga intera=======]
Inline:  [link][img][span] nello stesso flusso
```

Esempio

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

Errori tipici: titoli fuori ordine (`h4` dopo `h1`), dimenticare `alt`, mescolare lista puntata e numerata senza motivo.

## Tag semantici HTML5

- Tag chiave: `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`.
- Regola: se esiste un tag semantico per un ruolo, preferiscilo a un `div`.

Schema visivo

```html
<header>   logo, titolo, nav
<main>     contenuto principale
  <section>/<article> blocchi di contenuto
<footer>   contatti, crediti
```

Esempio

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

Errore tipico: usare `<section>` senza titolo interno (`<h2>` o simili).

## Introduzione al CSS

- Separare stile da contenuto rende il codice mantenibile.
- Collega il CSS nel `<head>`: `<link rel="stylesheet" href="style.css" />`.
- Sintassi: `selettore { proprieta: valore; }`.
- Tre modi CSS: inline (`style=""`, solo test), interno (`<style>`, ok per demo), esterno (file `.css`, scelta standard).
- Selettori base: tag (`p {}`), classe (`.nota {}`), id (`#titolo {}`), discendente (`header nav a {}`).
- Proprietà fondamentali: `color`, `background-color`, `font-size`, `font-family`, `margin`, `padding`, `border`, `width`, `height`, `text-align`.

Esempio rapido (`style.css`):

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

Errore tipico: dimenticare di collegare il file CSS (vedi console DevTools per 404).

## Bottoni e primi elementi interattivi

- `<button>`: azione nella pagina (submit form, aprire modale).
- `<a>`: porta a un'altra risorsa; se lo stilizzi da pulsante, mantieni un vero `href`.
- Attributo `type` per `<button>`: `button` (azione generica), `submit` (invia form).

Esempio

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

## Form HTML di base

- `form` con `action` (destinazione) e `method` (`post`).
- Input fondamentali: `text`, `email`, `password`, `submit`.
- `label` collegata all'input con `for` e `id` per accessibilita.
- `textarea` per testi lunghi; `select` + `option` per scelte multiple.
- Attributi utili: `required`, `placeholder`, `name`, `pattern` (solo menzione).

Esempio

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

Errori tipici: dimenticare `name`, usare `placeholder` al posto del `label`, lasciare `button` senza `type` dentro il form.

## Stilizzare un form con CSS

- Selettori utili: `form input`, `form textarea`, `form button`, `label`.
- Stile base: `padding`, `border`, `border-radius`, `margin-bottom`.
- Stato focus: `input:focus { outline: ...; border-color: ...; }`.
- Allineamento: impila gli elementi in colonna per leggibilita.

Esempio stile form

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

Errore tipico: togliere l'outline senza fornire un focus visibile.

## Mini-progetto finale

Obiettivo: unire tutto in una pagina completa con HTML semantico + CSS esterno.

Check-list:

- `<header>` con titolo e (opzionale) navigazione.
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

Mini-guida

1. Crea `index.html` con struttura semantica completa.
2. Collega `style.css` e definisci palette e font semplici.
3. Controlla annidamento e gerarchia dei titoli.
4. Prova in browser e ridimensiona la finestra per verificare leggibilita.

Sfida finale

- Aggiungi un link di salto rapido: `<a href="#contatti">Vai al form</a>` in cima e un `id="contatti"` sul form.
- Crea una versione scura cambiando solo variabili CSS (definisci `--bg`, `--fg`, ecc.) e commuta aggiungendo una classe `dark` sul `body`.
