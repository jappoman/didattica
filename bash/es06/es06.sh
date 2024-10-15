#!/bin/bash

# Specifica la directory sorgente
src_dir="/path/to/source"

# Specifica la directory di destinazione
dest_dir="/path/to/destination"

# Estensione dei file da copiare (ad esempio, .txt)
ext=".txt"

# Cicla su tutti i file con l'estensione specificata nella directory sorgente
for file in "$src_dir"/*"$ext"; do
  # Estrae il nome del file senza il percorso
  filename=$(basename "$file")

  # Estrae la data corrente nel formato YYYY-MM-DD
  current_date=$(date +"%Y-%m-%d")

  # Copia il file nella directory di destinazione, aggiungendo la data al nome del file
  cp "$file" "$dest_dir/${filename%.txt}_$current_date.txt"
done