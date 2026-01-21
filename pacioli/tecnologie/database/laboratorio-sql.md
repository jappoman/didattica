# Laboratorio SQL - Postgres

Queste lezioni seguono uno stile semplice e pratico, come nel laboratorio HTML. Gli esercizi sono pensati per essere svolti su https://www.db-fiddle.com/ usando il database PostgreSQL.

## Come usare DB Fiddle (Postgres)
- Seleziona **Database: PostgreSQL**.
- Nel riquadro **Schema SQL** metti le istruzioni per creare le tabelle e, quando serve, per inserire i dati.
- Nel riquadro **Query SQL** scrivi le query da eseguire (SELECT, UPDATE, DELETE, ecc.).
- Premi **Run** per vedere i risultati.

## Lezione 1 - Creazione tabelle (DDL)

### Obiettivi
- Capire cosa sono tabelle, colonne, tipi di dato.
- Definire chiavi primarie (PK) e chiavi esterne (FK).
- Usare vincoli come NOT NULL, UNIQUE e CHECK.

### Concetti base
- **Tabella**: insieme di righe (record) con le stesse colonne.
- **Colonna**: un dato specifico (nome, data, voto, ecc.).
- **PK (Primary Key)**: identifica in modo unico una riga.
- **FK (Foreign Key)**: collega una colonna a una PK di un'altra tabella.
- **Vincoli**: regole sui dati (es. non vuoto, valore unico, range valido).

### Da ER a schema SQL (in breve)
- Un'entita diventa una tabella.
- Gli attributi dell'entita diventano colonne.
- Una relazione "uno a molti" si realizza con una FK nella tabella del "molti".

### Schema SQL (da incollare in DB Fiddle)
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

CREATE TABLE voti (
  id SERIAL PRIMARY KEY,
  studente_id INT NOT NULL REFERENCES studenti(id),
  materia_id INT NOT NULL REFERENCES materie(id),
  voto NUMERIC(3,1) NOT NULL CHECK (voto BETWEEN 1 AND 10),
  data_prova DATE NOT NULL
);
```

### Spiegazione dei tipi di dato
- **SERIAL**: intero auto-incrementale (comodo per le PK).
- **INT**: numero intero.
- **VARCHAR(n)**: testo con massimo n caratteri.
- **DATE**: data (AAAA-MM-GG).
- **NUMERIC(3,1)**: numero con 3 cifre totali e 1 decimale (es. 7.5).

### Esercizio
1) Aggiungi una tabella `docenti` con: id, nome, cognome, email (unica).
2) Aggiungi alla tabella `materie` una colonna `ore_settimanali` (INT, NOT NULL).


## Lezione 2 - Inserimento e modifica dati (DML)

### Obiettivi
- Inserire dati con `INSERT`.
- Modificare dati con `UPDATE`.
- Eliminare dati con `DELETE`.

### Schema SQL (creazione + dati iniziali)
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

CREATE TABLE voti (
  id SERIAL PRIMARY KEY,
  studente_id INT NOT NULL REFERENCES studenti(id),
  materia_id INT NOT NULL REFERENCES materie(id),
  voto NUMERIC(3,1) NOT NULL CHECK (voto BETWEEN 1 AND 10),
  data_prova DATE NOT NULL
);

INSERT INTO classi (nome, anno, sezione) VALUES
  ('3A', 3, 'A'),
  ('3B', 3, 'B');

INSERT INTO studenti (nome, cognome, data_nascita, classe_id) VALUES
  ('Mario', 'Rossi', '2008-02-10', 1),
  ('Luca', 'Bianchi', '2008-11-23', 1),
  ('Giulia', 'Verdi', '2008-05-18', 2);

INSERT INTO materie (nome) VALUES
  ('Italiano'),
  ('Matematica'),
  ('Informatica');

INSERT INTO voti (studente_id, materia_id, voto, data_prova) VALUES
  (1, 2, 7.5, '2025-11-10'),
  (1, 3, 8.0, '2025-11-12'),
  (2, 2, 6.0, '2025-11-10'),
  (3, 1, 7.0, '2025-11-11');
```

### Query SQL (esempi DML)
```sql
-- Inserisci un nuovo studente
INSERT INTO studenti (nome, cognome, data_nascita, classe_id)
VALUES ('Anna', 'Neri', '2008-09-05', 2);

-- Modifica il voto di uno studente
UPDATE voti
SET voto = 8.5
WHERE studente_id = 2 AND materia_id = 2;

-- Elimina una materia (attenzione: se e' usata nei voti, il DB blocca)
DELETE FROM materie
WHERE nome = 'Italiano';
```

### Spiegazione
- `INSERT` aggiunge nuove righe.
- `UPDATE` cambia le righe che rispettano il `WHERE`.
- `DELETE` elimina le righe che rispettano il `WHERE`.
- Senza `WHERE`, `UPDATE` o `DELETE` agiscono su **tutte** le righe.

### Esercizio
1) Aggiungi una nuova classe 4A e un nuovo studente in quella classe.
2) Aggiorna la data di nascita di uno studente.
3) Elimina il voto di uno studente in Informatica.


## Lezione 3 - SELECT base

### Obiettivi
- Usare `SELECT`, `WHERE`, `ORDER BY`.
- Filtrare con condizioni semplici.

### Schema SQL (usa lo stesso della lezione 2)
Riusa lo schema e i dati della lezione 2.

### Query SQL (esempi SELECT)
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

### Spiegazione rapida
- `SELECT` sceglie le colonne.
- `FROM` indica la tabella.
- `WHERE` filtra le righe.
- `ORDER BY` ordina il risultato.

### Esercizio
1) Mostra tutti gli studenti in ordine alfabetico per cognome.
2) Mostra i voti di Matematica (materia_id = 2).
3) Mostra gli studenti nati nel 2008.


## Lezione 4 - JOIN e filtri

### Obiettivi
- Unire dati di piu tabelle con `JOIN`.
- Aggiungere filtri con `WHERE`.

### Concetto base
Una `JOIN` collega tabelle usando una chiave in comune:
- `studenti.classe_id` si collega a `classi.id`.
- `voti.studente_id` si collega a `studenti.id`.
- `voti.materia_id` si collega a `materie.id`.

### Schema SQL (usa lo stesso della lezione 2)
Riusa lo schema e i dati della lezione 2.

### Query SQL (esempi JOIN)
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

### Esercizio
1) Mostra nome, cognome e classe di tutti gli studenti della 3B.
2) Mostra tutti i voti di uno studente a scelta (nome e cognome).
3) Mostra le materie in cui compare almeno un voto maggiore o uguale a 8.


## Lezione 5 - Aggregazioni

### Obiettivi
- Usare funzioni aggregate: `COUNT`, `AVG`, `MIN`, `MAX`.
- Raggruppare con `GROUP BY`.
- Filtrare i gruppi con `HAVING`.

### Schema SQL (usa lo stesso della lezione 2)
Riusa lo schema e i dati della lezione 2.

### Query SQL (esempi aggregazioni)
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

-- Media voti per materia, solo se la media e' almeno 7
SELECT m.nome AS materia, ROUND(AVG(v.voto), 2) AS media
FROM materie m
JOIN voti v ON v.materia_id = m.id
GROUP BY m.nome
HAVING AVG(v.voto) >= 7
ORDER BY media DESC;
```

### Spiegazione rapida
- Le funzioni aggregate lavorano su piu righe.
- `GROUP BY` crea gruppi (classe, studente, materia).
- `HAVING` filtra i gruppi dopo l'aggregazione.

### Esercizio
1) Conta quanti voti ha ogni studente.
2) Trova il voto minimo e massimo per ogni materia.
3) Mostra solo gli studenti con media >= 7.5.


## Conclusione
- Sai creare tabelle con vincoli e relazioni.
- Sai inserire, modificare ed eliminare dati.
- Sai interrogare il database con SELECT, JOIN e aggregazioni.
- Frase di chiusura: "La prossima volta useremo queste basi per costruire query piu complesse su database reali."
