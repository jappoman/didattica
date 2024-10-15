#!/bin/bash
#Script per aggiungere un commento "Autore: nome" specificato da riga di comando all'inizio di tutti i file .c

# Controlla se è stato passato il nome dell'autore
if [ $# -ne 1 ]; then
  echo "Errore: Fornire esattamente il nome dell'autore."
  exit 1
fi

autore=$1

# Trova tutti i file .c nella directory corrente
for file in *.c; do
  # Controlla se il file esiste
  if [ -f "$file" ]; then
    # Aggiunge il commento "Autore: nome" all'inizio del file
    sed -i "1i/* Autore: $autore */" "$file"
    echo "Aggiunto commento in $file"
  fi
done