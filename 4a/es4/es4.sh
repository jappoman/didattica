#!/bin/bash
#Script per creare le directory per tutti gli utenti i cui nomi sono contenuti nel file studenti

file_studenti="studenti"

# Controlla se il file studenti esiste
if [ ! -f "$file_studenti" ]; then
  echo "Errore: Il file '$file_studenti' non esiste."
  exit 1
fi

# Legge il file e crea le directory
while IFS= read -r studente; do
  # Controlla se la directory esiste già
  if [ ! -d "$studente" ]; then
    mkdir "$studente"
    echo "Creata directory per: $studente"
  else
    echo "La directory per $studente esiste già."
  fi
done < "$file_studenti"
