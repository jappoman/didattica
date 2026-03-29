# Editor WYSIWYG e Grapes Studio

## Cos'e' un editor WYSIWYG

WYSIWYG significa `What You See Is What You Get`, cioe' "quello che vedi e' quello che ottieni".
Un editor WYSIWYG permette di costruire una pagina web in modo visuale, trascinando blocchi e modificando contenuti e stili senza scrivere tutto il codice a mano.

In pratica:

- vedi subito il risultato sullo schermo
- sposti sezioni, immagini, testi e bottoni con drag and drop
- cambi colori, spaziature e dimensioni tramite pannelli grafici
- il programma genera dietro le quinte HTML e CSS

Un editor di questo tipo e' utile soprattutto quando:

- vuoi creare rapidamente una bozza di sito
- vuoi concentrarti sul layout prima del codice
- devi costruire landing page, pagine vetrina o pagine promozionali
- stai imparando la struttura di una pagina web osservando subito il risultato

Non bisogna pero' confondere WYSIWYG con "magia".
Il sito finale continua comunque a essere fatto di HTML, CSS e a volte JavaScript.
L'editor visuale rende il lavoro piu' semplice, ma la logica del web resta sempre quella.

## Vantaggi e limiti

### Vantaggi

- molto veloce per creare una prima versione della pagina
- non richiede subito grande esperienza di codice
- aiuta a ragionare per sezioni e componenti
- rende piu' facile lavorare sull'aspetto grafico

### Limiti

- se non conosci almeno un minimo di HTML e CSS rischi di usare i blocchi senza capire cosa stai facendo
- alcune personalizzazioni avanzate restano piu' comode da fare a codice
- un uso disordinato dei blocchi puo' creare pagine confuse o troppo pesanti

Per questo motivo l'editor WYSIWYG va visto come uno strumento in piu', non come un sostituto totale della comprensione del web.

## Cos'e' Grapes Studio

`https://app.grapesjs.com/` e' l'app web di Grapes Studio, un website builder visuale basato sull'ecosistema GrapesJS.
Permette di:

- generare una struttura iniziale del sito con l'AI
- modificare il sito tramite editor a blocchi
- cambiare testi, immagini, colori e layout in modo visuale
- vedere e, se serve, controllare anche il codice prodotto

L'idea pratica e' questa:

1. descrivi il sito con uno o due prompt
2. ottieni una bozza iniziale
3. sistemi la pagina con i blocchi e con i pannelli di modifica
4. rifinisci il risultato finale

## Come iniziare su `app.grapesjs.com`

Apri il sito e crea un nuovo progetto web.
Se vuoi partire con l'AI, scegli la generazione guidata e inserisci una descrizione abbastanza precisa del sito.

Un buon prompt deve dire almeno:

- tipo di sito
- argomento principale
- stile semplice del sito
- parti che vuoi vedere nella pagina

### Esempio di prompt 1

```text
Crea un sito semplice per un corso base di informatica.
Usa colori blu e bianco.
Inserisci un titolo grande iniziale, una breve presentazione del corso, una parte con il programma e una parte finale con i contatti.
```

### Esempio di prompt 2

```text
Crea un sito semplice per una piccola palestra.
Usa uno stile ordinato e immagini sportive.
Inserisci il nome della palestra, una breve descrizione, l'elenco dei corsi, gli orari e i contatti.
```

Dopo la generazione:

- leggi bene la pagina ottenuta
- controlla se le sezioni ci sono tutte
- verifica che i testi abbiano senso
- sostituisci i contenuti troppo generici con contenuti piu' sensati e personali
- correggi subito il contenuto prima di perfezionare i dettagli grafici

L'AI ti aiuta a partire, ma il sito non deve restare pieno di frasi generiche.
Bisogna riscrivere testi, titoli e descrizioni in modo coerente con l'argomento scelto.
Se stai creando il sito di un corso, di una palestra o di una biblioteca, i contenuti devono sembrare davvero adatti a quel progetto e non copiati in modo automatico.

## Le zone principali dell'editor

L'interfaccia di Grapes Studio e' organizzata in aree abbastanza classiche per un page builder.

### 1. Canvas centrale

E' la zona principale in cui vedi la pagina e lavori direttamente sugli elementi.
Qui puoi:

- selezionare un blocco
- trascinarlo in un'altra posizione
- modificare testi direttamente
- vedere subito il risultato delle modifiche

### 2. Pannello Blocks

Si trova a sinistra della pagina.
Contiene i blocchi pronti da trascinare nella pagina.

Tra i blocchi che puoi trovare ci sono, per esempio:

- `1 Column`
- `2 Columns`
- `3 Columns`
- `Section`
- `Divider`
- `Heading`
- `Text`
- `Link`
- `Image`
- `Video`
- `Map`
- elementi per `Forms`

Il pannello Blocks serve per aggiungere nuovi pezzi di pagina senza doverli costruire da zero.

### 3. Pages

Nella zona sinistra dell'editor puoi trovare anche `Pages`.
Serve per vedere quali pagine fanno parte del progetto.

Esempi possibili:

- home page
- pagina corsi
- contatti

Se il progetto ha una sola pagina, `Pages` ti mostra comunque la pagina attiva su cui stai lavorando.

### 4. Layers

Sempre nella zona sinistra puoi trovare `Layers`.
Questo pannello mostra la struttura della pagina come un albero di elementi.

Per esempio puoi vedere:

- il `Body`
- le sezioni principali
- i contenitori interni
- i titoli
- i paragrafi
- i bottoni
- le immagini

`Layers` e' molto utile per capire come e' organizzata la pagina.
Serve anche a selezionare meglio un elemento quando nel canvas centrale e' difficile cliccarlo.

### 5. Global Styles

Nella colonna laterale puoi trovare anche `Global Styles`.
Questo pannello serve a impostare lo stile generale del sito, non del singolo blocco.

Di solito permette di gestire:

- i colori principali del progetto
- lo stile generale del `Body`
- lo stile dei titoli
- lo stile dei sottotitoli
- lo stile dei bottoni

Esempi di impostazioni utili:

- colore di sfondo generale
- colore base del testo
- font principale
- dimensione del testo
- dimensione dei titoli
- line-height

`Global Styles` e' comodo per dare coerenza grafica alla pagina.
Invece di cambiare ogni elemento uno per uno, puoi impostare delle regole generali valide per tutto il sito.

### 6. Pannello Styles

Si trova a destra della pagina.
Serve a cambiare l'aspetto grafico dell'elemento selezionato.

Quando selezioni un titolo, un bottone, una colonna o un'immagine, il pannello mostra le proprieta' stilistiche modificabili.
Le aree principali da conoscere sono queste.

#### Layout

Qui trovi proprieta' che controllano il comportamento del blocco nella pagina.

- `display`: decide come l'elemento si dispone, per esempio come blocco normale
- opzioni `flex`: servono per allineare e distribuire meglio gli elementi
- `align`: controlla l'allineamento interno
- `order`: cambia l'ordine di un elemento nei layout flessibili

Questa parte e' utile soprattutto per sezioni, colonne, righe e gruppi di elementi.

#### Size

Qui controlli le dimensioni del blocco.

- `width`: larghezza
- `height`: altezza
- `min-width` e `min-height`: dimensioni minime
- `max-width` e `max-height`: dimensioni massime

Serve quando vuoi evitare che un blocco sia troppo stretto, troppo largo o troppo alto.

#### Space

Questa e' una delle parti piu' importanti.

- `padding`: spazio interno tra contenuto e bordo
- `margin`: spazio esterno tra un blocco e gli altri

Se una pagina sembra troppo stretta o troppo attaccata, spesso il problema e' qui.

#### Position

Qui trovi il modo in cui un elemento viene posizionato nella pagina.
Di solito per iniziare si lascia il valore standard, ma e' utile sapere che esiste questa sezione.

#### Typography

Questa parte controlla l'aspetto del testo.

- `font`: tipo di carattere
- `color`: colore del testo
- `size`: dimensione del testo
- `weight`: spessore del testo, per esempio normale o grassetto
- `line-height`: distanza verticale tra le righe
- `spacing`: distanza tra le lettere
- `align`: allineamento del testo
- `transform`: modifica il testo, per esempio maiuscolo
- `decoration`: sottolineatura o altre decorazioni

Per titoli e paragrafi questa e' la sezione piu' usata.

#### Background

Qui controlli lo sfondo dell'elemento.

- `background-color`: colore di sfondo
- `background`: eventuale sfondo piu' complesso, anche con immagini

Serve per evidenziare sezioni, bottoni, box e aree importanti della pagina.

#### Borders

Qui modifichi il bordo dell'elemento.

- `border-radius`: arrotondamento degli angoli
- `border-width`: spessore del bordo
- `border-style`: stile del bordo
- `border-color`: colore del bordo

Questa sezione e' molto usata per bottoni, card e riquadri.

#### Effects

Qui trovi effetti grafici aggiuntivi.

- `opacity`: trasparenza
- `cursor`: tipo di cursore del mouse
- `box-shadow`: ombra del blocco
- `text-shadow`: ombra del testo
- `filter`: effetti grafici
- `transition`: velocita' dei cambiamenti
- `transform`: spostamenti, rotazioni o ingrandimenti
- `overflow`: decide cosa succede se il contenuto supera lo spazio disponibile

Questi strumenti vanno usati con moderazione.
Servono per rifinire la pagina, non per sostituire una buona struttura.

### 7. Device preview

In alto e' presente il selettore del dispositivo, ad esempio `Desktop`.
Serve per passare da una vista larga a una piu' stretta e controllare il comportamento responsive della pagina.

### 8. Code

Il pulsante `Code` permette di vedere il codice generato.
E' utile per collegare l'editor visuale a cio' che hai studiato in HTML e CSS.

## Come si lavora con i blocchi

Il concetto fondamentale e' questo: ogni blocco rappresenta un elemento gia' pronto o una piccola struttura riutilizzabile.

Per usarli:

1. apri `Blocks`
2. scegli il blocco piu' adatto
3. trascinalo nella posizione desiderata
4. rilascialo quando compare il punto giusto di inserimento
5. selezionalo e personalizzalo

Esempio tipico:

- inserisci una `Section`
- dentro aggiungi `2 Columns`
- nella colonna sinistra metti `Heading`, `Text` e `Button`
- nella colonna destra inserisci `Image`

Questa e' una struttura classica da hero section.

## Blocchi fondamentali da conoscere

### Section

Una `Section` e' un contenitore grande.
Serve a dividere la pagina in zone logiche: hero, servizi, contatti, footer.

### Columns

I blocchi `1 Column`, `2 Columns`, `3 Columns` e simili servono a organizzare il layout orizzontale.
Sono molto usati per:

- affiancare testo e immagine
- creare card in griglia
- disporre informazioni in piu' colonne

### Heading

Inserisce un titolo.
Di solito viene usato per titoli principali e sottotitoli.

### Text

Inserisce un blocco di testo normale, cioe' paragrafi o descrizioni.

### Link e Button

Servono a creare collegamenti cliccabili.
Sono fondamentali per i pulsanti di call to action come:

- Iscriviti
- Contattaci
- Scopri di piu'

### Image

Permette di aggiungere immagini, modificarne dimensioni e posizione.

### Divider

E' una linea o separatore visivo.
Utile per dividere parti diverse della pagina.

### Form e input

Nella categoria `Forms` trovi blocchi per moduli:

- form
- input
- textarea
- select
- checkbox
- button

Sono utili per iscrizioni, richieste di contatto, prenotazioni.

## Regole pratiche per usare bene i blocchi

- usa pochi blocchi ma ben organizzati
- non inserire troppe colonne in una sola sezione
- mantieni una gerarchia chiara: titolo, testo, bottone
- sostituisci i testi generici con contenuti reali
- controlla sempre l'ordine degli elementi nelle `Layers`

## Selezione, classi e stati

Quando selezioni un elemento, Grapes Studio mostra la selezione attiva e le classi collegate a quell'elemento.
Questo e' importante perche' puoi:

- modificare il singolo elemento
- modificare una classe riutilizzata su piu' elementi
- lavorare su stati diversi, come quello normale o eventuali varianti

In pratica devi sempre chiederti:

- sto cambiando solo questo elemento?
- oppure sto cambiando una classe condivisa anche da altri elementi?

Se sbagli questo punto, rischi di modificare piu' blocchi insieme senza volerlo.

## Uso corretto del responsive

Una pagina non va controllata solo in versione desktop.
Dopo ogni modifica importante:

1. passa alla vista tablet o mobile, se disponibile
2. controlla se testi, immagini e bottoni restano leggibili
3. verifica che le colonne non siano troppo strette
4. aumenta o riduci spazi e dimensioni dove serve

Un errore classico e' costruire una pagina bella da desktop ma scomoda da smartphone.

## Metodo pratico per costruire una pagina

### Metodo 1: AI prima, builder dopo

Usa questo metodo se vuoi partire velocemente.

1. genera la bozza con un prompt chiaro
2. controlla le sezioni create
3. elimina i blocchi inutili
4. trascina nuovi blocchi dove mancano
5. sistema testi e immagini
6. rifinisci stili e spaziature

### Metodo 2: builder manuale

Usa questo metodo se vuoi capire bene la struttura.

1. crea una `Section`
2. inserisci colonne
3. aggiungi titolo, testo, immagini e bottoni
4. duplica lo schema per le sezioni successive
5. personalizza ogni parte

## Esempio di costruzione guidata

Supponiamo di voler creare la home page di un corso.

### Passo 1

Genera una prima bozza con un prompt come:

```text
Crea una landing page per un corso di HTML e CSS per principianti.
Grafica moderna, semplice e professionale.
Servono hero iniziale, vantaggi, programma, testimonianze, FAQ e contatti.
```

### Passo 2

Controlla se sono presenti:

- titolo principale
- sottotitolo
- bottone di iscrizione
- sezione vantaggi
- sezione programma
- sezione finale con contatti

### Passo 3

Se una sezione non ti convince:

- cancellala
- aggiungi una nuova `Section`
- inserisci i blocchi necessari

### Passo 4

Per migliorare l'hero:

- seleziona il titolo e aumenta `font-size`
- seleziona il bottone e cambia `background-color`
- seleziona la sezione e regola `padding`
- seleziona l'immagine e controlla dimensioni e allineamento

## Errori da evitare

- usare troppi colori diversi
- mettere troppo testo in una sola sezione
- non controllare la versione mobile
- trascinare blocchi a caso senza una struttura
- modificare le proprieta' senza aver selezionato l'elemento giusto
- lavorare solo di effetto grafico senza sistemare prima i contenuti

## Collegamento con HTML e CSS

Anche se lavori in modo visuale, tutto quello che fai corrisponde a concetti gia' studiati:

- i blocchi corrispondono a elementi HTML o gruppi di elementi
- il pannello `Styles` modifica proprieta' CSS
- il pannello `Properties` modifica attributi o configurazioni del componente
- il canvas mostra il risultato finale nel browser

Quindi usare un editor WYSIWYG puo' aiutarti anche a ripassare:

- struttura della pagina
- gerarchia dei contenitori
- tipografia
- spaziatura
- differenza tra contenuto e stile

## Esercizio

Crea su Grapes Studio una landing page per un'attivita' a scelta tra:

- corso di informatica
- palestra
- biblioteca
- pizzeria

La pagina deve contenere:

1. una hero section con titolo, testo, bottone e immagine
2. una sezione con almeno 3 vantaggi
3. una sezione finale con contatti o invito all'azione

Vincoli:

- parti da un prompt iniziale
- modifica poi la pagina con i blocchi manualmente
- usa almeno una `Section`, un blocco a colonne, un `Heading`, un `Text`, un `Image` e un `Link` o bottone
- cambia almeno 5 proprieta' dal pannello `Styles`
- controlla il risultato in vista desktop e mobile

## Conclusione

Un editor WYSIWYG come Grapes Studio non sostituisce HTML e CSS, ma rende molto piu' veloce la costruzione di una pagina.
Il metodo corretto e' usare prima la struttura, poi i contenuti, poi lo stile.
Se impari a riconoscere bene blocchi, sezioni, proprieta' e pannelli, puoi progettare pagine web in modo rapido e molto piu' ordinato.

## Riferimenti

- App web: `https://app.grapesjs.com/`
- Tutorial ufficiale: `https://grapesjs.com/blog/grapes-studio-tutorial`
- Introduzione a Grapes Studio: `https://grapesjs.com/blog/grapes-studio-release`
- Documentazione Block Manager: `https://grapesjs.com/docs/modules/Blocks`
- Documentazione Style Manager: `https://grapesjs.com/docs/modules/Style-manager.html`
