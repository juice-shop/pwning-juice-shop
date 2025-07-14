#!/bin/bash

# Überprüfen ob die Eingabedatei existiert
if [ ! -f "challenges.yml" ]; then
    echo "Error: challenges.yml nicht gefunden"
    exit 1
fi

# Hauptverarbeitung
in_hints=false
hints_buffer=""
current_key=""

while IFS= read -r line || [ -n "$line" ]; do
    # Wenn eine neue Challenge beginnt, die vorherige verarbeiten
    if [[ "$line" =~ ^[[:space:]]*-[[:space:]]*$ ]]; then
        # Speichere die vorherige Challenge wenn sie Hints hatte
        if [ -n "$current_key" ] && [ -n "$hints_buffer" ]; then
            echo "${current_key}"
            echo -n "$hints_buffer" > "../../partials/hints/${current_key}.adoc"
        fi
        # Reset der Variablen für die neue Challenge
        hints_buffer=""
        current_key=""
        in_hints=false
        continue
    fi

    # Key für aktuelle Challenge speichern
    if [[ "$line" =~ ^[[:space:]]*key:[[:space:]]*([^[:space:]]+)[[:space:]]*$ ]]; then
        current_key="${BASH_REMATCH[1]}"
        continue
    fi

    # Hints-Sektion verarbeiten
    if [[ "$line" =~ ^[[:space:]]*hints:[[:space:]]*$ ]]; then
        in_hints=true
        continue
    elif [ "$in_hints" = true ]; then
        if [[ "$line" =~ ^[[:space:]]*-[[:space:]]*\'?([^\']+)\'?[[:space:]]*$ ]]; then
            hint="${BASH_REMATCH[1]}"
            hints_buffer="${hints_buffer}* ${hint}"$'\n'
        elif [[ ! "$line" =~ ^[[:space:]] ]] || [[ "$line" =~ ^[[:space:]]*[a-zA-Z]+: ]]; then
            in_hints=false
        fi
    fi
done < challenges.yml

# Die letzte Challenge verarbeiten
if [ -n "$current_key" ] && [ -n "$hints_buffer" ]; then
    echo "${current_key}"
    echo -n "$hints_buffer" > "../../partials/hints/${current_key}.adoc"
fi
