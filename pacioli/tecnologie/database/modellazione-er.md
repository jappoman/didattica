# La modellazione ER

## Dal problema reale allo schema ER

Esempio: gestione iscrizioni a corsi.

Registrare studenti, corsi e le iscrizioni, con data di iscrizione e voto finale. Ogni corso ha un docente responsabile.

### Glossario rapido

- Dominio: l'ambito del problema che stai modellando (qui: gestione iscrizioni a corsi).
- ER (Entity-Relationship): schema concettuale con entità (cose) e relazioni (legami). Si fa prima di tradurre tutto in tabelle relazionali nel db vero e proprio.
- Entità: oggetti/concetti chiave del dominio (es. Studente, Corso).
- Relazione: legame tra entità (es. Studente si iscrive a Corso).
- Cardinalita: indicano quante volte una entità puo essere collegata all'altra. Tre casi base:
  - 1:1 = al massimo uno con uno (es. persona-passaporto).
  - 1:N = uno puo collegarsi a molti, ogni elemento dei molti torna a uno (es. docente-corso).
  - N:M = molti con molti (es. studente-corso): si risolve con una entità associativa che tiene le due chiavi esterne.
  - Se vedi (0,...) il legame e opzionale; se vedi (1,...) e obbligatorio.
- Entità associativa: nuova entità nata da una relazione N:M per contenere le due chiavi esterne e i suoi attributi.
- PK (Primary Key): identificatore univoco e obbligatorio di una entità.
- FK (Foreign Key): chiave esterna che punta alla PK di un'altra tabella.
- NOT NULL: valore obbligatorio;
- Chiave naturale: identificatore già esistente nel mondo reale (matricola, email, codice corso).
- Surrogate key: identificatore artificiale (es. `id` numerico o UUID, stringa lunga univoca) usato solo per identificare.

### Todo

0. Capire bene il dominio che si sta trattando.
1. Estrarre le entità (sostantivi forti) e i loro attributi chiave.
2. Trovare le relazioni (verbi).
3. Aggiungere attributi essenziali alle entità individuate.
4. Se una relazione N:M (molti-a-molti) ha attributi propri, trasformarla in entità associativa.
5. Esplicitare cardinalita min/max e obbligatorietà.
6. Verificare con esempi reali, semplificare e fissare i vincoli (obbligatorio/opzionale).

#### Passo 1: individuare le entità principali

Sostantivi forti: Studente, Corso, Docente.

Nota: le frecce servono solo a leggere il verso del verbo; la relazione non e orientata.

```plain
+----------+    +--------+    +---------+
| Studente |    | Corso  |    | Docente |
+----------+    +--------+    +---------+
```

#### Passo 2: cogliere le relazioni base

Verbi chiave: Studente si iscrive a Corso; Docente tiene Corso.
Cardinalita min/max: (0,N) significa da zero a molti (opzionale), (1,1) significa esattamente uno (obbligatorio).

```plain
+----------+   iscrizione   +--------+
| Studente |--------------->| Corso  |
+----------+                +--------+

+---------+      tiene      +--------+
| Docente |---------------->| Corso  |
+---------+                 +--------+
```

#### Passo 3: aggiungere attributi essenziali

Inserire gli attributi nei rettangoli e sottolineare la chiave primaria (PK = Primary Key, identificatore univoco e obbligatorio dell'entità).

```plain
+----------------+      +-------------+      +-----------------+
| Studente       |      | Corso       |      | Docente         |
+----------------+      +-------------+      +-----------------+
| matricola (PK) |      | codice (PK) |      | id_docente (PK) |
| nome           |      | titolo      |      | nome            |
| email          |      | ore         |      | email           |
+----------------+      | aula        |      +-----------------+
                        +-------------+
```

#### Passo 4: trasformare la N:M in entità associativa

Studente si iscrive a molti corsi e un corso accoglie molti studenti: relazione N:M (molti-a-molti) -> entità associativa "Iscrizione" con attributi propri (data, voto). Una entità associativa e una nuova entità nata dalla relazione per contenere le due chiavi esterne e i suoi attributi. È possibile utilizzare anche una chiave primaria composta dalle due chiavi esterne, ma in questo esempio useremo una surrogate key `id_iscrizione`.

Cardinalità in figura: (0,N) sul lato Studente significa che uno studente puo avere zero o molte iscrizioni; (0,N) sul lato Corso significa che un corso può avere zero o molte iscrizioni; ogni riga di Iscrizione invece punta a 1 studente e 1 corso (grazie alle due FK).

```plain
+----------+     (0,N)     +-------------------------+     (0,N)     +--------+
| Studente |---------------| Iscrizione              |---------------| Corso  |
+----------+               +-------------------------+               +--------+
                           | id_iscrizione (PK)      |
                           | matricola_studente (FK) |
                           | codice_corso  (FK)      |
                           | data_iscrizione         |
                           | voto_finale             |
                           +-------------------------+
```

#### Passo 5: esplicitare cardinalita min/max e obbligatorieta

Annotare min-max vicino ai lati; aggiungere il vincolo "ogni corso ha 1 docente" (1,1).

```plain
+----------+ (0,N)     +--------------+     (0,N) +--------+ (1,1)     +---------+
| Studente |-----------| Iscrizione   |-----------| Corso  |-----------| Docente |
+----------+     (1,1) +--------------+ (1,1)     +--------+     (0,N) +---------+

```

Interpretazione:

- Uno studente può avere zero oppure molte iscrizioni (0,N), mentre ogni iscrizione deve riferirsi obbligatoriamente a un solo studente (1,1).
- Un corso può avere zero oppure molte iscrizioni (0,N), mentre ogni iscrizione deve riferirsi obbligatoriamente a un solo corso (1,1).
- Ogni corso deve avere esattamente un docente responsabile (1,1 sul lato Corso), mentre un docente può tenere zero oppure molti corsi (0,N).

#### Passo 6: verificare con esempi reali e aggiustare

Prendere un caso concreto (es. "Studente X si iscrive a Basi di Dati il 3/10, docente Rossi, voto 28) e inserirlo nello schema. Se emerge un attributo mancante (es. stato iscrizione) o un vincolo aggiuntivo (es. limite massimo iscritti), integrarlo ora.

## Dal modello ER al modello relazionale

Tre regole base per la traduzione:

- ogni entità diventa una tabella con le sue colonne;
- ogni relazione N:M diventa una tabella propria con le due chiavi esterne (e gli eventuali attributi della relazione);
- nelle relazioni 1:N, la chiave della parte 1 va come chiave esterna nella parte N.

### Esempio Studente–Corso–Docente–Iscrizione

- Entità -> tabelle: `Studente(matricola PK, nome, email)`, `Corso(codice PK, titolo, ore, aula, docente_fk)`, `Docente(id_docente PK, nome, email)`.
- Relazione 1:N "Docente tiene Corso": `docente_fk` in `Corso`, con `docente_fk` NOT NULL se ogni corso deve avere un docente.
- Relazione N:M "Studente si iscrive a Corso" con attributi: diventa tabella `Iscrizione(id PK, matricola_fk FK, corso_fk FK, data, voto)`.
- Cardinalita: indicano quante volte una entità puo essere collegata all'altra. Tre casi base:
  - 1:1 = al massimo uno con uno (es. persona-passaporto).
  - 1:N = uno puo collegarsi a molti, ogni elemento dei molti torna a uno (es. docente-corso).
  - N:M = molti con molti (es. studente-corso): si risolve con una entità associativa che tiene le due chiavi esterne.
  - Se vedi (0,...) il legame e opzionale; se vedi (1,...) e obbligatorio.
- entità associativa: nuova entità nata da una relazione N:M per contenere le due chiavi esterne e i suoi attributi.
- PK (Primary Key): identificatore univoco e obbligatorio di una entità.
- FK (Foreign Key): chiave esterna che punta alla PK di un'altra tabella.
- NOT NULL: valore obbligatorio;
- Chiave naturale: identificatore già esistente nel mondo reale (matricola, email, codice corso).
- Surrogate key: identificatore artificiale (es. `id` numerico o UUID, stringa lunga univoca) usato solo per identificare.

### Schema finale in tabelle (con chiavi):

```plain
Studente(matricola PK, nome, email UNIQUE)
Docente(id_docente PK, nome, email UNIQUE)
Corso(codice PK, titolo, ore, aula, docente_fk FK->Docente.id_docente NOT NULL)
Iscrizione(id PK, matricola_fk FK->Studente.matricola NOT NULL,
           corso_fk FK->Corso.codice NOT NULL, data NOT NULL, voto)
-- vincoli extra consigliati: UNIQUE(matricola_fk, corso_fk) per evitare doppie iscrizioni dello stesso studente allo stesso corso (vincolo logico)
```

### Checklist finale

- Verificare che ogni entità abbia una chiave primaria; se manca, introdurre una surrogate key (specialmente se si hanno dubbi).
- Controllare di aver convertito tutte le N:M in entità-associative e di aver trasferito correttamente le chiavi esterne nelle 1:N.
- Confermare che i vincoli (NOT NULL, UNIQUE) riflettano obbligatorietà e univocità.
