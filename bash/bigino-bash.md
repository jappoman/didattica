# Bigino Riassuntivo di Bash

## Condizioni (if, else, elif)
Le condizioni permettono di eseguire blocchi di codice solo se certe condizioni sono vere. Sintassi di base:

```bash
if [ condizione ]; then
  # Codice se la condizione è vera
elif [ altra_condizione ]; then
  # Codice se l'altra condizione è vera
else
  # Codice se nessuna condizione è vera
fi
```

### Operatori di confronto numerico:
- ```-eq```: Verifica se due numeri sono uguali.
- ```-ne```: Verifica se due numeri sono diversi.
- ```-lt```: Verifica se il primo numero è minore del secondo.
- ```-le```: Verifica se il primo numero è minore o uguale al secondo.
- ```-gt```: Verifica se il primo un numero è maggiore del secondo.
- ```-ge```: Verifica se il primo numero è maggiore o uguale al secondo.

Esempio:
```bash
if [ "$num1" -lt "$num2" ]; then
  echo "$num1 è minore di $num2"
elif [ "$num1" -gt "$num2" ]; then
  echo "$num1 è maggiore di $num2"
else
  echo "I numeri sono uguali"
fi
```

### Operatori di confronto stringhe:
- ```=```: Verifica se due stringhe sono uguali.
- ```!=```: Verifica se due stringhe sono diverse.

Esempio:
```bash
if [ "$str1" = "$str2" ]; then
  echo "Le stringhe sono uguali"
elif [ -z "$str1" ]; then
  echo "La prima stringa è vuota"
else
  echo "Le stringhe sono diverse"
fi
```

### Controllo di file o directory
- ```-e```: Verifica se un file o directory esiste.
- ```-f```: Verifica se esiste un file regolare (non una directory).
- ```-d```: Verifica se esiste una directory.
- ```-r```: Verifica se un file è leggibile.
- ```-w```: Verifica se un file è scrivibile.
- ```-x```: Verifica se un file è eseguibile.

Esempio:
```bash
if [ -f "file.txt" ]; then
  echo "Il file esiste ed è un file regolare."
else
  echo "Il file non esiste o non è un file regolare."
fi
```

## Uso delle parentesi quadre [ ] e doppie parentesi (( ))
Le parentesi quadre ```[ ]``` sono utilizzate per i confronti, mentre le doppie parentesi ```(( ))``` sono utilizzate per le espressioni aritmetiche e alcuni confronti.

### Parentesi quadre [ ]
Utilizzate per confronti di stringhe o numerici. Sintassi di base:

```bash
if [ condizione ]; then
  # Codice
fi
```
Esempio:
```bash
if [ "$num1" -gt "$num2" ]; then
  echo "Il primo numero è maggiore del secondo."
fi
```

### Doppie parentesi (( ))
Utilizzate per espressioni aritmetiche e confronti numerici più semplici, che non richiedono operatori come ```-gt```, ```-lt```. Sintassi di base:

```bash
if (( condizione )); then
  # Codice
fi
```
Esempi:
```bash
if (( num1 > num2 )); then
  echo "Il primo numero è maggiore del secondo."
fi
```
```bash
sum=$((a + b))  # Operazioni aritmetiche
```

#### Vantaggi di (( )):
- Non è necessario utilizzare operatori come ```-gt```, ```-lt```, ecc.
- Più leggibile per operazioni aritmetiche.


## Ciclo for
Il ciclo for permette di iterare su una lista di elementi o su una sequenza numerica. Sintassi di base:

```bash
for var in lista_di_elementi; do
  # Codice da eseguire per ogni elemento
done
```
Uso alternativo: Il ciclo for può essere utilizzato anche per iterare su un range numerico:
```bash
for i in {1..10}; do
  echo "Iterazione numero $i"
done
```
In alternativa, è possibile utilizzare un ciclo for con seq per specificare una sequenza personalizzata di valori:

```bash
for i in $(seq 1 2 10); do
  echo "Valore: $i"
done
```

### Iterare su una lista di file (esempio: tutti i file che hanno estensione "*.c")

Il pattern ```*.c``` è un metacarattere (wildcard) che Bash espande automaticamente per creare una lista di tutti i file nella directory corrente che hanno l'estensione ".c". Questo processo è noto come espansione di pathname.
Esempio:
```bash
for file in *.c; do
  if [ -e "$file" ]; then
    echo "Trovato file: $file"
  else
    echo "Nessun file con estensione .c trovato"
  fi
done
```
Bash traduce ```*.c``` in una lista di tutti i file con estensione ".c". Se non ci sono file con quell'estensione, il ciclo verrà eseguito una volta con il valore letterale "*.c" (quindi meglio controllare l'esistenza dei file).

## Ciclo while
Esegue un blocco di codice finché la condizione è vera. Sintassi di base:
```bash
while [ condizione ]; do
  # Codice da eseguire
done
```
Esempio:
```bash
i=1
sum=0
while [ $i -le 10 ]; do
  sum=$((sum + i))
  i=$((i + 1))
done
echo "La somma è: $sum"
```
Il codice dell'esempio viene eseguito finché il valore di ```$i``` è minore o uguale a 10. Ad ogni iterazione, il valore di ```$sum``` viene incrementato di ```$i``` e il valore di ```$i``` viene incrementato di 1. Quindi questo codice somma i numeri da 1 a 10.

## Lettura da input (read)
Permette di ricevere input dall'utente. Sintassi di base:
```bash
read -p "Inserisci un valore: " variabile
```
Opzioni:
- ```-p "testo"```: Mostra un messaggio prima di chiedere l'input.
- ```-s```: Nasconde l'input (utile per password).
- ```-n N```: Legge solo N caratteri dall'input.
- ```-t N```: Limita il tempo di attesa per l'input a N secondi.

## Lettura di argomenti da riga di comando ($#, $1, $2, ecc.)

Permette di accedere agli argomenti passati quando viene eseguito lo script.

    Opzioni comuni:
        $#: Numero di argomenti passati.
        $1, $2, ecc.: Argomenti in ordine.
        $@: Tutti gli argomenti passati.
        $?: Codice di uscita dell'ultimo comando eseguito.

## Spostare file o directory (mv)

Il comando mv permette di spostare o rinominare file e directory.

    Sintassi di base:

    bash

mv origine destinazione

Opzioni:

    -i: Chiede conferma prima di sovrascrivere un file esistente.
    -n: Non sovrascrivere mai i file esistenti.
    -v: Mostra ogni operazione effettuata.

Esempio:

bash

    mv file.txt /percorso/destinazione/
    mv file.txt nuovo_nome.txt    # Rinomina il file

## Contare le righe di un file (wc -l)

Il comando wc (word count) con l'opzione -l conta il numero di righe in un file.

    Sintassi di base:

    bash

wc -l file

Esempio:

bash

    righe=$(wc -l < file.txt)
    echo "Il file ha $righe righe."

    Opzioni aggiuntive di wc:
        -w: Conta le parole.
        -c: Conta i byte.
        -m: Conta i caratteri.

## Comando grep per cercare parole o pattern

Il comando grep permette di cercare stringhe o espressioni regolari in un file.

    Opzioni avanzate:
        -i: Ignora maiuscole e minuscole.
        -r: Cerca ricorsivamente in tutte le sottodirectory.
        -v: Inverte la ricerca, mostrando le righe che non corrispondono al pattern.
        -n: Mostra i numeri di riga corrispondenti alle righe trovate.
        -o: Mostra solo la parte della riga che corrisponde al pattern.

    Esempi:

    bash

    grep -i "^$termine:" "$dizionario"   # Cerca ignorando maiuscole/minuscole
    grep -n "pattern" file.txt           # Mostra i numeri di riga
    grep -r "pattern" /directory         # Cerca ricorsivamente
    grep -v "errore" file.txt            # Mostra le righe che NON contengono "errore"

## Comando sed per modificare file (continuazione)

    Sintassi di base:

    bash

sed 's/pattern/sostituzione/' file

    s sta per sostituzione (substitute), e la sintassi è:

    bash

s/pattern/sostituzione/flag

Dove:

    pattern: È l'espressione regolare o la stringa che vuoi cercare.
    sostituzione: È la stringa che sostituisce il pattern trovato.
    flag (opzionale): Controlla il comportamento della sostituzione. Alcuni flag utili includono:
        g: Sostituisce tutte le occorrenze nella riga (di default sed sostituisce solo la prima occorrenza).
        p: Stampa le righe modificate.
        i: Ignora la distinzione tra maiuscole e minuscole durante la ricerca.

Esempi:

bash

        sed 's/errore/corretto/g' file.txt      # Sostituisce tutte le occorrenze di "errore" con "corretto"
        sed 's/foo/bar/i' file.txt              # Sostituisce "foo" con "bar" ignorando maiuscole/minuscole

Operazioni comuni con sed:

    Aggiungere testo all'inizio di un file:

    bash

sed -i '1i\Inizio del file' file.txt

Questo comando aggiunge la riga "Inizio del file" come prima riga nel file.

Eliminare righe contenenti una stringa specifica:

bash

sed '/errore/d' file.txt

Elimina tutte le righe che contengono la parola "errore".

Aggiungere testo alla fine di un file:

bash

sed -i '$a\Nuova riga aggiunta' file.txt

Aggiunge "Nuova riga aggiunta" alla fine del file.

Sostituire solo la prima occorrenza di un pattern:

bash

    sed '0,/pattern/s//replacement/' file.txt

    Questo comando sostituisce solo la prima occorrenza di "pattern" con "replacement".

## Espressioni regolari (regex)

Le espressioni regolari sono stringhe che descrivono modelli di ricerca e vengono spesso usate con comandi come grep e sed.

    Un solo carattere alfabetico:
        Regex: [a-zA-Z]
        Cerca una singola lettera maiuscola o minuscola.

    Numero di una sola cifra:
        Regex: [0-9]
        Cerca un singolo numero (da 0 a 9).

    Parola alfabetica (solo lettere):
        Regex: ^[a-zA-Z]+$
        Cerca una stringa composta solo da lettere maiuscole o minuscole.

    Numero di più cifre:
        Regex: ^[0-9]+$
        Cerca una stringa composta da uno o più numeri.

    Parola alfanumerica (lettere e numeri):
        Regex: ^[a-zA-Z0-9]+$
        Cerca una stringa composta solo da lettere e numeri.

    Esempi pratici di utilizzo:

        Trovare parole che iniziano con una lettera maiuscola:

        bash

grep '^[A-Z]' file.txt

Trovare righe che contengono esattamente una parola numerica:

bash

grep '^[0-9]\+$' file.txt

Trovare righe che contengono una parola alfanumerica:

bash

grep '^[a-zA-Z0-9]\+$' file.txt