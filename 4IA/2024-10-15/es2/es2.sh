#!/bin/bash

# Directory del progetto
project_dir="/path/to/project"

# Inizializza un contatore di righe a 0
total_lines=0

# Cicla su tutti i file .sh nella directory del progetto
for file in "$project_dir"/*.sh; do
  # Conta le righe nel file corrente
  lines_in_file=$(wc -l < "$file")

  # Aggiunge il numero di righe del file corrente al totale
  total_lines=$((total_lines + lines_in_file))
done

# Stampa il totale delle righe
echo "Totale righe di codice: $total_lines"