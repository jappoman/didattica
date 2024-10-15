#!/bin/bash

# Nome del processo da cercare
process_name="nome_processo"

# Usa il comando 'pgrep' per verificare se il processo è in esecuzione
if pgrep -x "$process_name" > /dev/null; then
  echo "Il processo $process_name è in esecuzione."
else
  echo "Il processo $process_name non è in esecuzione."
fi