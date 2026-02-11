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
1) Aggiungi una tabella `docenti` con: id (PK), nome (varchar 30, non nullo), cognome (varchar 30, non nullo), email (varchar 50, unico), età (intero, minimo 18), classe_id (FK verso classi). Mettila in fondo allo schema SQL.
2) Verifica che lo schema sia corretto eseguendo il codice in DB Fiddle.
3) Aggiungi un docente di prova nella tabella `docenti` con questa query:
```sql
INSERT INTO docenti (nome, cognome, email, eta, classe_id)
VALUES ('Luisa', 'Verdi', 'luisa.verdi@scuola.it', 35, 1);
```
4) Esegui le seguenti query per vedere i dati:
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
1) Mostra tutti gli studenti in ordine alfabetico per cognome.
2) Mostra i voti di Matematica (materia_id = 2).
3) Mostra gli studenti nati nel 2008.

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
1) Aggiungi una nuova classe 4A e un nuovo studente in quella classe (stampa la tabella delle classi per ottenere l'id corretto).
2) Aggiorna la data di nascita di uno studente.
3) Elimina il voto di uno studente in Informatica (stampa la tabella degli studenti e la tabella materie per ottenere gli id corretti).

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
1) Mostra nome, cognome e classe di tutti gli studenti della 3B.
2) Mostra tutti i voti di uno studente a scelta (nome e cognome).
3) Mostra tutti i voti di Matematica degli studenti delle terze superiori di tutte le sezioni, con nome, cognome, classe, voto e data della prova, ordinati per voto in ordine decrescente.

# Lezione 5 - Aggregazioni

## Perché ci servono le aggregazioni
Le funzioni aggregate riassumono i dati: contare, fare medie, trovare minimi e massimi. Sono utili per statistiche e riepiloghi.

## Funzioni principali
- `COUNT`: conta quante righe ci sono.
- `AVG`: calcola la media.
- `MIN` e `MAX`: trovano il minimo e il massimo.

## GROUP BY e HAVING
- `GROUP BY` crea gruppi di righe (es. per classe o per materia).
- `HAVING` filtra i gruppi dopo l'aggregazione.
- `WHERE` filtra le righe **prima** di raggruppare.

## Query SQL (esempi aggregazioni)
```sql
-- Numero di studenti per classe
SELECT c.nome AS classe, COUNT(s.id) AS numero_studenti
FROM classi c
LEFT JOIN studenti s ON s.classe_id = c.id
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
1) Conta quanti voti ha ogni studente.
2) Trova il voto minimo e massimo per ogni materia.
3) Mostra solo gli studenti con media >= 7.5.


# Conclusione
Ora sai creare tabelle con vincoli e relazioni, inserire e modificare dati, e interrogare un database con SELECT, JOIN e aggregazioni. La prossima volta useremo queste basi per costruire query più complesse su database reali.
