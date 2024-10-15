#!/bin/bash
#Script per cercare la traduzione di un termine passato da riga di comando in un dizionario (file dizion)

# Controlla se è stato passato un termine da cercare
if [ $# -ne 1 ]; then
  echo "Errore: Fornire esattamente un termine da cercare."
  exit 1
fi

termine=$1
dizionario="dizion"

# Controlla se il file dizionario esiste
if [ ! -f "$dizionario" ]; then
  echo "Errore: Il file dizionario '$dizionario' non esiste."
  exit 1
fi

# Cerca il termine nel dizionario
traduzione=$(grep -i "^$termine:" "$dizionario")

if [ -z "$traduzione" ]; then
  echo "Traduzione non trovata per il termine: $termine"
else
  echo "Traduzione trovata: $traduzione"
fi
