#!/bin/bash
#Script per sommare i numeri compresi tra 1 e 10 utilizzando un ciclo while

sum=0
i=1

while [ $i -le 10 ]; do
  sum=$((sum + i))
  i=$((i + 1))
done

echo "La somma dei numeri da 1 a 10 è: $sum"
