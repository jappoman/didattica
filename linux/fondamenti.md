# 🐧 Fondamenti di Linux, comandi e script 🐧

## 📂 Introduzione al filesystem di Linux

Il filesystem di Linux è organizzato gerarchicamente, partendo dalla directory **root** (`/`). Le cartelle principali sono:

| 💁 Cartella | 🔍 Descrizione |
|------------|--------------|
| `/` | La **root**: punto di partenza di tutto il filesystem |
| `/home` | Contiene le cartelle personali degli utenti (`/home/nomeutente`) |
| `/root` | Cartella personale dell'utente root (superutente) |
| `/bin` | Contiene i **comandi essenziali** del sistema (es. `ls`, `cp`, `mv`) |
| `/usr` | Contiene programmi e librerie installati dall'utente |
| `/var` | Dati variabili come log, cache, database locali |
| `/tmp` | File temporanei, cancellati automaticamente al riavvio |
| `/etc` | File di **configurazione** del sistema e dei servizi |
| `/mnt` | Punto di **montaggio** per dispositivi esterni (USB, dischi) |
| `/dev` | Contiene file speciali per i dispositivi hardware (es. `/dev/sda1` per l’hard disk) |
| `/proc` | Informazioni sui **processi** e sul sistema in tempo reale |
| `/sys` | Info hardware e kernel (più moderno di `/proc`) |


## 🔑 Permessi in Linux
Ogni file e cartella ha tre **tipi di permessi**:
- **r (read)** → Lettura
- **w (write)** → Scrittura
- **x (execute)** → Esecuzione (necessario per i programmi)

E sono assegnati a tre **categorie**:
1. **Utente (owner)** → Il proprietario del file
2. **Gruppo (group)** → Altri utenti che appartengono allo stesso gruppo
3. **Altri (others)** → Tutti gli altri utenti

Puoi visualizzare i permessi con:
```bash
ls -l
```
Esempio:
```
-rw-r--r--  1 gabriele utenti  1024 Feb 16 12:00 documento.txt
```
Qui vediamo che:
- **Utente (gabriele)** ha permessi di **lettura e scrittura** (`rw-`)
- **Gruppo (utenti)** ha solo **lettura** (`r--`)
- **Altri** hanno solo **lettura** (`r--`)

Per modificare i permessi:
```bash
chmod 755 script.sh
```

Per cambiare il proprietario:
```bash
chown gabriele documento.txt
```

## 💆 Gestione software su Ubuntu
Su Ubuntu, i pacchetti software vengono gestiti con **APT** (Advanced Packaging Tool).

### 📌 Aggiornare il sistema
```bash
sudo apt update   # Aggiorna la lista dei pacchetti disponibili
sudo apt upgrade  # Installa gli aggiornamenti disponibili
```

### 📌 Installare un programma
```bash
sudo apt install nome_programma
```
Esempio:
```bash
sudo apt install htop
```

### 📌 Rimuovere un programma
```bash
sudo apt remove nome_programma
```

## ✍️ Editor di testo Nano
Nano è un editor di testo semplice e solitamente installato di default. Se non è presente, installalo con `sudo apt install nano`.

### 📌 Aprire un file
```bash
nano nomefile
```

### 📌 Comandi principali in Nano
| Scorciatoia | Descrizione |
|-------------|------------|
| `CTRL + O` | Salva il file |
| `CTRL + X` | Esce dall'editor |
| `CTRL + K` | Taglia una riga |
| `CTRL + U` | Incolla una riga |
| `CTRL + W` | Cerca nel testo |
| `CTRL + G` | Mostra l’aiuto |

## 🛠 Comandi di base Bash

Bash è una shell di Linux che permette di interagire con il sistema operativo tramite comandi.

### 📂 Gestione file e cartelle
```bash
pwd           # Mostra la directory corrente
ls            # Elenca i file della cartella
ls -l         # Lista dettagliata con permessi
cd Documenti  # Entra nella cartella "Documenti"
mkdir nuova   # Crea una cartella "nuova"
rm file.txt   # Cancella un file
rm -r cartella # Cancella una cartella con tutto il suo contenuto
```

### 📝 Gestione file
```bash
touch nuovo.txt         # Crea un file vuoto
cp file1.txt file2.txt  # Copia un file
mv file1.txt file2.txt  # Rinomina/sposta un file
cat file.txt            # Mostra il contenuto del file
head -5 file.txt        # Mostra le prime 5 righe
tail -5 file.txt        # Mostra le ultime 5 righe
```

### 📦 Gestione pacchetti
```bash
sudo apt update   # Aggiorna la lista dei pacchetti
sudo apt upgrade  # Aggiorna i pacchetti installati
sudo apt install nome_pacchetto  # Installa un pacchetto
sudo apt remove nome_pacchetto   # Rimuove un pacchetto
```

### 🚀 Altri comandi utili
```bash
echo "Ciao mondo!"  # Stampa un messaggio
whoami              # Mostra il nome dell'utente
date                # Mostra la data e l'ora corrente
```

## Script in Bash
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

### Struttura di Base di uno Script
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

### Comandi Bash

I comandi sono gli stessi che si usano nel terminale, ma possono essere inseriti in uno script per automatizzarne l'esecuzione.

### Iterazioni di base in Bash
Bash permette di eseguire cicli utilizzando comandi standard di Linux.

#### Ciclo for
Esegue un'azione per ogni elemento in una lista.
```bash
#!/bin/bash
for nome in Marco Luca Anna
  do
    echo "Ciao, $nome!"
  done
```

#### Ciclo while
Esegue un blocco di codice finché una condizione è vera.
```bash
#!/bin/bash
cont=1
while [ $cont -le 5 ]
do
  echo "Numero: $cont"
  cont=$((cont+1))
done
```

#### Ciclo until
Simile a `while`, ma esegue il blocco finché la condizione diventa vera.
```bash
#!/bin/bash
cont=1
until [ $cont -gt 5 ]
do
  echo "Numero: $cont"
  cont=$((cont+1))
done
```
