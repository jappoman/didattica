# Laboratorio SQL - PostgreSQL

## Prima di iniziare
SQL (Structured Query Language) è il linguaggio con cui parliamo con il database. Con SQL possiamo creare tabelle, inserire dati, modificarli e interrogarli: possiamo fare quindi tutti i tipi di transazioni che servono in un'applicazione. Generalmente è l'applicazione che utilizza SQL per gestire il database, ma è importante sapere come funziona per progettare e ottimizzare le operazioni.

## Dove scrivere il codice SQL
Lavoreremo online con DB Fiddle per evitare installazioni: useremo https://www.db-fiddle.com/ con database di tipo **PostgreSQL**. L'interfaccia di DB Fiddle ha due sezioni principali:
- **Schema SQL**: qui vanno scritti i comandi per creare le tabelle e inserire i dati iniziali.
- **Query SQL**: qui si scrivono le query da eseguire (SELECT, UPDATE, DELETE, ecc.).

In alto ci sono due pulsanti importanti:
- **Run**: esegue quello che è stato scritto (sia Schema SQL che Query SQL) e mostra il risultato.
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
- Le date si scrivono nel formato `AAAA-MM-GG`, ad esempio `'2008-02-10'`.
- I nomi di tabelle e colonne non vanno tra apici.
- Le parole chiave SQL (come `SELECT`, `FROM`, `WHERE`, ecc.) sono case-insensitive, ma si usano spesso in maiuscolo per chiarezza.
- I commenti si scrivono con `--` per commenti su una riga.

# Lezione 1 - Il DDL e la prima query
## Il DDL: creare la struttura del database
DDL significa **Data Definition Language**. È un insieme di comandi SQL che definiscono la struttura del database: tabelle, colonne, tipi di dato e regole e relazioni. E' come disegnare l'architettura di una casa prima di arredarla. Non comprende le query per manipolare i dati (quelle verranno identificate come DML, Data Manipulation Language).

## Tipi di dato di base
- **SERIAL**: intero auto-incrementale (ottimo per le PK).
- **INT**: numero intero.
- **VARCHAR(n)**: testo con un massimo di n caratteri.
- **DATE**: data (anno-mese-giorno).
- **BOOLEAN**: vero/falso.
- **TIME**: orario (ore:minuti:secondi).
- **TIMESTAMP**: data e orario insieme.
- **NUMERIC(3,1)**: numero con decimali controllati (es. 7.5).

## Vincoli piu usati
- **NOT NULL**: il campo non puo essere vuoto.
- **UNIQUE**: il valore non si puo ripetere.
- **CHECK**: il valore deve rispettare una condizione (es. tra 1 e 10).

## Esempio di schema SQL (da incollare nella parte Schema SQL in DB Fiddle)
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

## Cosa succede qui dentro
Questo schema rappresenta un database per gestire le classi, gli studenti, le materie e i voti in una scuola. Le tabelle sono:
- `classi` è una tabella che contiene le classi, con anno e sezione.
- `studenti` tabella contenente gli studenti, collegati a `classi` tramite `classe_id` (relazione con cardinalità molti-a-uno).
- `materie` contiene le materie scolastiche.
- `voti` collega studenti e materie con un voto e una data (relazione molti-a-molti che si appoggia a questa tabella intermedia).

## Una semplice query di prova
Questo è il codice di una query (interrogazione) che mostra tutti gli studenti con il loro nome, cognome e data di nascita:
```sql
SELECT nome, cognome, data_nascita
FROM studenti;
```
Il suo risultato è vuoto per ora, perché non abbiamo ancora inserito dati. Per inserire i dati, utilizziamo una DML di prova:
```sql
INSERT INTO studenti (nome, cognome, data_nascita, classe_id)
VALUES ('Mario', 'Rossi', '2008-02-10', 1);
```

## Esercizio
1) Aggiungi una tabella `docenti` con: id, nome, cognome, email (unica).
2) Verifica che lo schema sia corretto eseguendo il codice in DB Fiddle.
3) Esegui la query SELECT di prova per vedere il risultato prima e dopo aver eseguito la query DML(dovrebbe essere vuoto per ora).

# Lezione 2 - Inserimento e modifica dati (DML)

## Perche ci serve il DML
DML significa **Data Manipulation Language**. Sono i comandi con cui inseriamo, modifichiamo ed eliminiamo i dati. Dopo aver creato le tabelle, dobbiamo riempirle.

## Comandi principali
- `INSERT`: aggiunge nuove righe.
- `UPDATE`: modifica righe esistenti.
- `DELETE`: elimina righe.

## Condizione WHERE
Il `WHERE` serve per specificare quali righe sono interessate dai comandi che utilizziamo. Nella `SELECT`, il `WHERE` filtra i risultati. In `UPDATE` e `DELETE`, il `WHERE` indica quali righe modificare o eliminare.

Attenzione: senza condizioni `WHERE`, `UPDATE` e `DELETE` agiscono su tutte le righe della tabella! Ad esempio, `DELETE FROM studenti;` elimina tutti gli studenti.

## Schema SQL (creazione + dati iniziali)
```sql
-- Copia e incolla tutto questo nella sezione Schema SQL di DB Fiddle
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

## Query SQL (esempi DML)
### Inserimento di un nuovo studente
```sql
-- Verifica tutti gli studenti
SELECT * FROM studenti;

-- Inserisci un nuovo studente
INSERT INTO studenti (nome, cognome, data_nascita, classe_id)
VALUES ('Anna', 'Neri', '2008-09-05', 2);

-- Ora verifica di nuovo tutti gli studenti
--(lascia scritta anche la query precedente in modo da eseguirla di nuovo al nuovo Run)
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
-- (attenzione: se e' usata nei voti, il DB stesso darà un errore)
DELETE FROM materie
WHERE nome = 'Italiano';
```

## Sintassi dei comandi
- `INSERT` INTO `nome_tabella` (colonna1, colonna2, ...)
  VALUES (valore1, valore2, ...);
- `UPDATE` `nome_tabella`
  SET colonna1 = valore1, colonna2 = valore2, ...
  WHERE condizione;
- `DELETE` FROM `nome_tabella`
  WHERE condizione;

## Sinstassi delle condizioni WHERE
- `colonna = valore`: uguale a.
- `colonna <> valore`: diverso da.
- `colonna > valore`: maggiore di.
- `colonna < valore`: minore di.
- `colonna BETWEEN valore1 AND valore2`: compreso tra valore1 e valore2.
- `colonna IS NULL`: valore nullo.
- `colonna IS NOT NULL`: valore non nullo.

## Esercizio
1) Aggiungi una nuova classe 4A e un nuovo studente in quella classe (stampa la tabella delle classi per ottenere l'id corretto).
2) Aggiorna la data di nascita di uno studente.
3) Elimina il voto di uno studente in Informatica (stampa la tabella degli studenti e la tabella materie per ottenere gli id corretti).

# Lezione 3 - SELECT base

## Perche ci serve SELECT
Con `SELECT` leggiamo i dati. E' il comando piu usato: serve per vedere cosa c'e nel database e per rispondere a domande.

## Parti principali di una SELECT
- `SELECT`: quali colonne vuoi vedere.
- `FROM`: da quale tabella.
- `WHERE`: quali righe ti interessano.
- `ORDER BY`: come ordinare il risultato.

## Operatori utili
- `=` uguale, `<>` diverso.
- `>` maggiore, `<` minore.
- `AND` per condizioni multiple, `OR` per alternative.
- `LIKE` per cercare testo con pattern (es. `LIKE 'Mar%'`).

## Query SQL (esempi SELECT)
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


# Lezione 4 - JOIN e filtri

## Perche ci serve la JOIN
I dati spesso sono distribuiti in piu tabelle. Con la `JOIN` uniamo informazioni correlate. E' come collegare due elenchi usando una chiave comune.

## Come si collega
Nel nostro schema:
- `studenti.classe_id` punta a `classi.id`.
- `voti.studente_id` punta a `studenti.id`.
- `voti.materia_id` punta a `materie.id`.

Usiamo spesso delle abbreviazioni (alias) per scrivere piu veloce:
- `studenti s`
- `classi c`
- `voti v`
- `materie m`

## Query SQL (esempi JOIN)
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
1) Mostra nome, cognome e classe di tutti gli studenti della 3B.
2) Mostra tutti i voti di uno studente a scelta (nome e cognome).
3) Mostra le materie in cui compare almeno un voto maggiore o uguale a 8.


# Lezione 5 - Aggregazioni

## Perche ci servono le aggregazioni
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

-- Media voti per materia, solo se la media e' almeno 7
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
Ora sai creare tabelle con vincoli e relazioni, inserire e modificare dati, e interrogare un database con SELECT, JOIN e aggregazioni. La prossima volta useremo queste basi per costruire query piu complesse su database reali.
