#!/bin/bash

# Imposta la soglia di avviso (es. 80%)
threshold=80

# Recupera l'uso corrente del disco (in %)
disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Controlla se l'uso del disco supera la soglia
if [ "$disk_usage" -gt "$threshold" ]; then
  echo "Attenzione: lo spazio su disco ha superato il ${threshold}%!"
else
  echo "Lo spazio su disco è sotto controllo."
fi