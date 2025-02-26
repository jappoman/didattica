# 🐧 Fondamenti di Linux, comandi e script 🐧

## Cenni Storici
- **GNU:** Progetto avviato da Richard Stallman nel 1985 per creare un sistema operativo libero.
- **Linux:** Iniziato da Linus Torvalds nel 1991, il kernel Linux ha completato il progetto GNU, dando vita a GNU/Linux.

## Le Distribuzioni Linux 🖥️
Le distribuzioni Linux sono varianti del sistema operativo GNU/Linux che si differenziano per:

- **Gestione dei Pacchetti:**
  Formati diversi (es. `.deb` per Ubuntu/Debian vs. `.rpm` per Fedora/CentOS) e strumenti come `apt`, `dnf` o `pacman`.

- **Modello di Rilascio:**
  Versioni stabili (come Ubuntu LTS) offrono sicurezza e affidabilità, mentre le rolling release (come Arch Linux) forniscono aggiornamenti continui.

- **Filosofia e Target:**
  Alcune sono pensate per i principianti (Ubuntu, Linux Mint) con configurazioni pronte all’uso, altre per utenti avanzati (Arch, Gentoo) che preferiscono personalizzare ogni aspetto.

- **Sistemi di Init e Configurazione:**
  L'avvio e la gestione dei servizi possono variare (es. `systemd` vs. `SysVinit`), influenzando le performance e la flessibilità del sistema.

- **Supporto e Comunità:**
  Distribuzioni con supporto commerciale (Red Hat, Ubuntu) offrono assistenza ufficiale, mentre altre si affidano a una community attiva.

Esempi di distribuzioni: Ubuntu, Debian, Fedora, CentOS, Arch Linux, Linux Mint, openSUSE, ecc.

## Licenza GPL (General Public License)
La GPL è la licenza free software più diffusa, che permette:
- L’uso, la modifica e la redistribuzione del software

Esempio: molti software open source, come WordPress, sono rilasciati sotto GPL.

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

## Dettagli Avanzati sul File System 📁
Oltre alle directory già trattate, è utile conoscere anche:
- **/sbin e /usr/sbin:** Contengono i comandi per l'amministrazione del sistema, usati principalmente dal superutente.
- **/usr/man:** Directory che ospita le pagine di manuale.
- **/lib:** Contiene le librerie di sistema necessarie al funzionamento dei programmi.
- **/cdrom e /floppy:** Directory predisposte per il montaggio di dispositivi esterni.

## Dispositivi e File Speciali 🔌
La directory `/dev` raccoglie file speciali che rappresentano i dispositivi hardware del sistema.
- **Esempi:** `fd0` (floppy A), `hda`, `hdb` (dischi fissi IDE), ecc.

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

## Editor Avanzati: vi/vim ⌨️
Oltre a Nano, `vi` (o la sua versione migliorata `vim`) è un editor molto diffuso in ambiente Unix/Linux:
- **Modalità comando:** Premendo `ESC` si accede ai comandi (salvataggio, uscita, copia, cancellazione, ecc.).
- **Modalità inserimento:** Premendo `i` si entra in modalità di editing.
- **Comandi principali:**
  - `:w` per salvare
  - `:q` per uscire
  - `:wq` per salvare ed uscire
  - `dd` per cancellare una riga
  - `yy` per copiare una riga
  - `p` per incollare

## La Shell 💻
La shell è l'interfaccia testuale che permette di interagire con il sistema operativo.
- **Interprete di comandi:** Permette di eseguire comandi e script.
- **Tipi di shell:** Bourne shell (sh), C shell (csh), Korn shell (ksh) e, comunemente, Bash (`/bin/bash`).
- **Shell di login:** La shell che viene eseguita al login, specificata in `/etc/passwd`.

Bash è una shell di Linux che permette di interagire con il sistema operativo tramite comandi.
