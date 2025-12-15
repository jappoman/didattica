# Lezione 2: liste, immagini avanzate, ancore interne, tabelle

## Prima di iniziare
- Non tradurre la pagina dall'inglese, rischia di creare errori nei tag.
- Recupera il link del tuo progetto su JSFiddle e aprilo.
- Ricordati di salvare spesso.

## Liste HTML
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