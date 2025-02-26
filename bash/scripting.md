# Scripting in Bash
Uno script Bash è un file di testo contenente una serie di comandi che possono essere eseguiti in sequenza per automatizzare operazioni nel terminale Linux.

Gli script Bash vengono utilizzati per:
- Automatizzare compiti ripetitivi
- Creare strumenti personalizzati
- Gestire file e cartelle
- Eseguire programmi

Per eseguire uno script Bash, si utilizza il comando:
```bash
bash nome_script.sh
```
oppure si rende eseguibile il file e lo si esegue direttamente:
```bash
chmod +x nome_script.sh
./nome_script.sh
```

## Struttura di Base di uno Script
Un semplice script inizia con la cosiddetta **shebang** (`#!`), che indica il programma da usare per interpretarlo.

Esempio di un primo script:
```bash
#!/bin/bash

echo "Ciao, questo è il mio primo script Bash!"
```

**Passaggi per eseguire lo script:**
1. Creare un file:
   ```bash
   nano mio_script.sh
   ```
2. Scrivere il codice sopra nel file e salvarlo.
3. Renderlo eseguibile:
   ```bash
   chmod +x mio_script.sh
   ```
4. Eseguirlo:
   ```bash
   ./mio_script.sh
   ```

## Comandi base

I comandi sono gli stessi che si usano nel terminale, ma possono essere inseriti in uno script per automatizzarne l'esecuzione.

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
Il ciclo for permette di iterare su una lista di elementi o su una sequenza numerica. Sintassi di base:

```bash
for var in lista_di_elementi; do
  # Codice da eseguire per ogni elemento
done
```
Uso alternativo: Il ciclo for può essere utilizzato anche per iterare su un range numerico:
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
È possibile utilizzare il ciclo for anche per iterare su file nella directory corrente. Guardare l'esempio successivo.

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
Permette di accedere agli argomenti passati quando viene eseguito lo script. Opzioni comuni:
- ```$#```: Numero di argomenti passati.
- ```$1```, ```$2```, ecc.: Argomenti in ordine.
- ```$@```: Tutti gli argomenti passati. Restituisce tutti gli argomenti passati allo script, rappresentandoli come una lista di argomenti separati da spazi. Ogni argomento è mantenuto intatto, quindi se un argomento contiene spazi, sarà considerato come un singolo argomento.

## Lettura da file
È possibile leggere un file riga per riga utilizzando un ciclo while. Questo approccio permette di processare ogni riga di un file separatamente. Sintassi di base:
```bash
while read -r linea; do
  # Azioni da eseguire su ogni riga
done < nomefile.txt
```
- read -r linea: Legge ogni riga del file e la memorizza nella variabile linea. L'opzione -r impedisce che le backslash vengano interpretate.
- < nomefile.txt: Specifica il file di input da leggere.

Esempio:
```bash
# numeri.txt è un file che contiene una lista di numeri, uno per riga. Lo script seguente legge ogni riga del file e la somma.

#!/bin/bash
sum=0
while read -r numero; do
  sum=$((sum + numero))
done < numeri.txt
echo "La somma totale è: $sum"
```

## Spostare file o directory (mv)
Il comando mv permette di spostare o rinominare file e directory. Sintassi di base:
```bash
mv origine destinazione
```
Opzioni:
- ```-i```: Chiede conferma prima di sovrascrivere un file esistente.
- ```-n```: Non sovrascrivere mai i file esistenti.
- ```-v```: Mostra ogni operazione effettuata.

Esempio:
```bash
mv file.txt /percorso/destinazione/ # Sposta il file nel percorso di destinazione
mv file.txt nuovo_nome.txt    # Rinomina il file
```

##  Manipolare/visualizzare il contenuto di file di testo (cat)
Il comando cat è utilizzato per visualizzare, concatenare e manipolare file di testo in Bash. Sintassi di base:
```bash
cat [opzioni] [file...]
# file: Il nome del file (o dei file) da leggere.
```

### Utilizzi principali
```bash
# Visualizza il contenuto di file.txt
cat file.txt

# Concatena e visualizza il contenuto di file1.txt e file2.txt
cat file1.txt file2.txt

# Concatena file1.txt e file2.txt e salva il risultato in unione.txt
cat file1.txt file2.txt > unione.txt

# Visualizza il contenuto di file.txt con numeri di riga
cat -n file.txt  # Numerazione di tutte le righe

# Visualizza il contenuto di file.txt numerando solo le righe non vuote
cat -b file.txt  # Numerazione delle sole righe non vuote

# Rimuove righe vuote consecutive da file.txt
cat -s file.txt  # Comprimi righe vuote multiple in una sola

# Visualizza i caratteri non stampabili nel file.txt
cat -v file.txt  # Mostra i caratteri non stampabili

# Definizione di variabili per l'output
output="output.txt"
file1="file1.txt"
file2="file2.txt"

# Concatena file1 e file2 e scrive l'output in un file con variabili
cat "$file1" "$file2" > "$output"  # Salva il risultato in output.txt

# Usa cat per aggiungere il contenuto di file2 a file1
cat "$file2" >> "$file1"  # Appende il contenuto di file2 a file1
```

## Comando Word Count
Il comando ```wc``` è usato per contare il numero di righe, parole, caratteri e byte di un file o di un input. Sintassi di base:
```bash
wc [opzione] file
```
Senza opzioni, wc restituisce il numero di righe, parole e byte del file specificato. Esempio:
```bash
wc file.txt #Output: 10  50  300 file.txt
```
Questo output significa che il file ```file.txt``` ha:
- 10 righe
- 50 parole
- 300 byte

Opzioni principali:
- ```-l```: Conta il numero di righe nel file.
- ```-w```: Conta il numero di parole.
- ```-c```: Conta il numero di byte.
- ```-m```: Conta il numero di caratteri, considerand- anche i caratteri multi-byte (utile con fil- codificati in UTF-8).
- ```-L```: Mostra la lunghezza della riga più lunga (i- termini di caratteri).

Esempi:
```bash
# Contare solo il numero di righe
wc -l file.txt # Output: 10 file.txt

# Contare solo il numero di parole
wc -w file.txt # Output: 50 file.txt

# Contare solo il numero di byte
wc -c file.txt # Output: 300 file.txt

# Contare il numero di caratteri (inclusi caratteri multi-byte)
wc -m file.txt # Output: 290 file.txt

# Mostrare la lunghezza della riga più lunga
wc -L file.txt # Output: 35 file.txt

# Lettura del numero di righe in una variabile. Con redirezione. Il comando legge il contenuto del file direttamente come input, e l'output è solo il numero di righe, senza il nome del file.
righe=$(wc -l < file.txt)
echo "Il file ha $righe righe."
# Output: Il file ha 10 righe.

# Lettura del numero di righe in una variabile. Senza redirezione. Viene fornito il nome del file come argomento, e l'output include sia il numero di righe che il nome del file.
righe=$ (wc -l file.txt)
echo "Il file ha $righe"
# Output: Il file ha 10 file.txt

# Contare il numero di parole da un input tramite pipe
echo "Ciao, come stai?" | wc -w # Output: 3

# Contare il numero di righe in più file e mostrare il totale
wc -l file1.txt file2.txt
# Output:
# 10 file1.txt
# 20 file2.txt
# 30 totale
```

## Comando grep per cercare parole o pattern
Il comando ```grep``` permette di cercare stringhe o espressioni regolari in un file. Opzioni avanzate:
- ```-i```: Ignora maiuscole e minuscole.
- ```-r```: Cerca ricorsivamente in tutte le sottodirectory.
- ```-v```: Inverte la ricerca, mostrando le righe che non corrispondono- pattern.
- ```-n```: Mostra i numeri di riga corrispondenti alle righe trovate.
- ```-o```: Mostra solo la parte della riga che corrisponde al pattern.

Esempi:
```bash
grep -i "^$termine:" "$dizionario"   # Cerca ignorando maiuscole/minuscole
grep -n "pattern" file.txt           # Mostra i numeri di riga
grep -r "pattern" /directory         # Cerca ricorsivamente
grep -v "errore" file.txt            # Mostra le righe che NON contengono "errore"
```

## Comando sed per modificare file
Sintassi di base:
```bash
sed 's/pattern/sostituzione/' file
```
"s" sta per sostituzione (substitute), e la sintassi è:
```bash
s/pattern/sostituzione/flag
```
Dove:
- ```pattern```: È l'espressione regolare o la stringa che vuoi cercare
- ```sostituzione```: È la stringa che sostituisce il pattern trovato.
- ```flag``` (opzionale): Controlla il comportamento della sostituzione. Alcuni flag utili includono:
  - ```g```: Sostituisce tutte le occorrenze nella riga (di default sed sostituisce solo la prima occorrenza).
  - ```p```: Stampa le righe modificate.
  - ```i```: Ignora la distinzione tra maiuscole e minuscole durante la ricerca.

Esempi:
```bash
sed 's/errore/corretto/g' file.txt      # Sostituisce tutte le occorrenze di "errore" con "corretto"
sed 's/foo/bar/i' file.txt              # Sostituisce "foo" con "bar" ignorando maiuscole/minuscole
```
### Operazioni comuni con sed:
Aggiungere testo all'inizio di un file. Esempio:
```bash
sed -i '1i\Inizio del file' file.txt
# Aggiunge la riga "Inizio del file" come prima riga nel file.
```
Eliminare righe contenenti una stringa specifica. Esempio:
```bash
sed '/errore/d' file.txt
# Elimina tutte le righe che contengono la parola "errore".
```
Aggiungere testo alla fine di un file. Esempio:
```bash
sed -i '$a\Nuova riga aggiunta' file.txt
# Aggiunge "Nuova riga aggiunta" alla fine del file.
```
Sostituire solo la prima occorrenza di un pattern. Esempio:
```bash
sed '0,/pattern/s//replacement/' file.txt
# Sostituisce solo la prima occorrenza di "pattern" con "replacement".
```

## Espressioni regolari (regex)
Le espressioni regolari sono stringhe che descrivono modelli di ricerca e vengono spesso usate con comandi come grep e sed. Di seguito alcuni esempi comuni di espressioni regolari:
- Un solo carattere alfabetico (cerca una singola lettera maiuscola o minuscola):
```bash
[a-zA-Z]
```
- Numero di una sola cifra (cerca un singolo numero (da 0 a 9)):
```bash
[0-9]
```
- Parola alfabetica (solo lettere) (cerca una stringa composta solo da lettere maiuscole o minuscole.)
```bash
^[a-zA-Z]+$
```
- Numero di più cifre (cerca una stringa composta da uno o più numeri):
```bash
^[0-9]+$
```
- Parola alfanumerica (lettere e numeri) (cerca una stringa composta solo da lettere e numeri):
```bash
^[a-zA-Z0-9]+$
```

### Esempi pratici di utilizzo:
Trovare parole che iniziano con una lettera maiuscola:
```bash
grep '^[A-Z]' file.txt
```
Trovare righe che contengono esattamente una parola numerica:
```bash
grep '^[0-9]\+$' file.txt
```
Trovare righe che contengono una parola alfanumerica:
```bash
grep '^[a-zA-Z0-9]\+$' file.txt
```