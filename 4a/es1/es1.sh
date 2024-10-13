#!/bin/bash
#Script che riceve due numeri dalla riga di comando e calcola la divisione se è possibile

# Controlla se sono stati passati esattamente due argomenti
if [ $# -ne 2 ]; then
  echo "Errore: Fornire esattamente due numeri."
  exit 1
fi

# Verifica che entrambi gli argomenti siano numeri
if ! [[ "$1" =~ ^-?[0-9]+$ && "$2" =~ ^-?[0-9]+$ ]]; then
  echo "Errore: Entrambi gli argomenti devono essere numeri interi."
  exit 1
fi

num1=$1
num2=$2

# Controllo per la divisione per zero
if [ "$num2" -eq 0 ]; then
  echo "Errore: Divisione per zero non possibile."
  exit 1
fi

# Calcolo della divisione
result=$(echo "scale=2; $num1 / $num2" | bc)
echo "Risultato della divisione: $result"
