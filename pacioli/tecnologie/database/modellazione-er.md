# Dal problema reale allo schema ER

## Todo

1. Capire il dominio: raccogliere obiettivi, regole, eccezioni.
2. Estrarre le entità (sostantivi forti) e i loro attributi chiave.
3. Trovare le relazioni (verbi) e individuare le cardinalità min/max.
4. Se una relazione N:M ha attributi propri, trasformarla in entità-associativa.
5. Verificare con esempi reali, semplificare e fissare i vincoli (obbligatorio/opzionale).

## Esempio: gestione iscrizioni a corsi

**Requisito di partenza**: "Registrare studenti, corsi e le iscrizioni, con data di iscrizione e voto finale. Ogni corso ha un docente responsabile."

### Passo 1: individuare le entita principali

Sostantivi forti: Studente, Corso, Docente.

```
+----------+    +--------+    +---------+
| Studente |    | Corso  |    | Docente |
+----------+    +--------+    +---------+
```

### Passo 2: cogliere le relazioni base

Verbi chiave: Studente si iscrive a Corso; Docente tiene Corso.
```
+----------+   iscrizione   +--------+
| Studente |--------------->| Corso  |
+----------+                +--------+

+---------+      tiene      +--------+
| Docente |---------------->| Corso  |
+---------+                 +--------+
```

### Passo 3: aggiungere attributi essenziali

Inserire gli attributi nei rettangoli e sottolineare la chiave primaria (PK).
```
+----------------+      +-------------+      +-----------------+
| Studente       |      | Corso       |      | Docente         |
+----------------+      +-------------+      +-----------------+
| matricola (PK) |      | codice (PK) |      | id_docente (PK) |
| nome           |      | titolo      |      | nome            |
| email          |      | ore         |      | email           |
+----------------+      | aula        |      +-----------------+
                        +-------------+
```

### Passo 4: trasformare la N:M in entità-associativa

Studente si iscrive a molti corsi e un corso accoglie molti studenti: relazione N:M -> entità-associativa Iscrizione con attributi propri (data, voto).
```
+----------+     (0,N)     +--------------------+     (0,N)     +--------+
| Studente |<--------------| Iscrizione         |-------------->| Corso  |
+----------+               +--------------------+               +--------+
                           | id_iscrizione (PK) |
                           | data_iscrizione    |
                           | voto_finale        |
                           +--------------------+
```

### Passo 5: esplicitare cardinalita min/max e obbligatorieta

Annotare min-max vicino ai lati; aggiungere il vincolo "ogni corso ha 1 docente" (1,1).
```
+----------+   (0,N)   +--------------+   (0,N)   +--------+
| Studente |<----------| Iscrizione   |---------->| Corso  |
+----------+           +--------------+           +--------+
    (1,1) ins. in                              tenuto da (1,1)

          +---------+    (1,1)      (1,1)    +--------+
          | Docente |----------------------->| Corso  |
          +---------+                        +--------+
```

Interpretazione:

- Considerare che uno studente puo avere 0 o molte iscrizioni (0,N), mentre ogni iscrizione deve riferirsi a 1 studente (1,1).
- Considerare che un corso puo avere 0 o molte iscrizioni (0,N), mentre ogni iscrizione deve riferirsi a 1 corso (1,1).
- Richiedere che ogni corso abbia esattamente un docente responsabile (1,1 sul lato Corso); un docente puo tenere piu corsi (0,N).

### Passo 6: verificare con esempi reali e aggiustare

Prendere un caso concreto (es. "Studente X si iscrive a Basi di Dati il 3/10, docente Rossi, voto 28") e inserirlo nello schema. Se emerge un attributo mancante (es. stato iscrizione) o un vincolo aggiuntivo (es. limite massimo iscritti), integrarlo ora.

## Dal modello ER al modello relazionale

Tre regole base per la traduzione:

- ogni entita diventa una tabella con le sue colonne;
- ogni relazione N:M diventa una tabella propria con le due chiavi esterne (e gli eventuali attributi della relazione);
- nelle relazioni 1:N, la chiave della parte 1 va come chiave esterna nella parte N.

### Esempio Studente–Corso–Docente–Iscrizione

- Entita -> tabelle: `Studente(matricola PK, nome, email)`, `Corso(codice PK, titolo, ore, aula, docente_fk)`, `Docente(id_docente PK, nome, email)`.
- Relazione 1:N "Docente tiene Corso": `docente_fk` in `Corso`, con `docente_fk` NOT NULL se ogni corso deve avere un docente.
- Relazione N:M "Studente si iscrive a Corso" con attributi: diventa tabella `Iscrizione(id PK, matricola_fk FK, corso_fk FK, data, voto)`.
- Cardinalita e obbligatorieta si riflettono sui vincoli: se uno studente deve avere almeno un corso, `matricola_fk` in `Iscrizione` e `corso_fk` sono NOT NULL; se il voto e facoltativo, `voto` puo essere NULL.

Schema finale in tabelle (con chiavi):
```
Studente(matricola PK, nome, email UNIQUE)
Docente(id_docente PK, nome, email UNIQUE)
Corso(codice PK, titolo, ore, aula, docente_fk FK->Docente.id_docente NOT NULL)
Iscrizione(id PK, matricola_fk FK->Studente.matricola NOT NULL,
           corso_fk FK->Corso.codice NOT NULL, data NOT NULL, voto)
-- vincoli extra consigliati: UNIQUE(matricola_fk, corso_fk) per evitare doppie iscrizioni dello stesso studente allo stesso corso (vincolo logico)
```

## Chiavi naturali vs surrogate key

- Chiave naturale: esiste gia nel mondo reale, e unica e stabile (es. matricola studente, email, codice corso).
- Surrogate key: aggiunta artificiale, spesso `id` numerico o UUID, pensata solo per identificare (es. `id_iscrizione`).

Quando scegliere:

- usa chiave naturale se e stabile, breve e non cambia nel tempo (es. `matricola` come PK di Studente);
- usa surrogate key se l'identificatore reale puo cambiare, non esiste o e lungo/complesso (es. `id` su Iscrizione, `id_docente` se non hai un codice ufficiale);
- quando hai dubbi, usa una surrogate key per semplificare relazioni e aggiornamenti.

## Notazioni grafiche ER

- Chen: entita = rettangoli, relazioni = rombi, attributi = ovali. Buona per spiegare concetti e vedere gli attributi separati.
- Crow's Foot: entita = rettangoli, relazioni = linee con piedi di corvo per le cardinalita. Dominante nei tool moderni (Draw.io, MySQL Workbench, Lucidchart) e piu compatta per la progettazione fisica.

Esempio Chen (testuale):
```
[Studente] --(iscrizione)--> <Iscrizione> <--(iscrizione)-- [Corso]
    |matricola                           |id_iscrizione
    |nome                                |data, voto
```

Esempio Crow's Foot (ASCII):
```
Studente |------< Iscrizione >------| Corso
           \                        ^
            \ (1,N)                 |(1,1)
             \------| Docente
Legenda: "|" = uno, "<" = molti, "o" = opzionale
```

Lettura: linea singola = uno, piede a tre punte "<" = molti, cerchio "o" = opzionale. Scegli Chen per spiegazioni introduttive, Crow's Foot per progettare velocemente o usare software.

### Schema finale riassunto (ASCII compatto)

```
   (0,N)                                (0,N)
Studente <--------- Iscrizione --------> Corso
 (1,1)                  | (1,1)           ^
                        |                 |
                        v             (1,1)|(0,N)
                     Docente --------------+
```

Legenda:

- Cardinalita min,max annotate tra parentesi vicino ai lati.
- Entita-associativa usata per la N:M con attributi propri.
- Frecce opzionali usate solo per rendere leggibile "tenuto da".

### Checklist finale

- Verificare che ogni entità abbia una chiave primaria; se manca, introdurre una surrogate key (specialmente se si hanno dubbi).
- Controllare di aver convertito tutte le N:M in entità-associative e di aver trasferito correttamente le chiavi esterne nelle 1:N.
- Confermare che i vincoli (NOT NULL, UNIQUE) riflettano obbligatorietà e univocità.