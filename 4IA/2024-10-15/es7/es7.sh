#!/bin/bash

# Specifica la directory da cercare
dir="/path/to/directory"

# Chiede all'utente la dimensione minima del file in KB
read -p "Inserisci la dimensione minima del file (in KB): " min_size

# Cerca e stampa i file più grandi della dimensione specificata
find "$dir" -type f -size +"${min_size}k" -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'