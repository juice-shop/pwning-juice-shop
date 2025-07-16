#!/bin/bash

# Check if the input file exists
if [ ! -f "challenges.yml" ]; then
    echo "Error: challenges.yml not found"
    exit 1
fi

# Main processing
in_hints=false
hints_buffer=""
current_key=""

while IFS= read -r line || [ -n "$line" ]; do
    # When a new challenge begins, process the previous one
    if [[ "$line" =~ ^[[:space:]]*-[[:space:]]*$ ]]; then
        # Save the previous challenge if it had hints
        if [ -n "$current_key" ] && [ -n "$hints_buffer" ]; then
            echo -n "$hints_buffer" > "../../partials/hints/${current_key}.adoc"
        fi
        # Reset variables for the new challenge
        hints_buffer=""
        current_key=""
        in_hints=false
        continue
    fi

    # Store key for current challenge
    if [[ "$line" =~ ^[[:space:]]*key:[[:space:]]*([^[:space:]]+)[[:space:]]*$ ]]; then
        current_key="${BASH_REMATCH[1]}"
        continue
    fi

    # Process hints section
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

# Process the last challenge
if [ -n "$current_key" ] && [ -n "$hints_buffer" ]; then
    echo -n "$hints_buffer" > "../../partials/hints/${current_key}.adoc"
fi
