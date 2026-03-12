# Laboratorio Foglio di Calcolo Avanzato

## Prima di iniziare

In questo modulo useremo il foglio di calcolo come strumento professionale, non solo come calcolatrice.
L'obiettivo è costruire file affidabili, leggibili, aggiornabili e pronti per essere condivisi.

Nel lavoro reale il foglio di calcolo serve per:

- gestire vendite e ordini
- controllare magazzino e scorte
- monitorare costi e ricavi
- verificare presenze e attività
- esportare/importare dati tra software diversi

## Strumenti

Useremo **Google Fogli in italiano**.

Le formule in questo laboratorio sono scritte con separatore argomenti `;`.

Esempio:

```text
=SE(B2>10;"OK";"NO")
```

## Organizzazione del file di laboratorio

Crea un file chiamato `modulo3-foglio-calcolo-avanzato` e prepara questi fogli:

- `L1_Formule`
- `L2_Funzioni`
- `L3_Convalida`
- `L4_Ordinamento_Filtri`
- `L5_Grafici_CSV`
- `L6_Simulazione`
- `L7_Verifica`

Consigli pratici:

- usa intestazioni chiare in riga 1:
  `Data`, `Reparto`, `Prodotto`, `Quantità`, `Prezzo`, `Importo`.
  Evita nomi generici come `Dato1`, `Varie`, `Info`.
- evita colonne vuote dentro la tabella:
  i dati devono stare in un blocco continuo (es. da colonna `A` a `F` senza buchi),
  altrimenti filtri, ordinamenti e formule possono funzionare male.
- non unire celle nelle zone dati:
  non usare `Unisci celle` nelle righe dei record, perché può bloccare ordinamento e filtro.
  Se vuoi un titolo grande, mettilo sopra la tabella, non dentro i dati.
- applica formati coerenti per colonna:
  `Prezzo` in valuta (euro), `Sconto` in percentuale, `Data` in formato data.
  Non mischiare nella stessa colonna numeri, testo e simboli scritti a mano.

---

# Lezione 1 - Ripasso: struttura del foglio e formule corrette

## Obiettivi della lezione

A fine lezione devi saper:

- distinguere dato, formula e funzione
- costruire formule senza errori logici
- usare riferimenti relativi, assoluti e misti
- leggere e correggere gli errori più comuni
- arrotondare risultati monetari in modo corretto

## Dato, formula, funzione: differenze operative

### Dato

Un dato è un valore scritto in cella. Può essere di vari tipi:

- testo: `Monitor 24"`
- numero: `249,90`
- percentuale: `15%`
- data: `18/03/2026`

### Formula

Una formula inizia sempre con `=` e combina celle/espressioni mediante operatori matematici o logici.

Esempio:

```text
=B2*C2
```

### Funzione

Una funzione è una formula predefinita fornita dal programma. La sua sintassi è:

```text
=FUNZIONE(argomento1; argomento2; ...)
```

- FUNZIONE è il nome della funzione (es. `SOMMA`, `MEDIA`, `SE`)
- argomenti sono i valori o intervalli su cui la funzione opera o i parametri che ne definiscono il comportamento.

Esempio:

```text
=SOMMA(D2:D20)
```

Per importi con valori decimali useremo spesso la funzione `ARROTONDA. Ecco la sua sintassi:

```text
=ARROTONDA(B2*C2;2)
```

Il primo parametro rappresenta il numero da arrotondare, mentre il secondo indica a quante cifre decimali arrotondare (in questo caso 2, per i centesimi).

## Operatori essenziali

Sono i simboli usati nelle formule per fare operazioni tra numeri o testo:

- `+` somma
- `-` sottrazione
- `*` moltiplicazione
- `/` divisione
- `^` potenza
- `&` unione di testo

Esempi:

```text
=B2+C2
=B2-C2
=B2*C2
=B2/C2
=A2&" - "&B2
```

## Riferimenti: relativo, assoluto, misto

I riferimenti indicano a quale cella o intervallo si riferisce la formula. Possono essere di vari tipi:

### Riferimento relativo

Il riferimento relativo è un riferimetno ad una cella che si adatta quando la formula viene copiata o trascinata in altre celle. Ad esempio, se hai la formula in `D2`:

```text
=B2*C2
```

Se trascini in basso diventa `=B3*C3`, `=B4*C4`, ecc.

`Nota bene:` trascinare una formula significa usare il mouse per prendere l'angolo in basso a destra della cella e spostarlo verso le celle vicine. In questo modo la formula si copia adattando i riferimenti relativi.

### Riferimento assoluto

Il riferimento assoluto è un riferimento ad una cella che resta fisso quando la formula viene copiata o trascinata. Si indica con il simbolo `$` prima della lettera della colonna e del numero della riga.

```text
=D2*$H$1
```

`$H$1` resta fisso quando trascini e punterà sempre alla cella H1.

### Riferimento misto

Il riferimento misto blocca solo la colonna o solo la riga. Esempio:

```text
=$B2*C$1
```

- `$B2` blocca la colonna B
- `C$1` blocca la riga 1

Quindi trascinando la formula in basso diventa `=$B3*C$1`, trascinando a destra diventa `=$B2*D$1`.

## Errori frequenti e come risolverli

### `#NOME?`

- `Causa tipica:` funzione scritta male (`=SOMA(A1:A5)`)
- `Soluzione:` controlla nome funzione e sintassi

### `#VALORE!`

- `Causa tipica:` operazione su tipi incompatibili (es. testo \* numero)
- `Soluzione:` verifica che i dati siano del tipo giusto (es. prezzo come numero, non testo)

### `#DIV/0!`

- `Causa tipica:` divisione per zero o cella vuota
- `Soluzione:` controlla denominatore, usa `SE.ERRORE` per gestire

### Risultato "strano" senza errore visibile

- `Causa tipica:` riferimento sbagliato dopo trascinamento
- `Soluzione:` controlla se serve `$` per fissare la riga, la colonna o la cella

## Esercizio: listino con sconto e IVA

Crea questa struttura in `L1_Formule`:
Intestazione colonna (riga 1):

- `A` Prodotto
- `B` Prezzo
- `C` Quantità
- `D` Subtotale
- `E` Sconto %
- `F` Netto
- `G` IVA
- `H` Totale finale

In `K1` inserisci l'aliquota IVA, cioè: `0,22`

Formule (riga 2):

- in D2: una formula per calcolare il subtotale (prezzo * quantità)
- in F2: una formula per calcolare il netto dopo sconto (subtotale - sconto)
- in G2: una formula per calcolare l'IVA (netto * aliquota)
- in H2: una formula per calcolare il totale finale (netto + IVA), arrotondato a 2 decimali

Compila poi 10 prodotti, applica le formule su tutti e 10 e verifica che i calcoli siano corretti.

In seguito aggiungi in fondo alla tabella:

- totale generale
- media prezzo
- valore minimo
- valore massimo

Poi gestisci arrotondamento e gestione errore:

1. Crea una colonna `Prezzo medio unitario = Totale/Quantità`.
2. Arrotonda il risultato a 2 decimali con `ARROTONDA`.
3. Gestisci divisioni non valide con:

```text
=SE.ERRORE(ARROTONDA(H2/C2;2);"Dato non valido")
```

# Lezione 2 - Funzioni avanzate essenziali per analizzare dati

## Obiettivi della lezione

A fine lezione devi saper:

- usare funzioni statistiche e logiche
- applicare criteri nelle formule
- combinare più funzioni nella stessa tabella
- costruire celle di riepilogo automatico
- recuperare dati da una tabella di riferimento con funzioni di ricerca

## 1) Funzioni di riepilogo indispensabili

```text
=SOMMA(D2:D100)
=MEDIA(D2:D100)
=MIN(D2:D100)
=MAX(D2:D100)
=CONTA.VALORI(A2:A100)
=CONTA.NUMERI(D2:D100)
```

Quando usarle:

- `SOMMA`: totale vendite/costi
- `MEDIA`: valore medio per periodo
- `MIN`/`MAX`: estremi
- `CONTA`: numero record

## 2) Funzione SE: decisioni automatiche

Sintassi:

```text
=SE(test_logico; valore_se_vero; valore_se_falso)
```

Esempi:

```text
=SE(C2<10;"Riordinare";"OK")
=SE(D2>=6;"Promosso";"Da recuperare")
=SE(E2>500;"Bonus";"No bonus")
```

## 3) SE annidato (livelli)

Esempio fascia vendite:

```text
=SE(D2<200;"Basso";SE(D2<500;"Medio";"Alto"))
```

Uso corretto:

- massimo 2-3 livelli in terza
- se diventa troppo lungo, spezza in colonne di supporto

## 4) Funzioni con criterio

### SOMMA.SE

```text
=SOMMA.SE(A2:A100;"Informatica";D2:D100)
```

Somma importi solo dove reparto = Informatica.

### CONTA.SE

```text
=CONTA.SE(B2:B100;"Mouse")
```

Conta quante righe hanno prodotto = Mouse.

### MEDIA.SE

```text
=MEDIA.SE(A2:A100;"Vendite";D2:D100)
```

Media importo solo per un reparto.

## 5) CERCA.VERT: recuperare dati da una tabella

`CERCA.VERT` è fondamentale quando hai un codice e vuoi recuperare in automatico un'informazione collegata.

Scenario tipico:

- nel foglio `Ordini` hai il `Codice prodotto`
- nel foglio `Listino` hai `Codice`, `Descrizione`, `Reparto`, `Prezzo`

Formula:

```text
=CERCA.VERT(A2;Listino!A:D;4;FALSO)
```

Significato argomenti:

- `A2`: valore da cercare (codice)
- `Listino!A:D`: tabella dove cercare
- `4`: colonna da restituire (prezzo)
- `FALSO`: corrispondenza esatta (sempre consigliata nei casi gestionali)

Versione robusta:

```text
=SE.ERRORE(CERCA.VERT(A2;Listino!A:D;4;FALSO);"Codice non trovato")
```

## 6) INDICE + CONFRONTA: ricerca più flessibile

`CERCA.VERT` richiede che la chiave sia nella prima colonna della tabella.
`INDICE` + `CONFRONTA` è più flessibile e robusto.

Esempio: recuperare prezzo dal foglio `Listino` cercando il codice in colonna `A`.

```text
=INDICE(Listino!D:D;CONFRONTA(A2;Listino!A:A;0))
```

Versione con gestione errore:

```text
=SE.ERRORE(INDICE(Listino!D:D;CONFRONTA(A2;Listino!A:A;0));"Codice non trovato")
```

Quando preferirla:

- tabella che cambia spesso struttura
- ricerca verso sinistra/destra senza vincoli
- modelli più stabili nel tempo

## 7) Funzioni con più criteri (livello avanzato)

### SOMMA.PIÙ.SE

```text
=SOMMA.PIÙ.SE(E2:E200;A2:A200;"Vendite";D2:D200;">=100")
```

Somma `E` dove:

- reparto = Vendite
- quantità >= 100

### CONTA.PIÙ.SE

```text
=CONTA.PIÙ.SE(A2:A200;"Vendite";F2:F200;"Aperto")
```

Conta ordini aperti nel reparto Vendite.

## 8) Gestione errori formula

Con `SE.ERRORE` eviti messaggi tecnici in output finale.

```text
=SE.ERRORE(B2/C2;0)
```

o

```text
=SE.ERRORE(B2/C2;"Dato non valido")
```

## 9) Esempio guidato completo: dashboard mini vendite + listino

Struttura dati (`A:F`):

- Data
- Reparto
- Prodotto
- Quantità
- Prezzo unitario
- Importo

Foglio di supporto `Listino`:

- `A` Codice
- `B` Descrizione
- `C` Reparto
- `D` Prezzo listino

In `F2`:

```text
=D2*E2
```

Area riepilogo (`H:K`):

- totale vendite
- media importo
- vendite reparto Informatica
- ordini aperti > 300

Formule possibili:

```text
H2 = SOMMA(F2:F200)
H3 = MEDIA(F2:F200)
H4 = SOMMA.SE(B2:B200;"Informatica";F2:F200)
H5 = CONTA.PIÙ.SE(B2:B200;"Vendite";F2:F200;">300")
G2 = SE.ERRORE(CERCA.VERT(A2;Listino!A:D;4;FALSO);"Codice non trovato")
```

## 10) Esercizi Lezione 2

### Esercizio 1 - Riepilogo base

Su 30 righe di vendite calcola:

- totale
- media
- minimo
- massimo

### Esercizio 2 - Regola automatica

Crea colonna `Stato scorta` con `SE`:

- `Riordinare` se quantità < soglia
- `OK` altrimenti

### Esercizio 3 - Criteri

Calcola:

- totale vendite del reparto `Amministrazione`
- numero ordini con stato `Aperto`
- media importi per reparto `Vendite`

### Esercizio 4 - Multi-criterio

Conta ordini:

- reparto `Informatica`
- stato `Aperto`
- importo > 200

Usa `CONTA.PIÙ.SE`.

### Esercizio 5 - CERCA.VERT su listino

Hai una tabella `Ordini` con solo codice prodotto.
Recupera automaticamente:

- descrizione
- reparto
- prezzo

usando `CERCA.VERT` con corrispondenza esatta.

### Esercizio 6 - Confronto CERCA.VERT vs INDICE+CONFRONTA

Risolvi la stessa ricerca in due modi:

1. con `CERCA.VERT`
2. con `INDICE+CONFRONTA`

Poi scrivi 3 righe su quale soluzione preferisci e perché.

---

# Lezione 3 - Qualità del dato: convalida, pulizia e coerenza

## Obiettivi della lezione

A fine lezione devi saper:

- prevenire errori in inserimento
- costruire convalide efficaci
- riconoscere incoerenze nei dati
- migliorare affidabilità del file

## 1) Perché la qualità del dato è centrale

Regola fondamentale:

- se i dati sono sporchi, i risultati sono inutili

Errori tipici in classe e in azienda:

- reparti scritti in modi diversi (`Vendite`, `vendite`, `Vendita`)
- date non valide
- quantità negative
- codici non univoci
- campi vuoti dove non dovrebbero esserci

## 2) Convalida dati: idea e tipi principali

La convalida è un filtro in ingresso.
Accetta solo valori conformi a una regola.

Tipi usati nel modulo:

- numero intero
- numero decimale
- data
- elenco
- lunghezza testo

## 3) Regole consigliate per tabella Ordini

Campi:

- `ID Ordine`
- `Data Ordine`
- `Reparto`
- `Prodotto`
- `Quantità`
- `Prezzo`
- `Stato`

Convalide:

- `ID Ordine`: intero > 0
- `Data Ordine`: tra `01/01/2025` e `31/12/2026`
- `Reparto`: elenco prefissato
- `Quantità`: intero tra 1 e 100
- `Prezzo`: numero > 0
- `Stato`: elenco `Aperto`, `In lavorazione`, `Chiuso`

## 4) Liste di supporto (buona pratica)

Crea un'area laterale (es. `M1:M10`) con valori elenco:

- Informatica
- Amministrazione
- Vendite
- Magazzino

Poi usa quella gamma come sorgente della convalida.
Vantaggio: se cambia un reparto, aggiorni solo la lista.

Se hai un archivio con reparti ripetuti, puoi generare la lista in automatico con `UNICI`:

```text
=UNICI(B2:B200)
```

In questo modo la convalida pesca valori già puliti e senza duplicati.

## 5) Messaggi di input e avviso errore

Quando possibile configura:

- messaggio input (cosa inserire)
- avviso errore (cosa è stato rifiutato)

Esempio messaggio:

- "Inserire quantità intera da 1 a 100"

## 6) Pulizia base dei dati già inseriti

Operazioni utili:

- rimuovere spazi iniziali/finali
- uniformare maiuscole/minuscole
- correggere formati data
- trovare duplicati

Funzioni utili (se disponibili):

```text
=ANNULLA.SPAZI(A2)
=MAIUSC(A2)
=MINUSC(A2)
```

## 7) Evidenziazione errori (formattazione condizionale)

Esempi:

- quantità < 1 o > 100 in rosso
- data vuota in giallo
- stato diverso da elenco in arancione

Anche se non richiesta in verifica, aiuta molto nella revisione.

## 8) Esempio guidato completo

1. Crea tabella Ordini con 20 righe.
2. Applica convalide su reparto, quantità, data, stato.
3. Inserisci volontariamente 5 errori.
4. Osserva quali errori vengono bloccati.
5. Scrivi un breve report: "errori prevenuti".

## 9) Esercizi Lezione 3

### Esercizio 1 - Setup convalida completo

Costruisci tabella e applica tutte le convalide richieste.

### Esercizio 2 - Test di robustezza

Prova 8 inserimenti, di cui 4 sbagliati.
Annota quali passano e quali no.

### Esercizio 3 - Uniformità dati

Correggi un dataset "sporco" fornito dal docente (reparti incoerenti, date miste, spazi).

### Esercizio 4 - Controllo duplicati

Segna eventuali ID ordine ripetuti e correggili.

### Esercizio 5 - Elenco dinamico per convalida

1. Crea un elenco reparti con `UNICI` a partire dai dati ordini.
2. Usa quell'elenco come origine della convalida dati nella colonna `Reparto`.
3. Aggiungi un nuovo reparto nei dati e verifica che la lista si aggiorni.

---

# Lezione 4 - Ordinamento e filtri per analisi operativa

## Obiettivi della lezione

A fine lezione devi saper:

- ordinare per una o più colonne
- applicare filtri testuali, numerici e per data
- rispondere a domande reali con i dati filtrati
- evitare errori di analisi dopo filtri/ordinamenti

## 1) Dato grezzo vs dato leggibile

Una tabella non ordinata può contenere le informazioni giuste ma essere poco utile.
Ordinare e filtrare significa trasformare dati in risposte.

## 2) Ordinamento: regole corrette

Prima di ordinare:

- seleziona tutta la tabella
- verifica intestazioni corrette
- evita righe vuote interne

Tipi:

- crescente (A-Z, 0-9)
- decrescente (Z-A, 9-0)
- ordinamento multiplo (prima reparto, poi importo)

## 3) Filtri automatici: uso pratico

Filtri principali:

- per testo (contiene, inizia con)
- per numero (> < = tra)
- per data (mese, anno, intervallo)
- per colore (se usato)

Esempi:

- ordini `Aperto`
- importo > 300
- reparto = Informatica
- data nel mese di marzo

## 4) FILTRO: vista dinamica con formula

Oltre al filtro manuale, in Google Fogli puoi usare `FILTRO` per creare una vista dinamica in un'altra area del foglio.

Esempio: mostra solo ordini aperti con importo > 250.

```text
=FILTRO(A2:F200;F2:F200="Aperto";E2:E200>250)
```

Vantaggi:

- non tocchi la tabella originale
- ottieni un output aggiornato automaticamente
- puoi usare più condizioni in una sola formula

Gestione caso senza risultati:

```text
=SE.ERRORE(FILTRO(A2:F200;F2:F200="Aperto";E2:E200>250);"Nessun risultato")
```

## 5) Domande tipiche da risolvere con filtri

- quali prodotti sono sotto scorta?
- quanti ordini aperti ha il reparto X?
- quali sono i 10 importi maggiori?
- quante spese superano 500 euro?

## 6) Ordinamento multiplo: esempio operativo

Tabella:

- `Reparto`
- `Stato`
- `Importo`

Obiettivo:

1. prima `Reparto` A-Z
2. poi `Stato` (`Aperto` prima di `Chiuso`)
3. poi `Importo` decrescente

Risultato: lettura più rapida per blocchi logici.

## 7) Attenzione agli errori frequenti

Errore 1:

- ordinare una sola colonna e non tutta la tabella

Errore 2:

- lasciare filtro attivo e fare calcoli pensando di vedere tutto

Errore 3:

- confondere record nascosti con record eliminati

Buona pratica:

- prima di consegna, rimuovi tutti i filtri e ricontrolla

## 8) Funzioni utili insieme ai filtri

Quando hai filtri attivi puoi usare:

```text
=SUBTOTALE(9;E2:E200)
```

`9` corrisponde alla somma dei soli record visibili.

Altri codici utili:

- `1` media
- `2` conta numeri

## 9) Esempio guidato completo

Dataset `Ordini_Annuali` con 100 righe.

Consegna guidata:

1. ordina per `Reparto`, poi `Importo` desc
2. filtra `Stato = Aperto`
3. filtra anche `Importo > 250`
4. calcola totale visibile con `SUBTOTALE`
5. rispondi: quanti record restano?

## 10) Esercizi Lezione 4

### Esercizio 1 - Ricerca top valori

Trova i 5 ordini con importo maggiore e copia i risultati in una sezione report.

### Esercizio 2 - Filtri combinati

Mostra solo:

- reparto `Vendite`
- stato `Aperto`
- importo >= 200

### Esercizio 3 - Analisi per data

Filtra gli ordini del mese di marzo e calcola:

- totale importo
- media importo

### Esercizio 4 - FILTRO con condizioni

In un'area report separata, usa una formula `FILTRO` che mostri solo:

- reparto `Informatica`
- stato `Aperto`
- importo > 300

Gestisci il caso senza risultati con `SE.ERRORE`.

### Esercizio 5 - Domande di comprensione

Rispondi in celle dedicate:

- quale reparto ha più ordini aperti?
- quale prodotto compare più spesso?
- qual è l'importo massimo in `Informatica`?

---

# Lezione 5 - Grafici e formato CSV: comunicare e scambiare dati

## Obiettivi della lezione

A fine lezione devi saper:

- scegliere il grafico adatto al problema
- costruire grafici leggibili
- esportare e importare CSV
- riconoscere limiti del formato CSV

## 1) Perché usare i grafici

Un grafico non sostituisce la tabella: la completa.

Serve per:

- confrontare categorie
- vedere trend nel tempo
- mostrare proporzioni

## 2) Scelta del grafico corretto

### Colonne

Uso:

- confronto tra reparti/prodotti

Esempio:

- vendite per reparto nel trimestre

### Linee

Uso:

- andamento nel tempo

Esempio:

- vendite mese per mese

### Torta

Uso:

- ripartizione percentuale con poche categorie

Esempio:

- quota vendite per reparto

Attenzione:

- evita torta con troppe categorie

## 3) Regole di leggibilità

Ogni grafico deve avere:

- titolo chiaro
- etichette coerenti
- legenda comprensibile
- unità di misura (euro, pezzi, %)

Da evitare:

- 3D inutile
- colori casuali senza significato
- asse non leggibile

## 4) Grafico da tabella pivot (opzionale avanzato)

Se disponibile nello strumento:

1. crea tabella pivot da dataset ordini
2. righe = reparto
3. valori = somma importo
4. inserisci grafico da pivot

Vantaggio:

- aggiornamento veloce quando i dati cambiano

## 5) CSV: cos'è e a cosa serve

CSV = `Comma-Separated Values`.
È un file di testo con campi separati da un delimitatore.

Vantaggi:

- interscambio tra software diversi
- file leggero
- facile importazione in database e applicazioni

Limiti:

- niente formattazione grafica
- niente formule complesse salvate come struttura di foglio
- niente grafici incorporati

## 6) Export CSV: controlli importanti

Prima di esportare:

- rimuovi filtri non desiderati
- controlla intestazioni colonna
- verifica formato data
- verifica separatore decimale

Dopo esportazione:

- riapri CSV
- controlla se colonne sono allineate
- verifica caratteri speciali

## 7) Import CSV: problemi comuni

Problema 1:

- tutte le colonne in una sola cella

Causa:

- delimitatore non riconosciuto

Soluzione:

- usa import guidato e scegli il separatore corretto (`;` o `,`)

Problema 2:

- date convertite male

Soluzione:

- imposta formato data durante import

Problema 3:

- zeri iniziali persi (codici)

Soluzione:

- imposta colonna come testo

## 8) Esempio guidato completo

1. Tabella `Vendite_Mensili` con colonne:
   - Mese
   - Reparto
   - Importo
2. Crea grafico a colonne per confronto reparti.
3. Crea grafico a linee per andamento mensile.
4. Esporta la tabella in CSV.
5. Importa il CSV in un nuovo file.
6. Confronta originale e importato.

## 9) Esercizi Lezione 5

### Esercizio 1 - Grafico confronto

Crea un grafico a colonne con titolo `Confronto vendite reparti`.

### Esercizio 2 - Grafico trend

Crea un grafico a linee con asse temporale ordinato.

### Esercizio 3 - Scelta motivata

Scrivi 4 righe: quale grafico comunica meglio e perché.

### Esercizio 4 - Export/Import CSV

Esporta, reimporta, poi elenca almeno 3 differenze rispetto al file originale.

---

# Lezione 6 - Simulazione verifica (prova guidata)

## Obiettivo

Allenarsi in condizioni simili alla verifica reale, con tempi e consegna strutturata.

## Durata

1 ora.

## Consegna simulazione

Usa un file con dati ordini/vendite e completa tutte le richieste.

### Parte A - Formule e funzioni

1. Calcola `Importo = Quantità*Prezzo`.
2. Crea `Stato scorta` con `SE`.
3. Calcola totale vendite reparto `Informatica` con funzione a criterio.
4. Recupera il prezzo da un foglio `Listino` con `CERCA.VERT` oppure `INDICE+CONFRONTA`.

### Parte B - Qualità dato

4. Applica convalida su:
   - Reparto da elenco
   - Quantità 1..100
   - Data valida

### Parte C - Analisi

5. Ordina per Reparto e Importo desc.
6. Filtra ordini aperti con importo > 250.
7. Calcola totale visibile con `SUBTOTALE`.

### Parte D - Comunicazione dati

8. Crea grafico corretto con titolo e legenda.
9. Esporta il foglio in CSV.

## Griglia di autocontrollo prima consegna

- formule trascinate correttamente
- nessun riferimento errato
- convalide attive
- filtro coerente con richiesta
- grafico leggibile
- file ordinato e intestazioni chiare

## Errori tipici da evitare

- usare `SOMMA` dove serve `SOMMA.SE`
- dimenticare `FALSO` in `CERCA.VERT` quando serve corrispondenza esatta
- filtro applicato alla colonna sbagliata
- grafico senza titolo
- CSV esportato con foglio sbagliato

## Correzione guidata finale

Dopo la simulazione:

- confronto tra soluzioni diverse
- discussione sugli errori più frequenti
- strategia per migliorare velocità e precisione

---

# Lezione 7 - Verifica finale Modulo 3

## Tipologia

**Prova pratica al PC**, coerente con le competenze del modulo.

## Struttura della prova

- 4 esercizi formule/funzioni (inclusa almeno una ricerca dati)
- 1 esercizio convalida dati
- 1 esercizio ordinamento/filtri
- 1 grafico
- 1 domanda breve o micro-operazione su CSV

## Tempo previsto

1 ora.

## Materiale consentito

- file consegnato dal docente
- strumenti standard del foglio di calcolo
- non è consentito usare file esterni non autorizzati

## Criteri di valutazione

### Correttezza operativa

- formule giuste
- filtri/ordinamenti corretti
- grafico coerente

### Autonomia

- svolgimento senza guida continua
- gestione problemi di base in autonomia

### Ordine del file

- struttura chiara
- intestazioni corrette
- formati coerenti

### Comprensione consegna

- rispetto di tutte le richieste
- attenzione ai dettagli (criteri, soglie, range)

### Uso strumenti base e avanzati

- formule con criterio
- convalida dati
- filtri
- CSV

## Esempio di traccia verifica

Dataset fornito con colonne:

- Data
- Reparto
- Prodotto
- Quantità
- Prezzo
- Stato

Richieste:

1. calcolare importo
2. aggiungere stato scorta con `SE`
3. sommare importi solo reparto `Vendite`
4. convalidare quantità 1..100
5. ordinare per reparto + importo desc
6. filtrare ordini `Aperto` con importo > 300
7. creare grafico a colonne per reparto
8. esportare in CSV

## Motivazione didattica della prova pratica

La prova pratica misura le abilità realmente richieste dal modulo:

- applicare formule avanzate
- garantire qualità del dato
- leggere dati con filtri e ordinamenti
- rappresentare informazioni con grafici
- gestire scambio dati tramite CSV

È quindi la scelta più coerente con gli obiettivi formativi.

---

# Appendice A - Formula sheet rapido

## Operatori

```text
+  somma
-  sottrazione
*  moltiplicazione
/  divisione
^  potenza
&  unione testo
```

## Funzioni principali

```text
=SOMMA(intervallo)
=MEDIA(intervallo)
=MIN(intervallo)
=MAX(intervallo)
=ARROTONDA(numero;num_cifre)
=SE(test;vero;falso)
=SOMMA.SE(intervallo_criterio;criterio;intervallo_somma)
=CONTA.SE(intervallo;criterio)
=SOMMA.PIÙ.SE(intervallo_somma;intervallo_criterio1;criterio1;...)
=CONTA.PIÙ.SE(intervallo_criterio1;criterio1;...)
=CERCA.VERT(chiave;tabella;indice_colonna;FALSO)
=INDICE(intervallo_ritorno;CONFRONTA(chiave;intervallo_ricerca;0))
=FILTRO(intervallo;condizione1;condizione2;...)
=UNICI(intervallo)
=SE.ERRORE(formula;valore_se_errore)
=SUBTOTALE(codice_funzione;intervallo)
```

## Riferimenti

```text
A1   relativo
$A$1 assoluto
$A1  colonna fissa
A$1  riga fissa
```

---

# Appendice B - Checklist finale studente

Prima di consegnare qualsiasi esercizio:

1. ho controllato che tutte le formule inizino con `=`
2. ho verificato che i riferimenti siano corretti dopo trascinamento
3. ho verificato i formati (numero, %, data, valuta)
4. ho controllato se ci sono errori visibili (`#NOME?`, `#VALORE!`, `#DIV/0!`)
5. ho rimosso filtri non necessari
6. ho dato un titolo chiaro al grafico
7. ho controllato che il CSV si apra correttamente

---

# Appendice C - Mini rubriche valutazione esercizi (auto-valutazione)

## Livello Base

- esegue formule semplici
- applica filtri base
- crea un grafico essenziale

## Livello Intermedio

- usa funzioni con criterio
- applica convalida dati in modo corretto
- interpreta risultati filtrati

## Livello Avanzato

- combina più funzioni con logica corretta
- evita errori strutturali
- produce file ordinato, leggibile, esportabile
