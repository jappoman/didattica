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
- `L2_CSV_Funzioni_Base`
- `L3_Convalida_Pulizia`
- `L4_Funzioni_Criteri`
- `L5_Ricerche`
- `L6_Tabelle_Filtri`
- `L7_Grafici_Pivot`
- `L8_Simulazione`

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

## Esempio guidato

Nel foglio `L1_Formule` imposta una piccola tabella con queste colonne:

- `A` Prodotto
- `B` Prezzo
- `C` Quantità
- `D` Totale lordo
- `E` IVA
- `F` Totale finale

Inserisci in `H1` l'aliquota IVA: `0,22`.

Esempio di formule in riga 2:

```text
D2 = B2*C2
E2 = D2*$H$1
F2 = ARROTONDA(D2+E2;2)
```

In questo esempio:

- `B2*C2` usa riferimenti relativi
- `$H$1` è un riferimento assoluto
- `ARROTONDA(...;2)` serve per ottenere un importo monetario corretto

## Esercizio Lezione 1

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

# Lezione 2 - CSV e ripasso funzioni base

## Obiettivi della lezione

A fine lezione devi saper:

- capire cos'è un file CSV e a cosa serve
- importare dati da CSV in un foglio di calcolo
- esportare correttamente un foglio in CSV
- ripassare le funzioni base di riepilogo
- controllare i dati importati prima di usarli negli esercizi successivi

## 1) CSV: cos'è e a cosa serve

CSV = `Comma-Separated Values`.
È un file di testo in cui i dati sono organizzati per righe e colonne tramite un separatore.

Serve per:

- scambiare dati tra software diversi
- importare dati in modo rapido
- lavorare su file esportati da gestionali, siti o database

Caratteristiche principali:

- è leggero
- non conserva formule, colori o grafici
- conserva soprattutto i dati grezzi

## 2) Import CSV: controlli importanti

Quando importi un CSV controlla subito:

- che le colonne siano separate correttamente
- che le date siano riconosciute come date
- che i numeri siano numeri e non testo
- che eventuali codici con zeri iniziali non vengano alterati

Problemi comuni:

- tutte le colonne finiscono in una sola cella
- date interpretate male
- simboli o accenti letti in modo strano

## 3) Export CSV: cosa ricordare

Prima di esportare:

- controlla i nomi delle colonne
- verifica che i dati siano puliti
- ricorda che il CSV salverà i dati e non la struttura completa del foglio

Dopo l'export:

- riapri il file
- controlla che il contenuto sia leggibile
- verifica che importi e date siano rimasti corretti

## 4) Ripasso formule base: somma, media, minimo, massimo e conta

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

## CSV di lavoro

Usa un file CSV con una struttura simile a questa:

```csv
Data,Reparto,Prodotto,Quantità,Prezzo unitario,Importo
2026-03-01,Informatica,Mouse,12,18.5,222
2026-03-01,Vendite,Toner,5,42,210
2026-03-02,Amministrazione,Risma A4,20,4.8,96
2026-03-02,Magazzino,Scatole,15,2.5,37.5
2026-03-03,Informatica,Tastiera,8,24,192
2026-03-03,Vendite,Notebook,2,650,1300
2026-03-04,Amministrazione,Penne,30,1.2,36
2026-03-04,Magazzino,Nastro,10,3.4,34
```

## 5) Esempio guidato

Importa il `CSV di lavoro` qui sopra.

Dopo l'import:

- controlla che i dati siano in colonne separate
- verifica che `Quantità` e `Importo` siano numeri
- crea una piccola area riepilogo a lato del dataset

Formule possibili:

```text
H2 = SOMMA(F2:F200)
H3 = MEDIA(F2:F200)
H4 = MIN(F2:F200)
H5 = MAX(F2:F200)
H6 = CONTA.NUMERI(F2:F200)
```

## 6) Esercizio Lezione 2

Nel foglio `L2_CSV_Funzioni_Base` importa il `CSV di lavoro` di questa lezione.

Consegna:

- importa correttamente il file
- controlla che date, numeri e intestazioni siano leggibili
- costruisci una piccola area riepilogo con `SOMMA`, `MEDIA`, `MIN`, `MAX` e una funzione di conta
- esporta di nuovo il foglio in CSV
- riapri il CSV esportato e verifica che i dati siano ancora corretti

---

# Lezione 3 - Qualità del dato: convalida, pulizia e coerenza

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

## CSV di lavoro

Importa questo `CSV di lavoro` volutamente sporco:

```csv
ID Ordine,Data Ordine,Reparto,Prodotto,Quantità,Prezzo,Stato,Codice
1,01/03/2026,Informatica,Mouse,12,18.5,Aperto,ORD-2026-001
2,02/03/2026,vendite,Toner,0,42,Chiuso,ORD-2026-002
3,,Amministrazione,Risma A4,20,4.8,APERTO,ORD-2026-003
3,04/03/2026, Magazzino ,Scatole,15,2.5,In lavorazione,ORD-2026-004
5,35/03/2026,Informatica,Tastiera,8,24,Aperto,ORD-2026-005
6,06/03/2026,Vendite,Cuffie,-2,35,Chiuso,ORD-2026-006
7,07/03/2026,Amministrazione,Penne,10,1.2,chiuso,ORD-2026-007
```

## 7) Esempio guidato

1. Importa il `CSV di lavoro`.
2. Applica convalide su reparto, quantità, data, stato.
3. Pulisci una colonna con `ANNULLA.SPAZI`.
4. Estrai una parte del codice con `STRINGA.ESTRAI`.
5. Individua errori, duplicati e valori incoerenti già presenti nel CSV.
6. Osserva quali errori vengono bloccati e quali vanno corretti manualmente.

## 8) Esercizio Lezione 3

Nel foglio `L3_Convalida_Pulizia` importa il `CSV di lavoro` di questa lezione.

Consegna:

- applica le convalide su `Data`, `Reparto`, `Quantità` e `Stato`
- crea una piccola lista di supporto per il campo `Reparto`
- pulisci una colonna testo con `ANNULLA.SPAZI`
- usa `STRINGA.ESTRAI` per ricavare una parte utile da un codice
- individua almeno 2 errori o duplicati e correggili

---

# Lezione 4 - Funzioni essenziali: riepilogo, SE e criteri

## Obiettivi della lezione

A fine lezione devi saper:

- usare `SE` per creare decisioni automatiche
- applicare più criteri con `SOMMA.PIÙ.SE` e `CONTA.PIÙ.SE`
- costruire una piccola area report leggibile e automatica su dati già importati

## 1) Funzione SE

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

## 2) Funzioni con più criteri

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

## CSV di lavoro

Importa o incolla un CSV con colonne come queste:

```csv
Data,Reparto,Prodotto,Quantità,Prezzo unitario,Importo,Stato
2026-03-01,Informatica,Mouse,12,18.5,222,Aperto
2026-03-01,Vendite,Toner,5,42,210,Chiuso
2026-03-02,Amministrazione,Risma A4,20,4.8,96,Aperto
2026-03-03,Vendite,Cuffie,3,35,105,Aperto
2026-03-03,Informatica,Tastiera,8,24,192,Chiuso
2026-03-04,Informatica,Monitor,6,140,840,Aperto
2026-03-04,Amministrazione,Penne,10,1.2,12,Aperto
2026-03-05,Vendite,Notebook,2,650,1300,Aperto
2026-03-05,Magazzino,Nastro,15,3.4,51,Chiuso
2026-03-06,Amministrazione,Raccoglitore,4,6.5,26,Aperto
```

## 3) Esempio guidato: mini report vendite

Usa il `CSV di lavoro` qui sopra.

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
- totale importi reparto Informatica con quantità >= 5
- numero ordini reparto Vendite con stato `Aperto`
- totale importi reparto Vendite con quantità >= 100

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

## 4) Esercizio Lezione 4

Nel foglio `L4_Funzioni_Criteri` importa il `CSV di lavoro` di questa lezione.

Consegna:

- calcola `Importo`
- crea la colonna `Stato scorta` con `SE`
- costruisci una piccola area riepilogo con `SOMMA`, `MEDIA`, `MIN`, `MAX` e una funzione di conta
- calcola il totale del reparto `Informatica` con quantità >= 5 usando `SOMMA.PIÙ.SE`
- conta gli ordini del reparto `Vendite` con stato `Aperto` usando `CONTA.PIÙ.SE`
- calcola il totale del reparto `Amministrazione` con quantità >= 3 usando `SOMMA.PIÙ.SE`

---

# Lezione 5 - Ricerca dati: CERCA.VERT, CERCA.X e SE.ERRORE

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

## CSV di lavoro

Per questa lezione usa due CSV: uno per `Ordini` e uno per `Listino`.

CSV `Ordini`:

```csv
Codice
P001
P003
P999
P002
P777
P004
P001
```

CSV `Listino`:

```csv
Codice,Descrizione,Reparto,Prezzo
P001,Mouse,Informatica,18.5
P002,Tastiera,Informatica,24
P003,Risma A4,Amministrazione,4.8
P004,Toner,Vendite,42
P005,Cuffie,Vendite,35
```

## 5) Esempio guidato

Importa i due `CSV di lavoro` qui sopra.

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

## 6) Esercizio Lezione 5

Nel foglio `L5_Ricerche` importa i due `CSV di lavoro` di questa lezione in due fogli separati: `Ordini` e `Listino`.

Consegna:

- recupera `Descrizione` e `Prezzo` con `CERCA.VERT`
- recupera `Reparto` con `CERCA.X`
- inserisci almeno 3 codici inesistenti
- gestisci i codici non trovati con `SE.ERRORE`
- scrivi in 2 righe quale funzione ti sembra più comoda tra `CERCA.VERT` e `CERCA.X`


---

# Lezione 6 - Tabelle, filtri e analisi operativa

## Obiettivi della lezione

A fine lezione devi saper:

- trasformare un intervallo dati in una tabella leggibile
- ordinare per una o più colonne
- applicare filtri testuali, numerici e per data
- bloccare le prime righe per lavorare meglio su dataset lunghi
- usare `SUBTOTALE` su dati filtrati
- rispondere a domande reali con i dati filtrati

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

## 8) Attenzione agli errori frequenti

Errore 1:

- ordinare una sola colonna e non tutta la tabella

Errore 2:

- lasciare filtro attivo e fare calcoli pensando di vedere tutto

Errore 3:

- confondere record nascosti con record eliminati

Buona pratica:

- prima di consegna, rimuovi tutti i filtri e ricontrolla

## CSV di lavoro

Usa un CSV ordini con una struttura simile a questa:

```csv
Data,Reparto,Prodotto,Quantità,Importo,Stato
2026-03-01,Informatica,Mouse,12,222,Aperto
2026-03-01,Vendite,Toner,5,210,Chiuso
2026-03-02,Amministrazione,Risma A4,20,96,Aperto
2026-03-03,Vendite,Cuffie,3,105,Aperto
2026-03-03,Informatica,Tastiera,8,192,Chiuso
2026-03-04,Magazzino,Scatole,15,37.5,Aperto
2026-03-05,Vendite,Notebook,2,1300,Aperto
2026-03-05,Informatica,Monitor,6,840,Aperto
2026-03-06,Amministrazione,Penne,30,36,Chiuso
2026-03-06,Magazzino,Nastro,10,34,Aperto
2026-03-07,Vendite,Webcam,7,280,Aperto
2026-03-07,Informatica,Hub USB,9,171,Chiuso
```

## 9) Esempio guidato

Usa il `CSV di lavoro` qui sopra.

Consegna guidata:

1. trasforma l'intervallo in tabella
2. blocca la riga delle intestazioni
3. ordina per `Reparto`, poi `Importo` desc
4. filtra `Stato = Aperto`
5. filtra anche `Importo > 250`
6. calcola totale visibile con `SUBTOTALE`

## 10) Esercizio Lezione 6

Nel foglio `L6_Tabelle_Filtri` importa il `CSV di lavoro` di questa lezione.

Consegna:

- trasforma l'intervallo in tabella
- blocca la riga delle intestazioni
- ordina i dati per `Reparto` e poi per `Importo` decrescente
- filtra solo gli ordini `Aperto` con importo >= 200
- calcola il totale dei record visibili con `SUBTOTALE`

---

# Lezione 7 - Grafici e tabelle pivot: sintetizzare i dati

## Obiettivi della lezione

A fine lezione devi saper:

- scegliere il grafico adatto al problema
- costruire grafici leggibili
- leggere un dataset già preparato o già importato
- usare una tabella pivot come sintesi rapida a supporto dei grafici

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

## 4) Tabelle pivot come supporto ai grafici

Una tabella pivot serve per riassumere velocemente i dati prima di trasformarli in un grafico.

Uso pratico nella lezione:

- costruisci un riepilogo per mese e reparto
- controlli subito i totali
- usi la pivot come base per creare un grafico piu pulito

Esempio base:

- righe = `Mese`
- colonne = `Reparto`
- valori = somma `Importo`

## CSV di lavoro

Usa un CSV vendite mensili come questo:

```csv
Mese,Reparto,Importo
Gennaio,Informatica,820
Gennaio,Vendite,640
Gennaio,Amministrazione,310
Febbraio,Informatica,910
Febbraio,Vendite,700
Febbraio,Amministrazione,330
Marzo,Informatica,880
Marzo,Vendite,760
Marzo,Amministrazione,290
Aprile,Informatica,950
Aprile,Vendite,720
Aprile,Amministrazione,340
```

## 5) Esempio guidato

1. Importa il `CSV di lavoro`.
2. Crea una tabella pivot con somma importi per `Mese` e `Reparto`.
3. Crea un grafico a colonne per confrontare i reparti.
4. Crea un grafico a linee per mostrare l'andamento mensile.

## 6) Esercizio Lezione 7

Nel foglio `L7_Grafici_Pivot` importa il `CSV di lavoro` di questa lezione.

Consegna:

- crea una tabella pivot che riassuma gli importi per mese e reparto
- crea un grafico a colonne per confrontare i reparti
- crea un grafico a linee per mostrare l'andamento mensile
- scrivi in 2 righe quale dei due grafici comunica meglio ciascuna informazione

---

# Lezione 8 - Simulazione verifica (prova guidata)

## Obiettivo

Allenarsi in condizioni simili alla verifica reale, con tempi e consegna strutturata.

## Durata

1 ora.

## Consegna simulazione

Usa un file con dati ordini/vendite e completa tutte le richieste.

### Parte A - Formule e funzioni

1. Calcola `Importo = Quantità*Prezzo`.
2. Crea `Stato scorta` con `SE`.
3. Calcola totale vendite reparto `Informatica` con funzione a più criteri.
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

### Parte E - Comunicazione dati

11. Crea una tabella pivot base da usare come supporto al grafico.
12. Crea grafico corretto con titolo e legenda.
13. Esporta il foglio in CSV.

## Griglia di autocontrollo prima consegna

- formule trascinate correttamente
- import CSV eseguito correttamente
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
- non controllare le colonne dopo un import CSV
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
