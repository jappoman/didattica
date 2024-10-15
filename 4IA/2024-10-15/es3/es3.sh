#!/bin/bash

# File di input
file="file.txt"

# Legge il file, converte tutto in minuscolo, sostituisce gli spazi con nuove righe e ordina le parole
cat "$file" | tr ' ' '\n' | tr 'A-Z' 'a-z' | sort | uniq -d