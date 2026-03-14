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
- `L2_Funzioni_Criteri`
- `L3_Ricerche`
- `L4_Tabelle_Filtri_Pivot`
- `L5_Convalida_Pulizia`
- `L6_Grafici_CSV`
- `L7_Simulazione`
- `L8_Verifica`

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
  Non mischiare nella stessa colonna numeri, testo e simboli scritti a mano. Per applicare un formato, seleziona la colonna (o riga, o cella) e scegli il formato numerico adatto (es. `Valuta`, `Percentuale`, `Data`).

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

Crea nel foglio `L1_Formule` una tabella con queste intestazioni (riga 1):

- `A` Prodotto
- `B` Prezzo
- `C` Quantità
- `D` Subtotale
- `E` Sconto %
- `F` Netto
- `G` IVA
- `H` Totale finale

Inserisci in `K1` l'aliquota IVA: `0,22`.

Scrivi poi le formule in riga 2:

- in `D2`: calcola il subtotale (`Prezzo * Quantità`)
- in `F2`: calcola il netto dopo lo sconto (`Subtotale - sconto`)
- in `G2`: calcola l'IVA (`Netto * aliquota`)
- in `H2`: calcola il totale finale (`Netto + IVA`) arrotondato a 2 decimali

Compila almeno 10 prodotti, trascina le formule su tutte le righe e controlla che i risultati siano coerenti (nella colonna Sconto % devi inserire un numero seguito dal simbolo `%`, es. `15%`). A fine tabella aggiungi una piccola area riepilogo con:

- Totale generale
- Media prezzo

Ed usa delle formule appropriate per calcolare questi valori.

Infine aggiungi la colonna **Prezzo medio unitario**, dato dal totale finale diviso la quantità, arrotondato a 2 decimali.

# Lezione 2 - Funzioni essenziali: riepilogo, SE e criteri

## Obiettivi della lezione

A fine lezione devi saper:

- ripassare le funzioni base di riepilogo
- usare `SE` per creare decisioni automatiche
- applicare più criteri con `SOMMA.PIÙ.SE` e `CONTA.PIÙ.SE`
- costruire una piccola area report leggibile e automatica

## 1) Ripasso formule base: somma, media, minimo, massimo e conta

```text
=SOMMA(D2:D100)
=MEDIA(D2:D100)
=MIN(D2:D100)
=MAX(D2:D100)
=CONTA.NUMERI(D2:D100)
=CONTA.VALORI(A2:A100)
```

Quando usarle:

- `SOMMA`: totale vendite/costi
- `MEDIA`: valore medio per periodo
- `MIN`/`MAX`: estremi
- `CONTA.NUMERI`/`CONTA.VALORI`: numero di celle compilate o numeriche

## 2) Funzione SE

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

## 3) Funzioni con più criteri

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

## 4) Esempio guidato completo: mini report vendite

Struttura dati (`A:G`):

- Data
- Reparto
- Prodotto
- Quantità
- Prezzo unitario
- Importo
- Stato

In `F2`:

```text
=D2*E2
```

Area riepilogo (`H:K`):

- totale vendite
- media importo
- importo minimo
- importo massimo
- numero righe compilate
- totale ordini reparto Informatica con quantità >= 5
- totale ordini reparto Vendite con importo >= 100

Formule possibili:

```text
H2 = SOMMA(F2:F200)
H3 = MEDIA(F2:F200)
H4 = MIN(F2:F200)
H5 = MAX(F2:F200)
H6 = CONTA.VALORI(C2:C200)
H7 = SOMMA.PIÙ.SE(F2:F200;B2:B200;"Informatica";D2:D200;">=5")
H8 = CONTA.PIÙ.SE(B2:B200;"Vendite";G2:G200;"Aperto")
H9 = SOMMA.PIÙ.SE(F2:F200;B2:B200;"Vendite";D2:D200;">=100")
G2 = SE(D2<10;"Riordinare";"OK")
```

## 5) Esercizio Lezione 2

Nel foglio `L2_Funzioni_Criteri` crea una tabella vendite con almeno 30 righe e le colonne `Data`, `Reparto`, `Prodotto`, `Quantità`, `Prezzo unitario`, `Importo`, `Stato`.

Consegna:

- calcola `Importo`
- crea la colonna `Stato scorta` con `SE`
- costruisci una piccola area riepilogo con `SOMMA`, `MEDIA`, `MIN`, `MAX` e una funzione di conta
- calcola il totale del reparto `Informatica` con quantità >= 5 usando `SOMMA.PIÙ.SE`
- conta gli ordini del reparto `Vendite` con stato `Aperto` usando `CONTA.PIÙ.SE`
- calcola il totale del reparto `Amministrazione` con quantità >= 3 usando `SOMMA.PIÙ.SE`

---

# Lezione 3 - Ricerca dati: CERCA.VERT, CERCA.X e SE.ERRORE

## Obiettivi della lezione

A fine lezione devi saper:

- recuperare dati da una tabella di supporto
- distinguere tra `CERCA.VERT` e `CERCA.X`
- scegliere la funzione di ricerca più adatta al caso
- gestire gli errori in modo leggibile con `SE.ERRORE`

## 1) Perché servono le funzioni di ricerca

Scenario tipico:

- nel foglio `Ordini` hai solo il codice prodotto
- nel foglio `Listino` hai `Codice`, `Descrizione`, `Reparto`, `Prezzo`

Obiettivo:

- inserire il codice una sola volta
- far compilare in automatico le altre informazioni

## 2) CERCA.VERT

Formula base:

```text
=CERCA.VERT(A2;Listino!A:D;4;FALSO)
```

Significato argomenti:

- `A2`: valore da cercare
- `Listino!A:D`: tabella di riferimento
- `4`: colonna da restituire
- `FALSO`: corrispondenza esatta

Punto forte:

- semplice e immediato

Limite:

- cerca solo verso destra
- la chiave deve stare nella prima colonna della tabella

## 3) CERCA.X

Se disponibile nello strumento, `CERCA.X` è più leggibile.

Esempio:

```text
=CERCA.X(A2;Listino!A:A;Listino!D:D;"Codice non trovato")
```

Vantaggi:

- non devi contare il numero della colonna
- può cercare sia a destra sia a sinistra
- può già mostrare un messaggio se il codice manca



## 4) SE.ERRORE

Serve per evitare messaggi tecnici in output finale.

Esempi:

```text
=SE.ERRORE(CERCA.VERT(A2;Listino!A:D;4;FALSO);"Codice non trovato")
=SE.ERRORE(CERCA.X(A2;Listino!A:A;Listino!D:D;"Codice non trovato");"Codice non trovato")
```

Uso corretto:

- nasconde l'errore tecnico
- mostra un messaggio utile a chi legge il file
- non sostituisce il controllo dei dati sorgente

## 5) Esempio guidato completo

Foglio `Ordini`:

- `A` Codice
- `B` Descrizione
- `C` Reparto
- `D` Prezzo

Foglio `Listino`:

- `A` Codice
- `B` Descrizione
- `C` Reparto
- `D` Prezzo listino

Formule possibili:

```text
B2 = SE.ERRORE(CERCA.VERT(A2;Listino!A:D;2;FALSO);"Codice non trovato")
C2 = SE.ERRORE(CERCA.X(A2;Listino!A:A;Listino!C:C;"Codice non trovato");"Codice non trovato")
```

## 6) Esercizio Lezione 3

Nel foglio `L3_Ricerche` prepara una tabella `Ordini` con la colonna `Codice` e un foglio `Listino` con le colonne `Codice`, `Descrizione`, `Reparto`, `Prezzo`.

Consegna:

- recupera `Descrizione` e `Prezzo` con `CERCA.VERT`
- recupera `Reparto` con `CERCA.X`
- inserisci almeno 3 codici inesistenti
- gestisci i codici non trovati con `SE.ERRORE`
- scrivi in 2 righe quale funzione ti sembra più comoda tra `CERCA.VERT` e `CERCA.X`

---

# Lezione 4 - Tabelle, filtri e tabelle pivot

## Obiettivi della lezione

A fine lezione devi saper:

- trasformare un intervallo dati in una tabella leggibile
- ordinare per una o più colonne
- applicare filtri testuali, numerici e per data
- bloccare le prime righe per lavorare meglio su dataset lunghi
- usare `SUBTOTALE` su dati filtrati
- creare una tabella pivot molto semplice
- rispondere a domande reali con i dati filtrati
- distinguere tra filtro sul foglio base e analisi con pivot

## 1) Dato grezzo vs tabella leggibile

Una tabella non ordinata può contenere le informazioni giuste ma essere poco utile.
Ordinare e filtrare significa trasformare dati in risposte.

Prima regola:

- i dati devono avere intestazioni chiare
- non devono esserci righe o colonne vuote interne
- il blocco dati deve essere continuo

Nel lavoro reale, soprattutto in Excel, conviene spesso usare `Formatta come tabella`.
Questo rende più leggibile il dataset e attiva strumenti pratici di filtro e riepilogo.

## 2) Trasforma in tabella e usa i filtri tabella

Vantaggi pratici:

- intestazione evidenziata
- filtri attivi subito su ogni colonna
- lettura più chiara
- aggiornamento più semplice quando aggiungi nuove righe

Idea chiave della lezione:

- alcune operazioni di filtro si possono fare direttamente sul foglio base
- se trasformi l'intervallo in tabella, soprattutto in Excel, hai anche strumenti dedicati nella scheda `Tabella`

## 3) Blocca la visualizzazione: prime righe e intestazione

Ordine consigliato in un file ordinato:

- in alto eventuali righe con filtri o criteri
- subito sotto l'intestazione della tabella
- poi il blocco dei dati

Quando il dataset è lungo, blocca le prime righe così intestazioni e criteri restano sempre visibili.

## 4) Ordinamento: regole corrette

Prima di ordinare:

- seleziona tutta la tabella
- verifica intestazioni corrette
- evita righe vuote interne

Tipi:

- crescente (A-Z, 0-9)
- decrescente (Z-A, 9-0)
- ordinamento multiplo (prima reparto, poi importo)

## 5) Filtri automatici: uso pratico

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

## 6) Domande tipiche da risolvere con filtri

- quali prodotti sono sotto scorta?
- quanti ordini aperti ha il reparto X?
- quali sono i 10 importi maggiori?
- quante spese superano 500 euro?

## 7) `SUBTOTALE` sui dati filtrati

Quando filtri la tabella, `SUBTOTALE` calcola solo i record visibili.

```text
=SUBTOTALE(9;E2:E200)
```

`9` corrisponde alla somma.

Altri codici utili:

- `1` media
- `2` conta numeri

Questa funzione è utile perché, in pratica, si comporta come un riepilogo rapido dei dati selezionati dal filtro.

## 8) Tabelle pivot: primo contatto

Una tabella pivot serve per riassumere molti dati senza scrivere formule lunghe.

Esempio base:

- righe = `Reparto`
- valori = somma `Importo`
- filtri = `Stato`

Uso didattico della lezione:

- mostrare che dal foglio base puoi filtrare e controllare i dati originali
- mostrare che la pivot serve invece per riassumere gli stessi dati in modo più veloce

## 9) Ordinamento multiplo: esempio operativo

Tabella:

- `Reparto`
- `Stato`
- `Importo`

Obiettivo:

1. prima `Reparto` A-Z
2. poi `Stato` (`Aperto` prima di `Chiuso`)
3. poi `Importo` decrescente

Risultato: lettura più rapida per blocchi logici.

## 10) Attenzione agli errori frequenti

Errore 1:

- ordinare una sola colonna e non tutta la tabella

Errore 2:

- lasciare filtro attivo e fare calcoli pensando di vedere tutto

Errore 3:

- confondere record nascosti con record eliminati

Buona pratica:

- prima di consegna, rimuovi tutti i filtri e ricontrolla

## 11) Esempio guidato completo

Dataset `Ordini_Annuali` con 100 righe.

Consegna guidata:

1. trasforma l'intervallo in tabella
2. blocca la riga delle intestazioni
3. ordina per `Reparto`, poi `Importo` desc
4. filtra `Stato = Aperto`
5. filtra anche `Importo > 250`
6. calcola totale visibile con `SUBTOTALE`
7. crea una tabella pivot con somma importi per reparto

## 12) Esercizio Lezione 4

Nel foglio `L4_Tabelle_Filtri_Pivot` crea o incolla un dataset ordini con almeno 50 righe.

Consegna:

- trasforma l'intervallo in tabella
- blocca la riga delle intestazioni
- ordina i dati per `Reparto` e poi per `Importo` decrescente
- filtra solo gli ordini `Aperto` con importo >= 200
- calcola il totale dei record visibili con `SUBTOTALE`
- crea una tabella pivot con somma `Importo` per `Reparto`


---

# Lezione 5 - Qualità del dato: convalida, pulizia e coerenza

## Obiettivi della lezione

A fine lezione devi saper:

- prevenire errori in inserimento
- costruire convalide efficaci
- pulire testi e codici già inseriti
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



## 5) Pulizia base dei dati già inseriti

Operazioni utili:

- rimuovere spazi iniziali/finali
- uniformare maiuscole/minuscole
- estrarre parti utili da un codice
- correggere formati data
- trovare duplicati

Funzioni utili (se disponibili):

```text
=ANNULLA.SPAZI(A2)
=MAIUSC(A2)
=MINUSC(A2)
=STRINGA.ESTRAI(A2;4;3)
```

Esempio pratico:

- da `ORD-2026-015` puoi estrarre `2026` oppure `015` per costruire controlli o colonne di supporto

## 6) Evidenziazione errori (formattazione condizionale)

Esempi:

- quantità < 1 o > 100 in rosso
- data vuota in giallo
- stato diverso da elenco in arancione

Anche se non richiesta in verifica, aiuta molto nella revisione.

## 7) Esempio guidato completo

1. Crea tabella Ordini con 20 righe.
2. Applica convalide su reparto, quantità, data, stato.
3. Pulisci una colonna con `ANNULLA.SPAZI`.
4. Estrai una parte del codice con `STRINGA.ESTRAI`.
5. Inserisci volontariamente 5 errori.
6. Osserva quali errori vengono bloccati.

## 8) Esercizio Lezione 5

Nel foglio `L5_Convalida_Pulizia` costruisci una tabella `Ordini` con almeno 20 righe e alcune celle volutamente sporche o sbagliate.

Consegna:

- applica le convalide su `Data`, `Reparto`, `Quantità` e `Stato`
- crea una piccola lista di supporto per il campo `Reparto`
- pulisci una colonna testo con `ANNULLA.SPAZI`
- usa `STRINGA.ESTRAI` per ricavare una parte utile da un codice
- individua almeno 2 errori o duplicati e correggili

---

# Lezione 6 - Grafici e formato CSV: comunicare e scambiare dati

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



## 4) CSV: cos'è e a cosa serve

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

## 5) Export CSV: controlli importanti

Prima di esportare:

- rimuovi filtri non desiderati
- controlla intestazioni colonna
- verifica formato data
- verifica separatore decimale

Dopo esportazione:

- riapri CSV
- controlla se colonne sono allineate
- verifica caratteri speciali

## 6) Import CSV: problemi comuni

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

## 7) Esempio guidato completo

1. Tabella `Vendite_Mensili` con colonne:
   - Mese
   - Reparto
   - Importo
2. Crea grafico a colonne per confronto reparti.
3. Crea grafico a linee per andamento mensile.
4. Esporta la tabella in CSV.
5. Importa il CSV in un nuovo file.
6. Confronta originale e importato.

## 8) Esercizio Lezione 6

Nel foglio `L6_Grafici_CSV` prepara una tabella `Vendite_Mensili` con colonne `Mese`, `Reparto`, `Importo`.

Consegna:

- crea un grafico a colonne per confrontare i reparti
- crea un grafico a linee per mostrare l'andamento mensile
- scrivi in 2 righe quale dei due grafici comunica meglio ciascuna informazione
- esporta la tabella in CSV
- importa il CSV in un nuovo foglio e controlla che colonne e date siano corrette

---

# Lezione 7 - Simulazione verifica (prova guidata)

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
4. Recupera il prezzo da un foglio `Listino` con `CERCA.VERT` oppure `CERCA.X`

### Parte B - Qualità dato

5. Applica convalida su:
   - Reparto da elenco
   - Quantità 1..100
   - Data valida

### Parte C - Pulizia e controllo

6. Pulisci una colonna testo con `ANNULLA.SPAZI` oppure estrai una parte del codice con `STRINGA.ESTRAI`.

### Parte D - Analisi

7. Trasforma il dataset in tabella.
8. Ordina per Reparto e Importo desc.
9. Filtra ordini aperti con importo > 250.
10. Calcola totale visibile con `SUBTOTALE`.
11. Crea una tabella pivot base per reparto.

### Parte E - Comunicazione dati

12. Crea grafico corretto con titolo e legenda.
13. Esporta il foglio in CSV.

## Griglia di autocontrollo prima consegna

- formule trascinate correttamente
- nessun riferimento errato
- convalide attive
- pulizia dati eseguita dove richiesta
- filtro coerente con richiesta
- pivot leggibile
- grafico leggibile
- file ordinato e intestazioni chiare

## Errori tipici da evitare

- usare `SOMMA` dove serve `SOMMA.PIÙ.SE`
- dimenticare `FALSO` in `CERCA.VERT` quando serve corrispondenza esatta
- usare `CERCA.VERT` su una tabella dove la chiave non è nella prima colonna
- filtro applicato alla colonna sbagliata
- non bloccare l'intestazione in un dataset lungo
- grafico senza titolo
- CSV esportato con foglio sbagliato

## Correzione guidata finale

Dopo la simulazione:

- confronto tra soluzioni diverse
- discussione sugli errori più frequenti
- strategia per migliorare velocità e precisione

---

# Lezione 8 - Verifica finale Modulo 3

## Tipologia

**Prova pratica al PC**, coerente con le competenze del modulo.

## Struttura della prova

- 4 esercizi formule/funzioni (inclusa almeno una ricerca dati)
- 1 esercizio convalida dati
- 1 esercizio pulizia dato
- 1 esercizio ordinamento/filtri/tabella
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
- funzioni di ricerca
- convalida dati
- pulizia dati
- filtri e tabelle
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
4. recuperare un prezzo da listino con una funzione di ricerca
5. convalidare quantità 1..100
6. pulire una colonna testo oppure estrarre una parte di un codice
7. trasformare il dataset in tabella
8. ordinare per reparto + importo desc
9. filtrare ordini `Aperto` con importo > 300
10. creare una tabella pivot semplice per reparto
11. creare grafico a colonne per reparto
12. esportare in CSV

## Motivazione didattica della prova pratica

La prova pratica misura le abilità realmente richieste dal modulo:

- applicare formule avanzate
- garantire qualità del dato
- leggere dati con filtri, tabelle e pivot
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
=SOMMA.PIÙ.SE(intervallo_somma;intervallo_criterio1;criterio1;...)
=CONTA.PIÙ.SE(intervallo_criterio1;criterio1;...)
=CERCA.VERT(chiave;tabella;indice_colonna;FALSO)
=CERCA.X(chiave;matrice_ricerca;matrice_risultato;"non trovato")
=UNICI(intervallo)
=STRINGA.ESTRAI(testo;posizione_iniziale;numero_caratteri)
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
