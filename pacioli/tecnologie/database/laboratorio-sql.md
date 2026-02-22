# Laboratorio SQL - PostgreSQL

## Prima di iniziare

SQL (Structured Query Language) è il linguaggio con cui parliamo con il database. Con SQL possiamo creare tabelle, inserire dati, modificarli e interrogarli: possiamo fare quindi tutti i tipi di transazioni che servono in un'applicazione. Generalmente è l'applicazione che utilizza SQL per gestire il database, ma è importante sapere come funziona per progettare e ottimizzare le operazioni.

## Dove scrivere il codice SQL

Lavoreremo online con DB Fiddle per evitare installazioni: useremo https://www.db-fiddle.com/ con database di tipo **PostgreSQL**. L'interfaccia di DB Fiddle ha due sezioni principali:

- **Schema SQL**: qui vanno scritti i comandi per creare le tabelle e inserire i dati iniziali.
- **Query SQL**: qui si scrivono le query da eseguire (SELECT, UPDATE, DELETE, ecc.).

In alto ci sono due pulsanti importanti:

- **Run**: esegue quello che è stato scritto (sia Schema SQL che Query SQL) e mostra il risultato. Prima viene eseguito lo Schema SQL, poi la Query SQL.
- **Save/Update**: salva il lavoro e crea un link condivisibile.

# Lezione 0 - Regole di base di SQL

## Ripasso concetti fondamentali

- **Tabella**: insieme di righe (record) con le stesse colonne.
- **Colonna**: un singolo tipo di informazione (nome, data, voto, ecc.).
- **PK (Primary Key)**: campo che identifica in modo unico ogni riga.
- **FK (Foreign Key)**: campo che collega una tabella a un'altra.
- **Vincoli**: regole che i dati devono rispettare (es. non vuoto, valore unico).

## Regole sintattiche di base

- Ogni comando termina con `;`.
- Le stringhe vanno tra apici singoli, ad esempio `'Mario'`.
- Le date si scrivono nel formato `AAAA-MM-GG`, ad esempio `'2008-02-10'` e tra apici singoli.
- I nomi di tabelle e colonne non vanno tra apici.
- Le parole chiave SQL (come `SELECT`, `FROM`, `WHERE`, ecc.) sono case-insensitive, ma si usano spesso in maiuscolo per chiarezza.
- I commenti su una riga si scrivono con -- e tutto ciò che segue viene ignorato.

# Lezione 1 - Il DDL e la prima query

## Il DDL: creare la struttura del database

DDL significa **Data Definition Language**. È un insieme di comandi SQL che definiscono la struttura del database: tabelle, colonne, tipi di dato e regole e relazioni. È come disegnare l'architettura di una casa prima di arredarla. Non comprende le query per manipolare i dati (quelle verranno identificate come DML, Data Manipulation Language).

## Come creare tabelle in SQL

Il comando principale per creare tabelle è `CREATE TABLE`. Serve a definire una nuova tabella, specificando il nome, le colonne, i tipi di dato e i vincoli.

## Sintassi di base di CREATE TABLE

La struttura generale è:

```sql
CREATE TABLE nome_tabella (
  colonna1 TIPO [VINCOLI],
  colonna2 TIPO [VINCOLI],
  ...
);
```

## Tipi di dato di base

I tipi di dato riguardano il tipo di informazione che una colonna può contenere. Ecco i tipi più comuni che useremo:

- **SERIAL**: intero auto-incrementale (ottimo per le PK).
- **INT**: numero intero.
- **VARCHAR(n)**: testo con un massimo di n caratteri.
- **DATE**: data (anno-mese-giorno).
- **BOOLEAN**: vero/falso.
- **TIME**: orario (ore:minuti:secondi).
- **TIMESTAMP**: data e orario insieme.
- **NUMERIC(3,1)**: numero con decimali controllati. Il primo numero è il totale di cifre, il secondo è il numero di cifre decimali. Nell'esempio, 3 cifre totali di cui 1 decimale (es. 10.5).

## Vincoli più usati

I vincoli sono regole che i dati devono rispettare. Ecco i vincoli più comuni:

- **PRIMARY KEY**: campo che identificherà in modo univoco una riga.
- **NOT NULL**: il campo non può essere vuoto.
- **UNIQUE**: il valore non può ripetersi.
- **CHECK**: impone una condizione sui valori ammessi.
- **REFERENCES**: definisce una chiave esterna (FK) che punta a un'altra tabella.

In questo laboratorio useremo solo vincoli di colonna (scritti accanto alla colonna). Esistono anche vincoli di tabella (scritti alla fine, dopo la definizione di tutte le colonne), ma per semplicità non li useremo.

## Esempio di vincoli di colonna (inline)

```sql
CREATE TABLE docenti (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  cognome VARCHAR(30) NOT NULL,
  email VARCHAR(50) UNIQUE,
  eta INT CHECK (eta >= 18)
);
```

### Dettaglio sul vincolo CHECK (valori ammessi)

Il vincolo `CHECK` permette di specificare una condizione che i valori di una colonna devono rispettare. Ad esempio, per una colonna `voto` che deve essere compresa tra 1 e 10:

```sql
CREATE TABLE voti (
  id SERIAL PRIMARY KEY,
  voto NUMERIC(3,1) NOT NULL CHECK (voto BETWEEN 1 AND 10)
);
```

## Sintassi della FOREIGN KEY (inline)

La `FOREIGN KEY` è un vincolo che crea una relazione tra due tabelle, collegando una colonna di una tabella a una colonna (di solito la PK) di un'altra tabella. La sintassi che utilizzeremo è la forma inline, che si scrive accanto alla colonna che fa riferimento a un'altra tabella:

```sql
-- Forma inline
classe_id INT NOT NULL REFERENCES classi(id)
```

Il significato è che `classe_id` nella tabella corrente fa riferimento alla colonna `id` della tabella `classi`.

## Ricostruire le relazioni in SQL

Vediamo ora come rappresentare le relazioni viste a lezione nel modello relazionale SQL.

### Relazione 1:N (una classe -> molti studenti)

Chiave esterna nella tabella "molti".

```sql
CREATE TABLE classi (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(10) NOT NULL
);

CREATE TABLE studenti (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  classe_id INT NOT NULL REFERENCES classi(id)
);
```

### Relazione N:M (studenti <-> materie)

Serve una tabella associativa (ponte), spesso contiene anche dati extra come voto e data. Le chiavi esterne vanno nella tabella associativa.

```sql
CREATE TABLE studenti (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL
);

CREATE TABLE materie (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL
);

CREATE TABLE voti (
  id SERIAL PRIMARY KEY,
  studente_id INT NOT NULL REFERENCES studenti(id),
  materia_id INT NOT NULL REFERENCES materie(id),
  voto NUMERIC(3,1) NOT NULL CHECK (voto BETWEEN 1 AND 10),
  data_prova DATE NOT NULL
);
```

## Esempio di schema SQL completo (da incollare nella parte Schema SQL in DB Fiddle) con dati iniziali

Copia questo codice nella sezione Schema SQL per creare le tabelle e inserire i dati

```sql
CREATE TABLE classi (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(10) NOT NULL,
  anno INT NOT NULL CHECK (anno BETWEEN 1 AND 5),
  sezione VARCHAR(2) NOT NULL
);

CREATE TABLE studenti (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  cognome VARCHAR(30) NOT NULL,
  data_nascita DATE NOT NULL,
  classe_id INT NOT NULL REFERENCES classi(id)
);

CREATE TABLE materie (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL UNIQUE
);

-- Qui la N:M viene modellata con una tabella associativa che contiene anche attributi della relazione (voto e data).
CREATE TABLE voti (
  id SERIAL PRIMARY KEY,
  studente_id INT NOT NULL REFERENCES studenti(id),
  materia_id INT NOT NULL REFERENCES materie(id),
  voto NUMERIC(3,1) NOT NULL CHECK (voto BETWEEN 1 AND 10),
  data_prova DATE NOT NULL
);

-- CLASSI
INSERT INTO classi (nome, anno, sezione) VALUES
  ('3A', 3, 'A'),
  ('3B', 3, 'B'),
  ('4A', 4, 'A'),
  ('5B', 5, 'B');

-- STUDENTI
INSERT INTO studenti (nome, cognome, data_nascita, classe_id) VALUES
  ('Mario', 'Rossi', '2008-02-10', 1),
  ('Luca', 'Bianchi', '2008-11-23', 1),
  ('Elena', 'Ferrari', '2008-06-15', 1),

  ('Giulia', 'Verdi', '2008-05-18', 2),
  ('Anna', 'Neri', '2008-09-05', 2),

  ('Paolo', 'Gialli', '2007-03-12', 3),
  ('Marco', 'Blu', '2007-12-01', 3),

  ('Sara', 'Conti', '2006-01-20', 4),
  ('Davide', 'Moretti', '2006-07-30', 4);

-- MATERIE
INSERT INTO materie (nome) VALUES
  ('Italiano'),
  ('Matematica'),
  ('Informatica'),
  ('Storia'),
  ('Inglese');

-- VOTI
INSERT INTO voti (studente_id, materia_id, voto, data_prova) VALUES
  -- Mario Rossi (3A)
  (1, 1, 7.0, '2025-11-05'),
  (1, 2, 7.5, '2025-11-10'),
  (1, 3, 8.0, '2025-11-12'),

  -- Luca Bianchi (3A)
  (2, 1, 6.5, '2025-11-05'),
  (2, 2, 6.0, '2025-11-10'),

  -- Elena Ferrari (3A)
  (3, 2, 8.5, '2025-11-10'),
  (3, 3, 9.0, '2025-11-12'),

  -- Giulia Verdi (3B)
  (4, 1, 7.0, '2025-11-06'),
  (4, 4, 6.5, '2025-11-15'),

  -- Anna Neri (3B)
  (5, 2, 8.0, '2025-11-10'),
  (5, 5, 7.5, '2025-11-18'),

  -- Paolo Gialli (4A)
  (6, 1, 6.0, '2025-11-07'),
  (6, 3, 7.0, '2025-11-14'),

  -- Marco Blu (4A)
  (7, 2, 9.0, '2025-11-10'),
  (7, 3, 8.5, '2025-11-14'),

  -- Sara Conti (5B)
  (8, 1, 7.5, '2025-11-08'),
  (8, 5, 8.0, '2025-11-18'),

  -- Davide Moretti (5B)
  (9, 2, 6.0, '2025-11-10'),
  (9, 4, 7.0, '2025-11-15');

```

### Cosa rappresenta questo schema

Questo schema rappresenta un database per gestire le classi, gli studenti, le materie e i voti in una scuola. Le tabelle sono:

- `classi` è una tabella che contiene le classi, con anno e sezione.
- `studenti` tabella contenente gli studenti, collegati a `classi` tramite `classe_id` (relazione con cardinalità molti-a-uno).
- `materie` contiene le materie scolastiche.
- `voti` collega studenti e materie con un voto e una data (relazione molti-a-molti che si appoggia a questa tabella intermedia).

## Una semplice query di prova

Questo è il codice di una query (interrogazione) che mostra tutti gli studenti con il loro nome, cognome e data di nascita. Puoi incollarlo nella sezione Query SQL in DB Fiddle e premere Run per vedere il risultato:

```sql
SELECT nome, cognome, data_nascita
FROM studenti;
```

## Esercizio

1. Aggiungi una tabella `docenti` con: id (PK), nome (varchar 30, non nullo), cognome (varchar 30, non nullo), email (varchar 50, unico), età (intero, minimo 18), classe_id (FK verso classi). Mettila in fondo allo schema SQL.
2. Verifica che lo schema sia corretto eseguendo il codice in DB Fiddle.
3. Aggiungi un docente di prova nella tabella `docenti` con questa query:

```sql
INSERT INTO docenti (nome, cognome, email, eta, classe_id)
VALUES ('Luisa', 'Verdi', 'luisa.verdi@scuola.it', 35, 1);
```

4. Esegui le seguenti query per vedere i dati:

```sql
SELECT * FROM docenti;
SELECT * FROM classi;
SELECT * FROM studenti;
```

# Lezione 2 - SELECT e filtri (WHERE)

Il comando `SELECT` serve per interrogare il database e ottenere i dati che ci interessano.

## Sintassi di base di SELECT

La struttura generale di una query `SELECT` è:

```sql
SELECT colonne
FROM tabella
[WHERE condizione]
[ORDER BY colonna [ASC|DESC]];
```

## Condizione WHERE

Il `WHERE` serve per specificare quali righe sono interessate dai comandi che utilizziamo. Nella `SELECT`, il `WHERE` filtra i risultati.

## Sintassi delle condizioni WHERE

- `colonna = valore`: uguale a.
- `colonna <> valore`: diverso da.
- `colonna > valore`: maggiore di.
- `colonna < valore`: minore di.
- `colonna BETWEEN valore1 AND valore2`: compreso tra valore1 e valore2.
- `colonna IS NULL`: valore nullo.
- `colonna IS NOT NULL`: valore non nullo.
- `colonna LIKE 'M%'`: inizia con 'M' (esempio di filtro su stringhe).
  - 'M%' inizia con M
  - '%i' finisce con i
- `AND`, `OR`: combinano più condizioni. È possibile utilizzare le parentesi per raggruppare le condizioni e controllare l'ordine di valutazione.

## Ordinamento ORDER BY

L'`ORDER BY` serve per ordinare i risultati in base a una o più colonne. Di default l'ordinamento è crescente (`ASC`), ma si può specificare decrescente (`DESC`).

## Query SQL (esempi SELECT)

Utilizziamo lo schema e i dati iniziali della lezione 1 per questi esempi:

```sql
-- Seleziona nome e cognome di tutti gli studenti
SELECT nome, cognome
FROM studenti;

-- Studenti della classe 3A
SELECT nome, cognome
FROM studenti
WHERE classe_id = 1;

-- Tutti i voti in ordine decrescente
SELECT studente_id, materia_id, voto
FROM voti
ORDER BY voto DESC;

-- Studenti nati dopo il 1 gennaio 2008
SELECT nome, cognome, data_nascita
FROM studenti
WHERE data_nascita > '2008-01-01'
ORDER BY data_nascita;
```

## Esercizio

1. Mostra tutti gli studenti in ordine alfabetico per cognome.
2. Mostra i voti di Matematica (materia_id = 2).
3. Mostra gli studenti nati nel 2008.

# Lezione 3 - Inserimento e modifica dati (DML)

DML significa **Data Manipulation Language**. Sono i comandi con cui inseriamo, modifichiamo ed eliminiamo i dati nelle tabelle del database.

## Comandi principali

- `INSERT`: aggiunge nuove righe.
- `UPDATE`: modifica righe esistenti.
- `DELETE`: elimina righe.

## Sintassi dei comandi

### INSERT

```sql
INSERT INTO tabella (colonna1, colonna2, ...)
VALUES (valore1, valore2, ...);
```

### UPDATE

```sql
UPDATE tabella
SET colonna1 = valore1, colonna2 = valore2, ...
WHERE condizione;
```

### DELETE

```sql
DELETE FROM tabella
WHERE condizione;
```

## Perché usare il WHERE in UPDATE e DELETE

È fondamentale usare il `WHERE` in `UPDATE` e `DELETE` per evitare di modificare o eliminare tutte le righe della tabella. Il `WHERE` specifica quali righe devono essere interessate dall'operazione.

## Query SQL (esempi DML)

Utilizziamo lo schema e i dati iniziali della lezione 1 per questi esempi:

### Inserimento di un nuovo studente

```sql
-- Verifica tutti gli studenti
SELECT * FROM studenti;

-- Inserisci un nuovo studente
INSERT INTO studenti (nome, cognome, data_nascita, classe_id)
VALUES ('Anna', 'Neri', '2008-09-05', 2);

-- Ora verifica di nuovo tutti gli studenti
-- (lascia scritta anche la query precedente in modo da eseguirla di nuovo al nuovo Run)
SELECT * FROM studenti;
```

### Modifica di un voto

```sql
-- Verifica il voto di uno studente
SELECT * FROM voti
WHERE studente_id = 2 AND materia_id = 2;

-- Modifica il voto di uno studente
UPDATE voti
SET voto = 8.5
WHERE studente_id = 2 AND materia_id = 2;

-- Verifica di nuovo il voto modificato
-- Come prima, lascia scritta anche la query precedente per rieseguirla
SELECT * FROM voti
WHERE studente_id = 2 AND materia_id = 2;
```

### Eliminazione di una materia

```sql
-- Verifica tutte le materie
SELECT * FROM materie;

-- Elimina una materia inutile (es: Informatica)
-- (attenzione: se è usata nei voti, il DB stesso darà un errore)
DELETE FROM materie
WHERE nome = 'Informatica';
```

## Esercizio

1. Aggiungi una nuova classe 4A e un nuovo studente in quella classe (stampa la tabella delle classi per ottenere l'id corretto).
2. Aggiorna la data di nascita di uno studente.
3. Elimina il voto di uno studente in Informatica (stampa la tabella degli studenti e la tabella materie per ottenere gli id corretti).

# Lezione 4 - JOIN tra tabelle

I dati spesso sono distribuiti in più tabelle collegate tra loro. Per ottenere informazioni complete, dobbiamo unire (JOIN) i dati di più tabelle. Esistono vari tipi di JOIN, ma in questo laboratorio useremo principalmente la `INNER JOIN`, che restituisce solo le righe che hanno corrispondenze in entrambe le tabelle. Per conoscenza, le altre tipologie di JOIN sono:

- `LEFT JOIN`: restituisce tutte le righe della tabella di sinistra e le corrispondenze della tabella di destra (se non ci sono corrispondenze, i campi della tabella di destra saranno NULL).
- `RIGHT JOIN`: restituisce tutte le righe della tabella di destra e le corrispondenze della tabella di sinistra (se non ci sono corrispondenze, i campi della tabella di sinistra saranno NULL).
- `FULL JOIN`: restituisce tutte le righe di entrambe le tabelle, con NULL dove non ci sono corrispondenze.

## La dot notation e gli alias

Quando si lavora con più tabelle, è utile specificare da quale tabella proviene ogni colonna usando la "dot notation": `tabella.colonna`. In questo modo è possibile individuare univocamente le colonne, soprattutto quando più tabelle hanno colonne con lo stesso nome.
Esempio di dot notation:

```sql
SELECT studenti.nome, classi.nome
FROM studenti
JOIN classi ON studenti.classe_id = classi.id;
```

Per rendere le query più leggibili e veloci da scrivere invece, si usano spesso degli alias (abbreviazioni) per i nomi delle tabelle. Esempio con alias:

```sql
SELECT s.nome, c.nome AS classe
FROM studenti s
JOIN classi c ON s.classe_id = c.id;
```

Gli alias vengono utilizzati anche per le colonne, come nell'esempio sopra con `c.nome AS classe`, che rinomina la colonna `nome` della tabella `classi` in `classe` nel risultato della query. L'intestazione della tabella risultante mostrerà quindi `classe` invece di `nome`.

## Come si fanno i collegamenti tra tabelle con JOIN

Innanzitutto ricordiamo le relazioni tra le tabelle del nostro schema, implementandole con la dot notation:

- `studenti.classe_id` punta a `classi.id`.
- `voti.studente_id` punta a `studenti.id`.
- `voti.materia_id` punta a `materie.id`.

Poi, implementiamo degli alias per le tabelle coinvolte in modo da rendere le query più leggibili:

- `studenti s`
- `classi c`
- `voti v`
- `materie m`

Infine, applichiamo le condizioni di join usando la clausola `ON` per specificare come le tabelle sono collegate tra loro. Ecco la sintassi generale di una JOIN:

```sql
SELECT colonne
FROM tabella1 AS alias1
JOIN tabella2 AS alias2
ON alias1.colonnaX = alias2.colonnaY
[WHERE condizione]
[ORDER BY colonna [ASC|DESC]];
```

## Spiegazione della sintassi

- `JOIN`: unisce due tabelle basandosi sulla condizione specificata nella clausola `ON`.
- `ON`: specifica la condizione di join, indicando quali colonne delle due tabelle devono essere uguali per unire le righe.
- `alias1`, `alias2`: sono gli alias delle tabelle, usati per semplificare la scrittura delle query.

## Query SQL (esempi JOIN)

Utilizziamo lo schema e i dati iniziali della lezione 1 per questi esempi:

```sql
-- Elenco studenti con nome classe
SELECT s.nome, s.cognome, c.nome AS classe
FROM studenti s
JOIN classi c ON s.classe_id = c.id
ORDER BY s.cognome;

-- Voti con nome studente e materia
SELECT s.nome, s.cognome, m.nome AS materia, v.voto
FROM voti v
JOIN studenti s ON v.studente_id = s.id
JOIN materie m ON v.materia_id = m.id
ORDER BY s.cognome, m.nome;

-- Voti di Matematica solo per la classe 3A
SELECT s.nome, s.cognome, v.voto
FROM voti v
JOIN studenti s ON v.studente_id = s.id
JOIN materie m ON v.materia_id = m.id
JOIN classi c ON s.classe_id = c.id
WHERE m.nome = 'Matematica' AND c.nome = '3A'
ORDER BY v.voto DESC;
```

## Esercizio

Scrivi le seguenti query utilizzando JOIN:

1. Mostra nome, cognome e classe di tutti gli studenti della 3B.
2. Mostra tutti i voti di uno studente a scelta (nome e cognome).
3. Mostra tutti i voti di Matematica degli studenti delle terze superiori di tutte le sezioni, con nome, cognome, classe, voto e data della prova, ordinati per voto in ordine decrescente.

# Lezione 5 - Aggregazioni

## Cosa sono le funzioni aggregate

Le funzioni aggregate sono funzioni che operano su un insieme di valori e restituiscono un singolo valore riassuntivo. Sono utili per calcolare statistiche, come il numero di righe, la media, il minimo o il massimo di un insieme di dati.
Questo permette non più solamente di mostrare determinate tuple come fatto finora ma di rispondere a richieste specifiche su di esse.

## Sintassi delle funzioni aggregate

La sintassi generale per utilizzare una funzione aggregata è:

```sql
SELECT funzione_aggregata(colonna)
FROM tabella
```

Si sceglie quindi una funzione e tra parentesi si mette il campo su cui si vuole calcolare l'aggregazione. Ad esempio, `COUNT(*)` conta tutte le righe, mentre `AVG(voto)` calcola la media dei voti.

## Funzioni principali

- `COUNT`: conta il numero di righe o di valori non nulli in una colonna.
- `SUM`: somma i valori di una colonna.
- `AVG`: calcola la media aritmetica dei valori di una colonna.
- `MIN`: restituisce il valore minimo di una colonna.
- `MAX`: restituisce il valore massimo di una colonna.

## GROUP BY e HAVING

Quando si utilizzano funzioni aggregate, spesso è necessario raggruppare i dati in base a una o più colonne. Per fare questo si usa la clausola `GROUP BY`. Inoltre, se vogliamo filtrare i gruppi in base a una condizione sulle funzioni aggregate, utilizziamo la clausola `HAVING`.

### Cosa fa `GROUP BY`?

`GROUP BY` prende le righe della tabella e le divide in gruppi in base al valore di una o più colonne.
Poi le funzioni aggregate (`COUNT`, `AVG`, `MIN`, `MAX`, ...) vengono calcolate separatamente per ogni gruppo.

Senza `GROUP BY`:

```sql
SELECT AVG(voto)
FROM voti;
```

Significa: prendi tutti i voti della tabella e fai una media unica.
Output: una sola riga.

Con `GROUP BY`:

```sql
SELECT materia_id, AVG(voto)
FROM voti
GROUP BY materia_id;
```

Significa:

- dividi i voti per `materia_id`;
- per ogni materia calcola la media;
- output: una riga per ogni materia.

Quindi:

- senza `GROUP BY` -> aggrego tutta la tabella;
- con `GROUP BY` -> aggrego per gruppi.

### Regola fondamentale del GROUP BY

Quando usi una funzione aggregata e nel `SELECT` metti anche altre colonne, quelle colonne devono comparire nel `GROUP BY`.

Esempio:

```sql
SELECT s.nome, s.cognome, AVG(v.voto) AS media
FROM studenti s
JOIN voti v ON v.studente_id = s.id
GROUP BY s.nome, s.cognome;
```

Qui il `JOIN` crea tante righe (una per ogni voto). `GROUP BY s.nome, s.cognome` le divide per studente e `AVG(v.voto)` calcola la media per ogni gruppo.
Risultato: una riga per studente con la sua media.

### Cosa fa `HAVING`?

`HAVING` e un filtro sui gruppi.

- `WHERE` filtra le righe prima del `GROUP BY`;
- `HAVING` filtra i gruppi dopo il `GROUP BY`.

Esempio:

```sql
SELECT m.nome AS materia, AVG(v.voto) AS media
FROM materie m
JOIN voti v ON v.materia_id = m.id
GROUP BY m.nome
HAVING AVG(v.voto) >= 7
ORDER BY media DESC;
```

Passo per passo:

- `JOIN` crea una tabella con materia + voto;
- `GROUP BY m.nome` crea un gruppo per ogni materia;
- `AVG(v.voto)` calcola la media per ogni gruppo;
- `HAVING` tiene solo i gruppi con media >= 7.

`HAVING` quindi filtra le materie (gruppi), non le singole righe.

### Differenza chiave tra `WHERE` e `HAVING`

`WHERE voto >= 7` elimina prima le singole righe con voto basso, poi calcoli la media solo sulle righe rimaste.

`HAVING AVG(voto) >= 7` calcola prima la media di tutti i voti per gruppo, poi elimina i gruppi con media bassa.

Sono due operazioni diverse.

### Riassunto rapido di GROUP BY e HAVING

- `GROUP BY` = dividi in gruppi
- funzione aggregata = fai un calcolo per gruppo
- `HAVING` = filtra i gruppi

### Mini esempio GROUP BY e HAVING

Tabella `voti`:

| studente | voto |
| -------- | ---- |
| Mario    | 6    |
| Mario    | 8    |
| Luca     | 5    |
| Luca     | 7    |

```sql
SELECT studente, AVG(voto) AS media
FROM voti
GROUP BY studente
HAVING AVG(voto) >= 7;
```

Passaggi:

- gruppo Mario -> media 7;
- gruppo Luca -> media 6;
- `HAVING` elimina Luca.

Risultato: resta solo Mario.

## Query di esempi aggregazioni da incollare nella sezione Query SQL in DB Fiddle:

```sql
-- Numero di studenti per classe
SELECT c.nome AS classe, COUNT(s.id) AS numero_studenti
FROM classi c
JOIN studenti s ON s.classe_id = c.id
GROUP BY c.nome
ORDER BY c.nome;

-- Media voti per studente
SELECT s.nome, s.cognome, ROUND(AVG(v.voto), 2) AS media
FROM studenti s
JOIN voti v ON v.studente_id = s.id
GROUP BY s.nome, s.cognome
ORDER BY media DESC;


-- Media voti per materia, solo se la media è almeno 7
SELECT m.nome AS materia, ROUND(AVG(v.voto), 2) AS media
FROM materie m
JOIN voti v ON v.materia_id = m.id
GROUP BY m.nome
HAVING AVG(v.voto) >= 7
ORDER BY media DESC;

```

## Esercizio

1. Conta quanti voti ha ogni studente.
2. Trova il voto minimo per ogni materia
3. Trova il voto massimo per ogni materia
4. Mostra solo gli studenti con media >= 7.5.

# Schema e dati di partenza per esercitazioni future (da incollare nella sezione Schema SQL in DB Fiddle)

```sql
-- Tabella biblioteche: contiene le informazioni sulle biblioteche (id, nome, città, indirizzo)
CREATE TABLE biblioteche (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  citta VARCHAR(30) NOT NULL,
  indirizzo VARCHAR(80) NOT NULL
);

-- Tabella utenti: ogni utente è associato ad una sola biblioteca (FK verso biblioteche). 1:N tra biblioteche e utenti.
CREATE TABLE utenti (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  cognome VARCHAR(30) NOT NULL,
  biblioteca_id INT NOT NULL REFERENCES biblioteche(id)
);

-- Tabella libri: ogni libro è associato ad una sola biblioteca (FK verso biblioteche). 1:N tra biblioteche e libri.
CREATE TABLE libri (
  id SERIAL PRIMARY KEY,
  titolo VARCHAR(80) NOT NULL,
  autore VARCHAR(60) NOT NULL,
  anno_pubblicazione INT NOT NULL CHECK (anno_pubblicazione BETWEEN 1900 AND 2026),
  isbn VARCHAR(13) NOT NULL UNIQUE,
  biblioteca_id INT NOT NULL REFERENCES biblioteche(id)
);

-- Tabella prestiti: tabella associativa che mette in relazione utenti e libri (FK verso utenti e FK verso libri). N:M tra utenti e libri. Contiene anche data_prestito e restituito (booleano).
CREATE TABLE prestiti (
  id SERIAL PRIMARY KEY,
  utente_id INT NOT NULL REFERENCES utenti(id),
  libro_id INT NOT NULL REFERENCES libri(id),
  data_prestito DATE NOT NULL,
  restituito BOOLEAN NOT NULL DEFAULT FALSE
);

-- Dati per la tabella biblioteche
INSERT INTO biblioteche (nome, citta, indirizzo) VALUES
  ('Biblioteca Centrale', 'Cremona', 'Via Roma 10'),
  ('Biblioteca Quartiere Sud', 'Crema', 'Viale Europa 22'),
  ('Biblioteca Civica', 'Lodi', 'Piazza Duomo 3'),
  ('Biblioteca Universitaria', 'Milano', 'Via Brera 5'),
  ('Biblioteca Nord', 'Brescia', 'Via Milano 12'),
  ('Biblioteca Est', 'Bergamo', 'Via Dante 45');

-- Dati per la tabella utenti
INSERT INTO utenti (nome, cognome, biblioteca_id) VALUES
  ('Marco', 'Rinaldi', 1),
  ('Giulia', 'Martini', 1),
  ('Luca', 'Seri', 2),
  ('Elena', 'Ferri', 2),
  ('Sara', 'Colombo', 2),
  ('Paolo', 'Gatti', 3),
  ('Anna', 'Moretti', 3),
  ('Davide', 'Neri', 4),
  ('Chiara', 'Bianchi', 4),
  ('Francesca', 'Rossi', 5),
  ('Alessandro', 'Villa', 5),
  ('Marta', 'Grandi', 6),
  ('Stefano', 'Russo', 6),
  ('Laura', 'Marini', 1),
  ('Giorgio', 'Conti', 2);

-- Dati per la tabella libri
INSERT INTO libri (titolo, autore, anno_pubblicazione, isbn, biblioteca_id) VALUES
  ('Il nome della rosa', 'Umberto Eco', 1980, '9780000000001', 1),
  ('Fondazione', 'Isaac Asimov', 1951, '9780000000002', 1),
  ('1984', 'George Orwell', 1949, '9780000000003', 2),
  ('Il signore degli anelli', 'J.R.R. Tolkien', 1954, '9780000000004', 2),
  ('Sapiens', 'Yuval Noah Harari', 2011, '9780000000005', 3),
  ('Clean Code', 'Robert C. Martin', 2008, '9780000000006', 4),
  ('Dune', 'Frank Herbert', 1965, '9780000000007', 3),
  ('Norwegian Wood', 'Haruki Murakami', 1987, '9780000000008', 1),
  ('La coscienza di Zeno', 'Italo Svevo', 1923, '9780000000009', 1),
  ('Il piccolo principe', 'Antoine de Saint-Exupery', 1943, '9780000000010', 2),
  ('Neuromante', 'William Gibson', 1984, '9780000000011', 3),
  ('Il codice da Vinci', 'Dan Brown', 2003, '9780000000012', 4),
  ('Il processo', 'Franz Kafka', 1925, '9780000000013', 5),
  ('Orgoglio e pregiudizio', 'Jane Austen', 1913, '9780000000014', 6);

-- Dati per la tabella prestiti
INSERT INTO prestiti (utente_id, libro_id, data_prestito, restituito) VALUES
  (1, 1, '2025-11-01', TRUE),
  (2, 2, '2025-11-02', FALSE),
  (1, 8, '2025-11-03', FALSE),
  (3, 3, '2025-11-01', TRUE),
  (4, 4, '2025-11-04', FALSE),
  (5, 3, '2025-11-05', FALSE),
  (6, 5, '2025-11-02', TRUE),
  (7, 7, '2025-11-06', FALSE),
  (6, 7, '2025-11-07', FALSE),
  (8, 6, '2025-11-03', TRUE),
  (9, 6, '2025-11-08', FALSE),
  (8, 6, '2025-11-09', FALSE),
  (1, 2, '2025-11-10', TRUE),
  (1, 3, '2025-11-11', FALSE),
  (1, 9, '2025-11-12', FALSE),
  (10, 3, '2025-11-10', TRUE),
  (11, 3, '2025-11-11', FALSE),
  (12, 3, '2025-11-12', FALSE),
  (10, 13, '2025-11-05', TRUE),
  (11, 13, '2025-11-06', FALSE),
  (12, 14, '2025-11-07', TRUE),
  (13, 14, '2025-11-08', FALSE),
  (14, 1, '2025-11-15', FALSE),
  (14, 4, '2025-11-16', FALSE),
  (14, 6, '2025-11-17', TRUE),
  (15, 10, '2025-11-18', TRUE);
```

## Esercizio

1. Mostra tutte le biblioteche, ordinate prima per città e poi per nome.
2. Mostra nome e cognome di tutti gli utenti, ordinati alfabeticamente per cognome.
3. Mostra titolo, autore e anno di pubblicazione dei libri pubblicati dopo il 2000, ordinati per anno e titolo.
4. Mostra titolo, autore e anno di pubblicazione dei libri presenti nella “Biblioteca Centrale”, ordinati per titolo.
5. Mostra nome, cognome e nome della biblioteca di iscrizione per tutti gli utenti, ordinando per biblioteca e poi per cognome.
6. Mostra tutti i prestiti non restituiti, indicando nome utente, cognome, titolo del libro e data del prestito, ordinati per data.
7. Mostra tutti i prestiti effettuati da “Marco Rinaldi”, indicando titolo del libro, data del prestito e stato di restituzione.
8. Mostra tutti i prestiti con nome e cognome dell’utente, nome della biblioteca, titolo del libro, data del prestito e stato di restituzione, ordinati per biblioteca e utente.
9. Conta quanti utenti sono iscritti a ogni biblioteca. Mostra nome biblioteca e numero utenti.
10. Conta quanti libri sono presenti in ogni biblioteca. Mostra nome biblioteca e numero libri.
11. Calcola il numero di prestiti effettuati da ogni utente. Mostra nome, cognome e numero di prestiti, ordinando dal maggiore al minore.
12. Mostra solo gli utenti che hanno effettuato almeno 2 prestiti, indicando nome, cognome e numero di prestiti.
13. Calcola quante volte è stato prestato ogni libro. Mostra titolo e numero di prestiti, ordinando dal più prestato al meno prestato.
14. Mostra solo i libri che sono stati prestati almeno 2 volte.
15. Calcola quanti prestiti non restituiti ci sono per ogni biblioteca (in base alla biblioteca dell’utente).
