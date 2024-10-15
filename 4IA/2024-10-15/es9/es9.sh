#!/bin/bash

# Directory sorgente e destinazione
src_dir="/path/to/source"
dest_dir="/path/to/destination"

# Chiede all'utente quanti giorni controllare
read -p "Inserisci il numero di giorni: " days

# Usa 'find' per cercare i file modificati negli ultimi N giorni e copiarli
find "$src_dir" -type f -mtime -$days -exec cp {} "$dest_dir" \;

echo "File copiati con successo."