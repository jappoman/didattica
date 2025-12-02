#!/bin/bash

# Chiede il primo numero
read -p "Inserisci il primo numero: " num1

# Chiede il secondo numero
read -p "Inserisci il secondo numero: " num2

# Chiede l'operazione da eseguire
read -p "Inserisci l'operazione (+, -, *, /): " op

# Esegue l'operazione usando 'expr'
result=$(expr $num1 "$op" $num2)

# Mostra il risultato
echo "Risultato: $result"