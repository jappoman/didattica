#!/bin/bash
#Script per cercare la traduzione di un termine passato da riga di comando in un dizionario (file dizion)

# Controlla se è stato passato un termine da cercare
if [ $# -ne 1 ]; then
  echo "Errore: Fornire esattamente un termine da cercare."
  exit 1
fi

termine=$1
dizionario="dizion"

# Questo controlla se il file specificato non esiste.
# Il -f verifica se il file è un file regolare (non una directory, ad esempio).
# Il simbolo ! nega il test, quindi controlla se il file non esiste.
if [ ! -f "$dizionario" ]; then
  echo "Errore: Il file dizionario '$dizionario' non esiste."
  exit 1
fi

# Cerca il termine nel dizionario
traduzione=$(grep -i "^$termine:" "$dizionario")
# traduzione=$(...): Questo assegna il risultato del comando tra parentesi alla variabile traduzione.
# grep -i "^$termine:" "$dizionario": grep è un comando che cerca corrispondenze di una stringa in un file.
# -i indica che la ricerca non fa distinzione tra maiuscole e minuscole (case-insensitive).
# "^$termine:": La parte ^$termine: è un'espressione regolare che cerca le righe nel file che iniziano con il termine (^ indica l'inizio della riga) seguito da un :.
  # Questo è utile se il file dizionario ha un formato simile a parola:traduzione, assicurandosi di trovare esattamente il termine che cerchi, evitando corrispondenze parziali.
# "$dizionario" è il nome del file in cui stai cercando il termine.

if [ -z "$traduzione" ]; then
  echo "Traduzione non trovata per il termine: $termine"
else
  echo "Traduzione trovata: $traduzione"
fi
# if [ -z "$traduzione" ]: Il test -z controlla se la variabile traduzione è vuota (cioè non è stata trovata una corrispondenza). Se è vuota, si esegue il blocco then.
  # Se non è stata trovata una traduzione (quindi traduzione è vuota), stampa il messaggio "Traduzione non trovata".
  # Se invece è stata trovata una traduzione (quindi traduzione contiene il risultato della ricerca), stampa il messaggio "Traduzione trovata" seguito dalla traduzione trovata.
