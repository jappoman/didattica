#!/bin/bash

# Nome del file con i numeri
file="numeri.txt"

# Inizializza le variabili per somma e contatore
sum=0
count=0

# Cicla su ogni numero nel file
while read -r num; do
  # Somma il numero corrente
  sum=$((sum + num))

  # Incrementa il contatore
  count=$((count + 1))
done < "$file"

# Calcola la media
if [ "$count" -ne 0 ]; then
  average=$(echo "scale=2; $sum / $count" | bc)
  echo "La media è: $average"
else
  echo "Il file è vuoto."
fi