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
head -5 file.txt        # Mostra le prime 5 righe
tail -5 file.txt        # Mostra le ultime 5 righe
```

## Gestione del Contenuto di un File 📝
```bash
less #Visualizza il contenuto di un file in modo interattivo, permettendo lo scorrimento e la ricerca.
more #@Mostra il contenuto di un file una schermata alla volta.
cut #Estrae parti specifiche delle righe (ad esempio, colonne) da un file.
split #Divide un file in più parti basate sul numero di righe o byte.
grep #Cerca stringhe o pattern all’interno di un file.
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