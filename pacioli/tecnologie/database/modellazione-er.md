## Dal problema reale allo schema ER

### Metodo in 5 mosse
- Capire il dominio: raccogliere obiettivi, regole, eccezioni.
- Estrarre le entità (sostantivi forti) e i loro attributi chiave.
- Trovare le relazioni (verbi) e individuare le cardinalità min/max.
- Se una relazione N:M ha attributi propri, trasformarla in entità-associativa.
- Verificare con esempi reali, semplificare e fissare i vincoli (obbligatorio/opzionale).

---

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
+----------+        iscrizione?        +--------+
| Studente |-------------------------->| Corso  |
+----------+                           +--------+

+---------+          tiene             +--------+
| Docente |--------------------------->| Corso  |
+---------+                            +--------+
```

### Passo 3: aggiungere attributi essenziali
Inserire gli attributi nei rettangoli; sottolineare con "=" quelli identificanti.
```
+-------------+      +------------------+      +---------------+
| Studente    |      | Corso            |      | Docente       |
+-------------+      +------------------+      +---------------+
| =matricola  |      | =codice          |      | =id_docente   |
| nome        |      | titolo           |      | nome          |
| email       |      | ore              |      | email         |
+-------------+      | aula             |      +---------------+
                     +------------------+
```

### Passo 4: trasformare la N:M in entità-associativa
Studente si iscrive a molti corsi e un corso accoglie molti studenti: relazione N:M -> entita-associativa Iscrizione con attributi propri (data, voto).
```
+----------+     (0,N)     +--------------+     (0,N)     +--------+
| Studente |<--------------| Iscrizione   |-------------->| Corso  |
+----------+               +--------------+               +--------+
                               | =id_iscrizione
                               | data_iscrizione
                               | voto_finale
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

### Checklist finale (impersonale)
- Verificare che ogni entita abbia una chiave stabile; se manca, introdurre una surrogate key.
- Controllare di aver convertito tutte le N:M in entita-associative con i loro attributi.
- Confermare che le cardinalita minime riflettano gli obblighi di business.
- Validare lo schema con esempi reali e con gli stakeholder.
