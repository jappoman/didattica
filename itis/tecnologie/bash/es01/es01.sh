#!/bin/bash
#Script che riceve due numeri dalla riga di comando e calcola la divisione se è possibile

# Controlla se sono stati passati esattamente due argomenti
if [ $# -ne 2 ]; then
  echo "Errore: Fornire esattamente due numeri."
  exit 1
fi

# Verifica che entrambi gli argomenti siano numeri
if ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo "Errore: Il primo argomento non è un numero."
  exit 1
fi

if ! [[ $2 =~ ^[0-9]+$ ]]; then
  echo "Errore: Il secondo argomento non è un numero."
  exit 1
fi

# Assegna i valori dei due argomenti alle variabili
num1=$1
num2=$2

# Controllo per la divisione per zero
if [ "$num2" -eq 0 ]; then
  echo "Errore: Divisione per zero non possibile."
  exit 1
fi

# Effetti la divisione
echo "Il risultato della divisione è: $((num1 / num2))"
exit 0

# Spiegazione espressione regolare:
# =~ : in Bash questo simbolo viene utilizzato all'interno di un'istruzione condizionale per verificare se una stringa
  # corrisponde a un'espressione regolare (regex). È parte del costrutto [[ ... ]], che viene utilizzato per testare condizioni in Bash.
# ^: Questo simbolo è l'ancora dell'inizio della stringa. Indica che la corrispondenza deve iniziare dall'inizio della stringa.
# [0-9]: Questo è un range di caratteri. In questo caso, [0-9] corrisponde a qualsiasi cifra compresa tra 0 e 9.
  # Quindi, si sta cercando una sequenza di numeri interi positivi.
# +: Questo è un quantificatore. Indica che l'elemento precedente (in questo caso, il range [0-9]) deve apparire una o più volte.
  # Quindi, la regex richiede che ci sia almeno una cifra nella stringa.
# $: Questo simbolo è l'ancora di fine stringa. Indica che la corrispondenza deve finire alla fine della stringa.

# In sintesi, l'espressione ^[0-9]+$ verifica che l'intera stringa contenga solo numeri (cifre da 0 a 9) e che sia composta da una o più cifre.
  # Se la stringa contiene qualunque altro carattere o è vuota, la regex non corrisponderà.
# La regex ^[0-9]+$ viene utilizzata per controllare se i due argomenti passati allo script sono numeri interi positivi.
# Se il primo argomento non corrisponde alla regex, lo script restituisce un errore specificando che non è un numero.
# Lo stesso controllo viene fatto per il secondo argomento.

# Ecco alcune espressioni regolari (regex) utili:
  # Carattere alfabetico (a-z o A-Z):
  # ^[a-zA-Z]$
  # Questa regex verifica che la stringa contenga esattamente un singolo carattere alfabetico maiuscolo o minuscolo.

  # Carattere numerico (0-9):
  # ^[0-9]$
  # Questa regex verifica che la stringa contenga esattamente un singolo numero (una cifra da 0 a 9).

  # Parola alfabetica (combinazione di lettere):
  # ^[a-zA-Z]+$
  # Questa regex verifica che la stringa contenga solo caratteri alfabetici (lettere maiuscole o minuscole) e che sia composta da uno o più caratteri.

  # Parola numerica (combinazione di numeri):
  # ^[0-9]+$
  # Questa regex verifica che la stringa contenga solo numeri (cifre da 0 a 9) e che sia composta da uno o più numeri.

  # Parola alfanumerica (combinazione di lettere e numeri):
  # ^[a-zA-Z0-9]+$
  # Questa regex verifica che la stringa contenga solo caratteri alfanumerici (lettere maiuscole o minuscole e numeri) e che sia composta da uno o più caratteri.
