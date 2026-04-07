# Laboratorio foglio di calcolo avanzati

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

#### Approfondimento sulle percentuali

Quando inserisci una percentuale in una cella, ad esempio `15%`, Google Fogli la interpreta come valore numerico `0,15`.
Questo significa che il simbolo `%` non è solo una scrittura grafica: per il foglio di calcolo quel valore diventa un numero decimale utilizzabile nelle formule.

Quindi:

- `15%` = `0,15`
- `22%` = `0,22`
- `5%` = `0,05`

Per lavorare correttamente con le percentuali devi quindi ragionare matematicamente sul risultato che vuoi ottenere.

Se vuoi sapere quanto vale la percentuale su un importo, devi moltiplicare:

- sconto di `15%` su `100` -> `=100*15%` oppure `=100*0,15` -> risultato `15`
- IVA del `22%` su `85` -> `=85*22%` oppure `=85*0,22` -> risultato `18,70`

Se invece vuoi ottenere direttamente il valore finale, devi usare `1` come valore iniziale intero:

- `1 - percentuale` = la parte che rimane dopo una sottrazione
- `1 + percentuale` = il valore iniziale più la parte aggiunta

Esempi:

- prezzo con sconto -> `=prezzo*(1-sconto%)`
- prezzo con IVA aggiunta -> `=prezzo*(1+iva%)`

Esempi pratici:

```text
=B2*E2
=D2*(1-E2)
=F2*(1+$K$1)
```

Spiegazione dei tre casi:

- `=B2*E2` calcola quanto vale lo sconto in euro
- `=D2*(1-E2)` calcola il prezzo dopo aver tolto lo sconto
- `=F2*(1+$K$1)` calcola il prezzo dopo aver aggiunto l'IVA

Esempio numerico sullo sconto:

- se `D2` vale `100`
- e `E2` contiene `15%`
- allora `E2` viene letto come `0,15`
- quindi `1-E2` diventa `1-0,15 = 0,85`
- perciò `=D2*(1-E2)` diventa `=100*0,85 = 85`

Esempio numerico sull'IVA:

- se `F2` vale `85`
- e `K1` contiene `22%`
- allora `K1` viene letto come `0,22`
- quindi `1+$K$1` diventa `1+0,22 = 1,22`
- perciò `=F2*(1+$K$1)` diventa `=85*1,22 = 103,70`

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

## Range di celle

Un range di celle è un intervallo che comprende più celle. Si indica con i due punti `:` tra la cella iniziale e quella finale.
Esempio:

```text
=SOMMA(B2:B20)
```

In questo caso `B2:B20` indica tutte le celle dalla B2 alla B20, e la funzione `SOMMA` calcola la somma di tutti quei valori.

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

Inserisci in `H1` l'aliquota IVA: `22%`.

Per provare l'esempio guidato puoi usare dati semplici come questi:

- `Mouse` | `18,50` | `2`
- `Tastiera` | `24` | `3`
- `Monitor` | `140` | `1`

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
- se in `H1` scrivi `22%`, Google Fogli userà automaticamente il valore `0,22` nel calcolo

## Esercizio Lezione 1

Crea nel foglio `L1_Formule` una tabella con queste intestazioni (riga 1):

- `A` Prodotto
- `B` Prezzo
- `C` Quantità
- `D` Subtotale
- `E` Sconto %
- `F` Sconto in euro
- `G` Netto
- `H` Importo IVA
- `I` Totale finale

Inserisci in `K1` l'aliquota IVA: `22%`.

Per l'esercizio usa invece almeno 10 righe con prodotti e valori diversi dall'esempio guidato, ad esempio articoli come `Webcam`, `Hub USB`, `Notebook`, `Stampante`, `Cuffie`.

In questa lezione usa un metodo a passaggi separati, senza mescolare formule compatte come `*(1-sconto)` o `*(1+IVA)`.
L'obiettivo è vedere bene il significato di ogni colonna.

Scrivi poi le formule in riga 2:

- in `D2`: calcola il subtotale (`Prezzo * Quantità`)
- in `F2`: calcola lo sconto in euro (`Subtotale * Sconto %`)
- in `G2`: calcola il netto dopo lo sconto (`Subtotale - Sconto in euro`)
- in `H2`: calcola l'importo IVA (`Netto * aliquota`)
- in `I2`: calcola il totale finale (`Netto + IVA`) arrotondato a 2 decimali

Formule possibili:

```text
D2 = B2*C2
F2 = D2*E2
G2 = D2-F2
H2 = G2*$K$1
I2 = ARROTONDA(G2+H2;2)
```

Formule possibili:

```text
D2 = B2*C2
F2 = D2*(1-E2)
G2 = F2*$K$1
H2 = ARROTONDA(F2+G2;2)
```

Ricorda il significato matematico delle formule:

- `D2*(1-E2)` significa: prendi il subtotale intero (`1`) e togli la percentuale di sconto
- `F2*$K$1` significa: calcola solo il valore dell'IVA
- `F2*(1+$K$1)` significa: prendi il netto intero (`1`) e aggiungi la percentuale di IVA

In alternativa, il totale finale con IVA può essere scritto anche cosi:

```text
H2 = ARROTONDA(F2*(1+$K$1);2)
```

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

- tutte le colonne finiscono in una sola cella -> soluzione: scegli il separatore giusto (es. `Virgola`)
- date interpretate male -> soluzione: controlla formato data e impostazioni locali
- numeri decimali con il punto (es. `39.9`) non riconosciuti come numeri nel formato italiano -> soluzione: correggi i decimali sostituendo il punto con la virgola prima di applicare il formato numerico o valuta
- simboli o accenti letti in modo strano -> soluzione: verifica codifica del file (es. UTF-8)

## 3) Export CSV: cosa ricordare

Prima di esportare:

- controlla i nomi delle colonne
- verifica che i dati siano puliti
- ricorda che il CSV salverà i dati e non la struttura completa del foglio

Dopo l'export:

- riapri il file
- controlla che il contenuto sia leggibile
- verifica che importi e date siano rimasti corretti

## CSV per l'esempio guidato

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

## 4) Esempio guidato

### Importazione

Seleziona i dati qui sopra, copiali e incollali in un file di testo. Salva questo file come `CSV_di_lavoro.csv` (o un nome simile) e soprattutto con estensione `.csv`. Attento a eliminare l'estensione `.txt` se il tuo editor la aggiunge automaticamente.

In Google Fogli poi vai sul foglio della lezione 2; successivamente importa il file con `File` > `Importa` > `Carica` e seleziona il file CSV appena creato.

Google Fogli ti chiederà come importare il file: scegli `Sostituisci i dati nella cella selezionata` e assicurati che il separatore sia `Virgola` (oppure `Rileva automaticamente`. Spunta anche la casella `Converti il testo in numeri, date e formule` se disponibile).
Dopo aver confermato, i dati dovrebbero essere importati correttamente nelle colonne separate.

Attenzione pratica:

- nel CSV i campi sono separati da virgola, quindi i valori decimali di esempio sono scritti con il punto (es. `39.9`, `159.6`)
- in un file Google Fogli con impostazioni locali italiane, quei valori possono essere interpretati come testo e non come numeri
- se succede, applicare direttamente il formato `Valuta` non basta: prima il valore deve essere riconosciuto come numero
- in questa lezione, se succede, la soluzione pratica è semplice: correggi i decimali sostituendo il punto con la virgola e poi applica il formato corretto
- quindi il controllo corretto non è solo "applica il formato", ma prima "controlla i decimali e sistemali nel formato italiano"

Dopo l'import:

- controlla che i dati siano in colonne separate
- verifica che `Quantità`, `Prezzo unitario` e `Importo` siano numeri veri e non testo
- verifica che la colonna `Data` sia riconosciuta come data
- se i valori decimali sono scritti con il punto e non vengono letti come numeri, correggili usando la virgola
- applica un formato adatto alle colonne:
  `Data` come data,
  `Quantità` come numero senza decimali,
  `Prezzo unitario` e `Importo` come numero con 2 decimali o come valuta
- poi seleziona ogni colonna e usa `Formato` > `Numero` per scegliere il formato più adatto
- `Importo` è il totale della riga, cioè `Quantità * Prezzo unitario`
- crea una piccola area riepilogo a lato del dataset. Per ripassare le funzioni base, nella piccola area riepilogo calcola almeno:
  - la somma totale degli importi
  - la media degli importi
  - il valore massimo o minimo della colonna `Importo`

### Esportazione

Dopo aver lavorato sui dati, prova a esportare il foglio in CSV con `File` > `Scarica` > `Valori separati da virgola (.csv)`.

## CSV per l'esercizio

Per l'esercizio usa invece un secondo CSV, simile nella struttura ma con valori diversi:

```csv
Data,Reparto,Prodotto,Quantità,Prezzo unitario,Importo
2026-03-06,Informatica,Webcam,4,39.9,159.6
2026-03-06,Vendite,Cartucce,6,28,168
2026-03-07,Amministrazione,Evidenziatori,18,1.5,27
2026-03-07,Magazzino,Etichette,25,0.8,20
2026-03-08,Informatica,Hub USB,7,19,133
2026-03-08,Vendite,Smartphone,3,320,960
2026-03-09,Amministrazione,Cartelle,12,2.2,26.4
2026-03-09,Magazzino,Bobine,9,5.5,49.5
```

## 5) Esercizio Lezione 2

Nel foglio `L2_CSV_Funzioni_Base` importa il `CSV per l'esercizio` di questa lezione.

Consegna:

- Elimina i dati importati nell'esempio guidato, così da avere un foglio pulito per l'esercizio
- importa correttamente i dati tramite l'import via csv
- controlla che date, numeri e intestazioni siano leggibili
- correggi i decimali con il punto in modo da avere la virgola dove serve, così i valori vengono riconosciuti correttamente come numeri
- formatta correttamente le colonne dopo l'import:
  `Data` come data,
  `Quantità` come numero,
  `Prezzo unitario` e `Importo` come numero con 2 decimali o valuta
- aggiungi una colonna `Subtotale` che moltiplica `Quantità` per `Prezzo unitario`
- confronta `Subtotale` con `Importo` per verificare che i dati importati siano coerenti
- crea una piccola area riepilogo con almeno due funzioni base, ad esempio `SOMMA`, `MEDIA`, `MIN` o `MAX`
- esporta di nuovo il foglio in CSV
- importa nuovamente il CSV esportato sotto la tabella originale (seleziona una casella sottostante prima di importare il CSV) e verifica che i dati siano ancora corretti. Eventualmente sistema le colonne e i formati se qualcosa è andato storto.

# Lezione 3 - Qualità del dato: convalida, pulizia e coerenza

## Obiettivi della lezione

A fine lezione devi saper:

- prevenire errori in inserimento
- costruire convalide efficaci
- pulire testi e codici già inseriti
- migliorare affidabilità del file

## Parte teorica

## 1) Perché la qualità del dato è centrale

I dati che entrano nel sistema devono essere corretti, coerenti e completi. Se i dati sono sporchi o errati, delle formule corrette restituiranno comunque sbagliati. Ecco degli esempi di errori che possono verificarsi:

- reparti scritti in modi diversi (ad esempio: `Vendite`, `vendite`, `Vendita`); questo rende difficile filtrare o fare analisi per reparto
- date non valide: ad esempio `35/03/2026` o `2026-15-01` non vengono riconosciute come date e non possono essere usate in formule o filtri per data
- quantità negative: ad esempio `-5` in una colonna `Quantità` non ha senso e può falsare i totali
- codici non univoci: ad esempio codici duplicati oppure `ORD-2026-001` e `ORD-2026-1` (incoerenti tra loro) rendono difficile identificare univocamente un ordine
- campi vuoti dove non dovrebbero esserci: ad esempio `Data Ordine` vuota rende difficile sapere quando è stato fatto l'ordine

## 2) Convalida dati: idea e tipi principali

La convalida è un filtro in fase di inserimento che blocca o avvisa l'utente quando il dato non rispetta le regole stabilite. Serve a prevenire errori e mantenere la coerenza del dataset.

In Google Fogli la trovi in `Dati` > `Convalida dei dati`.

Quando si apre il pannello a destra, la logica generale è sempre questa:

- si fa clic su `Aggiungi regola`
- si controlla il campo `Applica all'intervallo` per applicare la regola alla colonna o alle celle giuste
- si apre il menu a tendina sotto `Criteri`
- si sceglie il tipo di regola giusto
- si compilano i valori richiesti
- si conferma con `Fine`

In queste lezioni useremo soprattutto questi criteri del menu:

- `Menu a discesa`
- `Menu a discesa (da un intervallo)`
- `È una data valida`
- `La data è compresa`
- `Maggiore di`
- `Maggiore o uguale a`
- `Minore di`
- `Minore o uguale a`
- `È compreso tra`
- `Il testo è esattamente`

## 3) Regole consigliate per tabella Ordini

In una tabella ordini come quella usata in questa lezione, alcuni campi si prestano bene alla convalida perché devono rispettare regole molto precise.

I campi tipici sono:

- `ID Ordine`
- `Data Ordine`
- `Reparto`
- `Prodotto`
- `Quantità`
- `Prezzo`
- `Stato`

Per questi campi, le regole più adatte sono normalmente queste:

- `ID Ordine`: numero intero maggiore di `0`
- `Data Ordine`: data compresa tra `01/01/2025` e `31/12/2026`
- `Reparto`: elenco prefissato
- `Quantità`: numero compreso tra `1` e `100`
- `Prezzo`: numero maggiore di `0`
- `Stato`: elenco con i valori `Aperto`, `In lavorazione`, `Chiuso`

Questa sezione serve quindi come schema di riferimento: spiega quale regola conviene associare a ciascun campo. L'applicazione pratica vera e propria si trova più sotto, nell'esempio guidato e nell'esercizio.

## 4) Liste di supporto (buona pratica)

Quando si usa una convalida con elenco, spesso conviene preparare una piccola lista di supporto in una zona laterale del foglio.

Per esempio, per il campo `Reparto`, la lista potrebbe contenere:

- Informatica
- Amministrazione
- Vendite
- Magazzino

Questa lista può essere scritta, ad esempio, nell'area `M1:M4` e poi usata come sorgente della convalida.

Il vantaggio è semplice: se un valore cambia, non serve rifare tutta la regola, ma basta aggiornare la lista di supporto.

Anche qui stiamo ancora descrivendo una buona pratica generale. L'applicazione concreta di questa idea compare più sotto, nell'esempio guidato.

## 5) Come funziona l'inserimento di una regola

Ogni regola di convalida segue sempre la stessa logica:

- prima si seleziona la cella o l'intervallo da controllare
- poi si apre `Dati` > `Convalida dei dati`
- nel pannello a destra si fa clic su `Aggiungi regola`
- si controlla il campo `Applica all'intervallo`
- dal menu `Criteri` si sceglie il tipo corretto di controllo
- si inseriscono i valori richiesti
- infine si conferma con `Fine`

### Caso A - Reparto con elenco fisso scritto a mano

Se si vuole creare direttamente un elenco dentro la regola, si selezionano le celle del reparto, ad esempio `C2:C100`, poi si apre `Dati` > `Convalida dei dati` e si fa clic su `Aggiungi regola`.

Nel campo `Applica all'intervallo` deve comparire l'intervallo corretto, mentre nel menu `Criteri` si sceglie `Menu a discesa`.

Le voci da inserire una per volta sono:

- `Informatica`
- `Amministrazione`
- `Vendite`
- `Magazzino`

Questa soluzione va bene se l'elenco è corto e non cambierà spesso.

### Caso B - Reparto con elenco preso da celle del foglio

Se invece i reparti sono già stati scritti nell'area di supporto, ad esempio in `M1:M4`, conviene usare `Menu a discesa (da un intervallo)`.

In questo caso si selezionano le celle del reparto, si apre `Dati` > `Convalida dei dati`, si aggiunge una regola e come sorgente si indica l'intervallo `M1:M4`, oppure lo si seleziona con il pulsante a griglia.

Questa soluzione è la migliore perché permette di aggiornare l'elenco senza rifare la regola.

### Caso C - Quantità tra 1 e 100

Per la colonna `Quantità`, ad esempio `E2:E100`, il criterio più adatto è `È compreso tra`.

Nel pannello della convalida si imposta quindi un valore minimo pari a `1` e un valore massimo pari a `100`.

In questo modo non saranno accettate quantità come `0`, `-2` o `150`.

### Caso D - Prezzo maggiore di 0

Per la colonna `Prezzo`, ad esempio `F2:F100`, si può usare il criterio `Maggiore di` e indicare come soglia `0`.

In questo modo si evita l'inserimento di prezzi nulli o negativi.

### Caso E - Data ordine compresa in un intervallo

Per la colonna `Data Ordine`, ad esempio `B2:B100`, si può scegliere il criterio `La data è compresa` e impostare come estremi `01/01/2025` e `31/12/2026`.

Se ti serve solo controllare che sia una vera data, senza limitare il periodo, nel menu puoi scegliere `È una data valida`.

## 6) Pulizia base dei dati già inseriti

La convalida serve soprattutto a bloccare gli errori nuovi, cioè quelli che vengono inseriti dopo aver creato la regola. Se però importi un file CSV o ricevi un foglio già compilato, gli errori possono essere già presenti nei dati.

In questi casi serve una fase di pulizia.

Le operazioni più comuni sono:

- rimuovere spazi iniziali/finali
- uniformare maiuscole/minuscole
- estrarre parti utili da un codice
- correggere formati data
- trovare duplicati

Alcune funzioni sono particolarmente utili:

```text
=ANNULLA.SPAZI(A2)
=MAIUSC(A2)
=MINUSC(A2)
=STRINGA.ESTRAI(A2;5;4)
```

### `ANNULLA.SPAZI`

Questa funzione elimina gli spazi inutili all'inizio e alla fine del testo e riduce gli spazi doppi interni a uno solo.

È utile quando un dato sembra corretto a video, ma in realtà contiene spazi nascosti che impediscono confronti, filtri o convalide corrette.

Esempio:

- se una cella contiene `Magazzino` (con spazi prima e dopo), il confronto con `Magazzino` restituirà `FALSO`
- con `=ANNULLA.SPAZI(A2)` il risultato diventa `Magazzino`

Questa funzione è molto utile nel CSV di questa lezione, perché alcuni reparti possono arrivare con spazi indesiderati.

### `MAIUSC`

Questa funzione trasforma tutto il testo in lettere maiuscole.

È utile quando si vogliono uniformare valori scritti in modi diversi, ad esempio:

- `aperto`
- `Aperto`
- `APERTO`

Con `=MAIUSC(A2)` tutti questi valori diventano `APERTO`.

Serve quindi a rendere coerenti i dati prima di analizzarli o confrontarli.

### `MINUSC`

Questa funzione trasforma tutto il testo in lettere minuscole.

È utile per lo stesso motivo di `MAIUSC`, ma nel caso in cui si scelga di uniformare tutto in minuscolo.

Esempio:

- `Vendite` diventa `vendite`
- `CHIUSO` diventa `chiuso`

L'importante non è scegliere per forza maiuscolo o minuscolo, ma usare un criterio coerente in tutta la colonna.

### `STRINGA.ESTRAI`

Questa funzione estrae una parte del testo a partire da una certa posizione e per un certo numero di caratteri.

La sintassi è:

```text
=STRINGA.ESTRAI(testo; posizione_iniziale; numero_caratteri)
```

Nell'esempio:

```text
=STRINGA.ESTRAI(A2;5;4)
```

la funzione prende il testo contenuto in `A2`, parte dal quinto carattere ed estrae quattro caratteri.

Se in `A2` c'è `ORD-2026-015`, il risultato sarà `2026`.

Per estrarre parti diverse dello stesso codice bisogna quindi cambiare posizione iniziale e lunghezza. Per esempio, da `ORD-2026-015` si può estrarre:

- l'anno con `=STRINGA.ESTRAI(A2;5;4)`
- il numero finale con `=STRINGA.ESTRAI(A2;10;3)`
- una sezione utile per controlli o colonne di supporto

Questa funzione serve quando un codice contiene più informazioni tutte insieme e vogliamo separarle.

In generale, la pulizia dei dati serve a rendere omogenei i valori già presenti nel foglio, così convalide, filtri, formule e analisi successive funzionano meglio.

## CSV per l'esempio guidato

Importa questo `CSV di lavoro` volutamente sporco:

```csv
ID Ordine,Data Ordine,Reparto,Prodotto,Quantità,Prezzo,Stato,Codice
1,01/03/2026,Informatica,Mouse ,12,18.5,Aperto,ORD-2026-001
2,02/03/2026,vendite, Toner ,0,42,Chiuso,ORD-2026-002
3,,Amministrazione,Risma A4,20,4.8,APERTO,ORD-2026-003
3,04/03/2026, Magazzino ,Scatole ,15,2.5,In lavorazione,ORD-2026-004
5,35/03/2026,Informatica, Tastiera,8,24,Aperto,ORD-2026-005
6,06/03/2026,Vendite,Cuffie,-2,35,Chiuso,ORD-2026-006
7,07/03/2026,Amministrazione, Penne,10,1.2,chiuso,ORD-2026-007
```

## 8) Esempio guidato

1. Importa il `CSV per l'esempio guidato`.
2. Crea in una zona laterale del foglio un piccolo elenco reparti con:
   `Informatica`, `Amministrazione`, `Vendite`, `Magazzino`.
3. Seleziona le celle della colonna `Data Ordine` (non l'intestazione), fai `Aggiungi regola` e nel menu `Criteri` scegli `La data è compresa`, poi inserisci `01/01/2025` e `31/12/2026`.
4. Seleziona le celle della colonna `Reparto` (non l'intestazione), apri `Dati` > `Convalida dei dati`, fai clic su `Aggiungi regola` e nel menu `Criteri` scegli `Menu a discesa (da un intervallo)`.
5. Indica come sorgente l'intervallo dove hai scritto i reparti e conferma con `Fine`.
6. Crea una nuova colonna a fianco a quella `Prodotto` chiamata `Prodotto normalizzato` e usa `ANNULLA.SPAZI` per pulire i nomi dei prodotti.
7. Seleziona le celle della colonna `Quantità` (non l'intestazione), fai `Aggiungi regola` e nel menu `Criteri` scegli `Tra`, poi inserisci `1` e `100`.
8. Seleziona le celle della colonna `Prezzo` (non l'intestazione), fai `Aggiungi regola` e nel menu `Criteri` scegli `Maggiore di`, poi inserisci `0`.
9. Seleziona le celle della colonna `Stato` (non l'intestazione), fai `Aggiungi regola` e nel menu `Criteri` scegli `Menu a discesa`, poi inserisci `Aperto`, `In lavorazione`, `Chiuso`.
10. Fai una nuova colonna `Anno` e estrai l'anno dal codice con `STRINGA.ESTRAI`.
11. Osserva quali errori vengono bloccati dalla convalida e correggili manualmente.

## CSV per l'esercizio

Per l'esercizio usa un secondo CSV sporco:

```csv
ID Ordine,Data Ordine,Reparto,Prodotto,Quantità,Prezzo,Stato,Codice
11,10/03/2026,Informatica, Webcam,5,39.9,Aperto,ORD-2026-011
12,11/03/2026, vendite , Cartucce ,101,28,chiuso,ORD-2026-012
13,12/03/2026,Amministrazione,Cartelle ,14,2.2,APERTO,ORD-2026-013
13,44/03/2026,Magazzino,Etichette  ,8,0,In lavorazione,ORD-2026-014
15,,Informatica,  Hub  USB,9,19,Aperto,ORD-2026-015
16,15/03/2026,Vendite, Notebook ,-1,650,Chiuso,ORD-2026-016
17,16/03/2026,Amministrazione,Penne,20,1.2,In lavorazione,ORD-2026-017
```

## 9) Esercizio Lezione 3

Nel foglio `L3_Convalida_Pulizia` importa il `CSV per l'esercizio` di questa lezione.

Consegna:

- importa il nuovo CSV di lavoro sotto alla tabella dell'esempio guidato
- pulisci i prodotti con `ANNULLA.SPAZI` in una nuova colonna `Prodotto normalizzato`
- crea una piccola lista di supporto per il campo `Reparto`
- applica le convalide su `Data Ordine`, `Reparto`, `Quantità`, `Prezzo` e `Stato`
- usa `STRINGA.ESTRAI` per ricavare una parte utile da un codice
- correggi gli errori individuati dai vari controlli

# Lezione 4 - Funzioni essenziali: SE e CONTA

## Obiettivi della lezione

A fine lezione devi saper:

- usare `SE` per creare decisioni automatiche
- applicare più criteri con `SOMMA.PIÙ.SE` e `CONTA.PIÙ.SE`
- costruire una piccola area report leggibile e automatica su dati già importati

## 1) Funzione SE

La funzione `SE` permette di creare una logica condizionale, cioè di restituire un valore se una condizione è vera e un altro valore se la condizione è falsa.

Sintassi:

```text
=SE(test_logico; valore_se_vero; valore_se_falso)
```

Dove:

- `test_logico` è la condizione che vuoi verificare (ad esempio, se un numero è maggiore di un certo valore)
- `valore_se_vero` è il risultato che vuoi ottenere se la condizione è soddisfatta
- `valore_se_falso` è il risultato che vuoi ottenere se la condizione non è soddisfatta

Le condizioni che si possono usare in `test_logico` sono molteplici, ad esempio:

- `A2>100`
- `B2="Vendite"`
- `C2<=50`
- `D2<>0` (diverso da zero)
- `E2>=10` e `E2<=20` (congiunzione di due condizioni)

Esempi pratici:

```text
=SE(C2<10;"Riordinare";"OK")
=SE(D2>=6;"Promosso";"Da recuperare")
=SE(E2>500;"Bonus";"No bonus")
=SE(E(B2>=50;B2<=100);"Medio";"Fuori range")
```

## 2) Funzioni con più criteri

Quando si vogliono applicare più criteri contemporaneamente, le funzioni più adatte sono `SOMMA.PIÙ.SE` per sommare valori che rispettano più condizioni e `CONTA.PIÙ.SE` per contare quante righe rispettano più condizioni.

### SOMMA.PIÙ.SE

Serve a sommare i valori di un intervallo solo se vengono soddisfatte più condizioni su altri intervalli. E' più flessibile di `SOMMA.SE` perché permette di applicare più criteri contemporaneamente.

Sintassi:

```text
=SOMMA.PIÙ.SE(intervallo_somma; intervallo_criteri1; criterio1; [intervallo_criteri2; criterio2]; ...)
```

Dove:

- `intervallo_somma` è l'intervallo di celle che contiene i valori da sommare
- `intervallo_criteri1` è l'intervallo su cui applicare il primo criterio
- `criterio1` è la condizione da soddisfare per il primo intervallo
- `[intervallo_criteri2; criterio2]` sono opzionali e permettono di aggiungere ulteriori condizioni

Esempio pratico:

```text
=SOMMA.PIÙ.SE(F2:F200;B2:B200;"Vendite";D2:D200;">=100")
```

Nell'esempio sopra, la funzione somma i valori della colonna `F` solo se nella stessa riga il reparto è `Vendite` e la quantità è maggiore o uguale a `100`.

### CONTA.PIÙ.SE

Serve a contare quante righe soddisfano più condizioni su diversi intervalli. E' più flessibile di `CONTA.SE` perché permette di applicare più criteri contemporaneamente.

Sintassi:

```text
=CONTA.PIÙ.SE(intervallo_criteri1; criterio1; [intervallo_criteri2; criterio2]; ...)
```

Dove:

- `intervallo_criteri1` è l'intervallo su cui applicare il primo criterio
- `criterio1` è la condizione da soddisfare per il primo intervallo
- `[intervallo_criteri2; criterio2]` sono opzionali e permettono di aggiungere ulteriori condizioni

Esempio pratico:

```text
=CONTA.PIÙ.SE(B2:B200;"Vendite";G2:G200;"Aperto")
```

Nell'esempio sopra, la funzione conta quante righe hanno `Vendite` nella colonna `B` e `Aperto` nella colonna `G`.

Le sezioni precedenti servono come spiegazione e come riferimento delle formule. L'applicazione operativa delle funzioni compare nel `CSV di lavoro`, nell'esempio guidato e nell'esercizio.

## CSV per l'esempio guidato

Importa o incolla un CSV con colonne come queste:

```csv
Data;Reparto;Prodotto;Quantità;Prezzo unitario;Importo;Stato;Stato scorta
2026-03-01;Informatica;Mouse;12;18,5;;Aperto;
2026-03-01;Vendite;Toner;5;42;;Chiuso;
2026-03-02;Amministrazione;Risma A4;20;4,8;;Aperto;
2026-03-03;Vendite;Cuffie;3;35;;Aperto;
2026-03-03;Informatica;Tastiera;8;24;;Chiuso;
2026-03-04;Informatica;Monitor;6;140;;Aperto;
2026-03-04;Amministrazione;Penne;10;1,2;;Aperto;
2026-03-05;Vendite;Notebook;2;650;;Aperto;
2026-03-05;Magazzino;Nastro;15;3,4;;Chiuso;
2026-03-06;Amministrazione;Raccoglitore;4;6,5;;Aperto;
```

## 3) Esempio guidato: mini report vendite

Usa il `CSV per l'esempio guidato` qui sopra.

Dopo l'importazione, la tabella occupa le colonne `A:H` e le righe da `1` a `11`. La prima riga contiene le intestazioni:

- Data
- Reparto
- Prodotto
- Quantità
- Prezzo unitario
- Importo
- Stato
- Stato scorta

Per rendere l'esempio ordinato, lavoriamo in tre passaggi.

### Passaggio 1: completa le colonne vuote del dataset

In `F2` calcola `Importo` con `Quantità * Prezzo unitario`:

```text
=E2*D2
```

Copia poi la formula fino a `F11`.

In `H2` calcola `Stato scorta` con `SE`:

```text
=SE(D2<10;"Riordinare";"OK")
```

Copia poi la formula fino a `H11`.

### Passaggio 2: crea una piccola area riepilogo separata

Per non mescolare i calcoli con la tabella principale, crea il riepilogo nelle colonne `J:K`.

Scrivi in `J` le etichette e in `K` le formule corrispondenti:

```text
J2 = Totale importi
K2 = SOMMA(F2:F11)

J3 = Media importi
K3 = MEDIA(F2:F11)

J4 = Importo minimo
K4 = MIN(F2:F11)

J5 = Importo massimo
K5 = MAX(F2:F11)
```

### Passaggio 3: aggiungi i calcoli con criteri

Sotto al riepilogo precedente aggiungi due formule che facciano vedere quando conviene usare le funzioni con criteri:

```text
J6 = Totale Informatica con quantità >= 5
K6 = SOMMA.PIÙ.SE(F2:F11;B2:B11;"Informatica";D2:D11;">=5")

J7 = Ordini Vendite aperti
K7 = CONTA.PIÙ.SE(B2:B11;"Vendite";G2:G11;"Aperto")
```

Con il CSV di questo esempio:

- `K6` somma gli importi delle righe del reparto `Informatica` che hanno quantità pari o superiori a `5`
- `K7` conta quante righe appartengono al reparto `Vendite` e hanno stato `Aperto`

Questo esempio serve a mostrare come si passa dal dataset a una piccola area report leggibile. Nell'esercizio sotto dovrai costruire un riepilogo simile, ma con dati e criteri diversi.

## CSV per l'esercizio

Per l'esercizio usa invece questo secondo dataset, dedicato alle iscrizioni a piccoli corsi di formazione:

```csv
Data;Sede;Corso;Iscritti;Quota per iscritto;Incasso;Stato iscrizioni;Attivazione corso
2026-03-07;Milano;Excel base;14;45;;Aperte;
2026-03-07;Roma;Canva per la scuola;6;35;;Chiuse;
2026-03-08;Torino;Foglio di calcolo avanzato;11;55;;Aperte;
2026-03-08;Milano;Presentazioni efficaci;8;40;;Aperte;
2026-03-09;Online;Google Moduli;19;25;;Chiuse;
2026-03-09;Roma;Uso del registro elettronico;9;30;;Aperte;
2026-03-10;Torino;Sicurezza digitale;7;50;;Aperte;
2026-03-10;Online;Scrittura professionale;13;28;;Chiuse;
2026-03-11;Milano;Intelligenza artificiale a scuola;5;60;;Aperte;
2026-03-11;Roma;Organizzazione del lavoro;12;32;;Aperte;
```

## 4) Esercizio Lezione 4

Nel foglio `L4_Funzioni_Criteri` importa il `CSV per l'esercizio` di questa lezione.

Consegna:

- calcola la colonna `Incasso`
- crea la colonna `Attivazione corso` con `SE` per indicare `Da confermare` se gli iscritti sono meno di `8` e `Attivo` negli altri casi

- costruisci una piccola area riepilogo in un'area separata, per esempio in `J:K`, usando etichette testuali in `J` e formule in `K`. In questa area inserisci: `SOMMA`, `MEDIA`, `MIN`, `MAX` applicate alla colonna `Incasso`
- calcola il totale degli incassi della sede `Milano` con iscritti >= 8 usando `SOMMA.PIÙ.SE`
- conta i corsi della sede `Roma` con stato iscrizioni `Aperte` usando `CONTA.PIÙ.SE`
- calcola il totale degli incassi della sede `Online` con iscritti >= 10 usando `SOMMA.PIÙ.SE`

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

Anche in questa lezione, le sezioni qui sopra spiegano come funzionano le formule e quando usarle. Il lavoro pratico vero e proprio inizia con i due `CSV di lavoro` e continua nell'esempio guidato e nell'esercizio.

## CSV per l'esempio guidato

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
Codice;Descrizione;Reparto;Prezzo
P001;Mouse;Informatica;18,5
P002;Tastiera;Informatica;24
P003;Risma A4;Amministrazione;4,8
P004;Toner;Vendite;42
P005;Cuffie;Vendite;35
```

## 5) Esempio guidato

Importa i due `CSV per l'esempio guidato` qui sopra.

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
D2 = SE.ERRORE(CERCA.VERT(A2;Listino!A:D;4;FALSO);"Codice non trovato")
```

In questo esempio:

- `CERCA.VERT` recupera dati da una colonna posta a destra della chiave
- `CERCA.X` rende piu leggibile la ricerca e non obbliga a contare la colonna
- `SE.ERRORE` evita la comparsa di messaggi tecnici quando un codice non esiste nel listino

## CSV per l'esercizio

Per l'esercizio usa invece questi due CSV:

CSV `Ordini`:

```csv
Codice
P010
P012
P999
P011
P777
P013
P010
```

CSV `Listino`:

```csv
Codice;Descrizione;Reparto;Prezzo
P010;Webcam;Informatica;39,9
P011;Hub USB;Informatica;19
P012;Cartelle;Amministrazione;2,2
P013;Cartucce;Vendite;28
P014;Etichette;Magazzino;0,8
```

## 6) Esercizio Lezione 5

Nel foglio `L5_Ricerche` importa i due `CSV per l'esercizio` di questa lezione in due fogli separati: `Ordini` e `Listino`.

Consegna:

- recupera `Descrizione` e `Prezzo` con `CERCA.VERT`
- recupera `Reparto` con `CERCA.X`
- recupera anche `Prezzo` o `Descrizione` con una seconda formula di ricerca a tua scelta
- inserisci almeno 3 codici inesistenti
- gestisci i codici non trovati con `SE.ERRORE`
- scrivi in 2 righe quale funzione ti sembra più comoda tra `CERCA.VERT` e `CERCA.X`

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

Nel lavoro reale, anche in Google Fogli, conviene rendere il dataset leggibile con:

- filtro attivo sull'intervallo
- intestazione ben formattata
- colori alternati

Questo rende più chiaro il dataset e aiuta a lavorare meglio con ordinamenti, filtri e riepiloghi.

## 2) Prepara l'intervallo e attiva i filtri

Vantaggi pratici:

- intestazione evidenziata
- filtri attivi subito su ogni colonna
- lettura più chiara
- aggiornamento più semplice quando aggiungi nuove righe

Idea chiave della lezione:

- alcune operazioni di filtro si possono fare direttamente sul foglio base
- in Google Fogli è utile applicare `Crea un filtro` e, se vuoi, usare colori alternati per leggere meglio il dataset

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

Queste sezioni descrivono quindi il metodo di lavoro corretto su tabelle e filtri. L'attività concreta comincia dal `CSV di lavoro` che segue.

## CSV per l'esempio guidato

Usa un CSV ordini con una struttura simile a questa:

```csv
Data;Reparto;Prodotto;Quantità;Importo;Stato
2026-03-01;Informatica;Mouse;12;222;Aperto
2026-03-01;Vendite;Toner;5;210;Chiuso
2026-03-02;Amministrazione;Risma A4;20;96;Aperto
2026-03-03;Vendite;Cuffie;3;105;Aperto
2026-03-03;Informatica;Tastiera;8;192;Chiuso
2026-03-04;Magazzino;Scatole;15;37,5;Aperto
2026-03-05;Vendite;Notebook;2;1300;Aperto
2026-03-05;Informatica;Monitor;6;840;Aperto
2026-03-06;Amministrazione;Penne;30;36;Chiuso
2026-03-06;Magazzino;Nastro;10;34;Aperto
2026-03-07;Vendite;Webcam;7;280;Aperto
2026-03-07;Informatica;Hub USB;9;171;Chiuso
```

## 9) Esempio guidato

Usa il `CSV per l'esempio guidato` qui sopra.

1. seleziona l'intervallo dati e attiva `Crea un filtro`
2. blocca la riga delle intestazioni
3. ordina per `Reparto`, poi `Importo` desc
4. filtra `Stato = Aperto`
5. filtra anche `Importo > 250`
6. calcola totale visibile con `SUBTOTALE`

Questo esempio guidato mostra una sequenza completa di lavoro sul dataset: prima si prepara la tabella, poi si filtra, infine si legge il risultato con `SUBTOTALE`.

## CSV per l'esercizio

Per l'esercizio usa invece questo dataset:

```csv
Data;Reparto;Prodotto;Quantità;Importo;Stato
2026-03-08;Informatica;Webcam;4;159,6;Aperto
2026-03-08;Vendite;Cartucce;6;168;Chiuso
2026-03-09;Amministrazione;Cartelle;12;26,4;Aperto
2026-03-09;Vendite;Stampante;1;180;Aperto
2026-03-10;Informatica;Notebook;3;1950;Aperto
2026-03-10;Magazzino;Etichette;25;20;Aperto
2026-03-11;Amministrazione;Evidenziatori;18;27;Chiuso
2026-03-11;Magazzino;Bobine;9;49,5;Aperto
2026-03-12;Vendite;Monitor;2;280;Aperto
2026-03-12;Informatica;Hub USB;9;171;Chiuso
```

## 10) Esercizio Lezione 6

Nel foglio `L6_Tabelle_Filtri` importa il `CSV per l'esercizio` di questa lezione.

Consegna:

- attiva il filtro sull'intervallo dati
- blocca la riga delle intestazioni
- ordina i dati per `Reparto` e poi per `Importo` decrescente
- filtra solo gli ordini `Aperto` con importo >= 200
- calcola il totale dei record visibili con `SUBTOTALE`
- scrivi in una riga quali record restano visibili dopo il filtro

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

Questa parte serve come spiegazione del criterio di scelta. L'applicazione concreta arriva nel dataset qui sotto, poi nell'esempio guidato e nell'esercizio.

## CSV per l'esempio guidato

Usa un CSV vendite mensili come questo:

```csv
Mese;Reparto;Importo
Gennaio;Informatica;820
Gennaio;Vendite;640
Gennaio;Amministrazione;310
Febbraio;Informatica;910
Febbraio;Vendite;700
Febbraio;Amministrazione;330
Marzo;Informatica;880
Marzo;Vendite;760
Marzo;Amministrazione;290
Aprile;Informatica;950
Aprile;Vendite;720
Aprile;Amministrazione;340
```

## 5) Esempio guidato

1. Importa il `CSV per l'esempio guidato`.
2. Crea una tabella pivot con somma importi per `Mese` e `Reparto`.
3. Crea un grafico a colonne per confrontare i reparti.
4. Crea un grafico a linee per mostrare l'andamento mensile.

In questo esempio il punto importante non è solo creare due grafici, ma capire che i due grafici servono a leggere due aspetti diversi dello stesso dataset: confronto tra categorie e andamento nel tempo.

## CSV per l'esercizio

Usa invece questo secondo CSV:

```csv
Mese;Reparto;Importo
Maggio;Informatica;1020
Maggio;Vendite;780
Maggio;Amministrazione;360
Giugno;Informatica;980
Giugno;Vendite;810
Giugno;Amministrazione;345
Luglio;Informatica;1100
Luglio;Vendite;790
Luglio;Amministrazione;370
Agosto;Informatica;1050
Agosto;Vendite;830
Agosto;Amministrazione;355
```

## 6) Esercizio Lezione 7

Nel foglio `L7_Grafici_Pivot` importa il `CSV per l'esercizio` di questa lezione.

Consegna:

- crea una tabella pivot che riassuma gli importi per mese e reparto
- crea un grafico a colonne per confrontare i reparti
- crea un grafico a linee per mostrare l'andamento mensile
- scrivi in 2 righe quale dei due grafici comunica meglio ciascuna informazione
- controlla che entrambi i grafici abbiano titolo leggibile e legenda chiara

# Lezione 8 - Simulazione verifica (prova guidata)

## Obiettivo

Allenarsi in condizioni simili alla verifica reale, con tempi e consegna strutturata.

## Durata

1 ora.

## Consegna simulazione

Usa un file con dati ordini/vendite e completa tutte le richieste.

Le parti qui sotto sono tutte operative: questa lezione non introduce nuova teoria, ma riunisce in un'unica prova guidata le competenze già allenate nelle lezioni precedenti.

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

7. Attiva il filtro sul dataset e rendilo leggibile con intestazione chiara e, se vuoi, colori alternati.
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
