# 📜 Comandi di base in Bash

## 📂 Gestione file e cartelle
```bash
pwd           # Mostra la directory corrente
ls            # Elenca i file della cartella
ls -l         # Lista dettagliata con permessi
cd Documenti  # Entra nella cartella "Documenti"
mkdir nuova   # Crea una cartella "nuova"
rm file.txt   # Cancella un file
rm -r cartella # Cancella una cartella con tutto il suo contenuto
```

## 📝 Gestione file
```bash
touch nuovo.txt         # Crea un file vuoto
cp file1.txt file2.txt  # Copia un file
mv file1.txt file2.txt  # Rinomina/sposta un file
cat file.txt            # Mostra il contenuto del file
```

## Gestione del Contenuto di un File 📝
```bash
less #Visualizza il contenuto di un file in modo interattivo, permettendo lo scorrimento e la ricerca.
more #@Mostra il contenuto di un file una schermata alla volta.
```

### 🔍 grep – Cerca stringhe o pattern nei file
```bash
grep "testo" file.txt              # Cerca "testo" nel file
grep -i "testo" file.txt           # Cerca ignorando maiuscole/minuscole
grep -r "testo" /percorso/cartella # Cerca ricorsivamente nei file di una cartella
grep -n "testo" file.txt           # Mostra anche il numero di riga
grep -v "testo" file.txt           # Mostra le righe che **non** contengono "testo"
grep -c "testo" file.txt           # Conta quante righe contengono "testo"
grep -E "uno|due" file.txt         # Usa espressioni regolari estese (es. "uno" **oppure** "due")
```

### 🔽 tail – Mostra le ultime righe di un file
```bash
tail file.txt               # Mostra le ultime 10 righe (default)
tail -n 20 file.txt         # Mostra le ultime 20 righe
tail -f file.txt            # Mostra in tempo reale le nuove righe aggiunte (utile per log)
tail -n +5 file.txt         # Mostra il file **dalla** riga 5 in poi
tail -c 50 file.txt         # Mostra gli ultimi 50 **byte**
```

### 🔡 sort – Ordina le righe di un file o output
```bash
sort file.txt               # Ordina le righe in ordine alfabetico
sort -r file.txt            # Ordina in ordine inverso (decrescente)
sort -n numeri.txt          # Ordina numericamente (es. 2 prima di 10)
sort -k 2 file.txt          # Ordina in base alla **seconda colonna**
sort -u file.txt            # Rimuove i duplicati (mostra solo righe uniche)
sort -t ":" -k 2 file.txt   # Specifica un **separatore di campo** (es. `:`) e ordina per seconda colonna
```

### 🔼 head – Mostra le prime righe
```bash
head file.txt               # Mostra le prime 10 righe (default)
head -n 5 file.txt          # Mostra le prime 5 righe
head -c 100 file.txt        # Mostra i primi 100 **byte**
head -n -3 file.txt         # Mostra tutte le righe tranne le ultime 3
```

### ✂️ cut – Estrae colonne o caratteri da ogni riga
```bash
cut -d ":" -f 1 file.txt         # Estrae il primo campo, usando `:` come delimitatore
cut -f 2 file.txt                # Estrae il secondo campo (default delimitatore: TAB)
cut -d "," -f 1,3 file.csv       # Estrae il primo e terzo campo da un file CSV
cut -c 1-5 file.txt              # Estrae i primi 5 caratteri di ogni riga
cut -c 3- file.txt               # Estrae dal terzo carattere in poi
```

### 🧩 split – Divide un file in più parti
```bash
split file.txt                 # Divide in blocchi da 1000 righe (default)
split -l 50 file.txt           # Divide in file da 50 righe ciascuno
split -b 1k file.txt           # Divide in file da 1 kilobyte ciascuno
split -d file.txt parte_       # Usa numeri invece di lettere nei nomi dei file (es. parte_00, parte_01)
split -l 100 file.txt out_     # Divide in blocchi da 100 righe, nominandoli "out_aa", "out_ab", ...
```

## 📦 Gestione pacchetti
```bash
sudo apt update   # Aggiorna la lista dei pacchetti
sudo apt upgrade  # Aggiorna i pacchetti installati
sudo apt install nome_pacchetto  # Installa un pacchetto
sudo apt remove nome_pacchetto   # Rimuove un pacchetto
```

## 🚀 Altri comandi utili
```bash
echo "Ciao mondo!"  # Stampa un messaggio
whoami              # Mostra il nome dell'utente
date                # Mostra la data e l'ora corrente
```