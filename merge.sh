#!/bin/bash

# Sprawdzenie liczby argumentów
if (( $# < 3 )); then
    echo "Użycie: $0 plik1 kol1 [kol2 ...] plik2 kol1 [kol2 ...] ... wynik.txt"
    exit 1
fi

output_file="${@: -1}"  # Ostatni argument to plik wyjściowy
temp_dir=$(mktemp -d)
paste_args=()

args=("$@")
arg_count=$#
i=0

# Iteracja po argumentach
while (( i < arg_count - 1 )); do
    file="${args[$i]}"
    
    # Sprawdzenie czy plik istnieje
    if [[ ! -f "$file" ]]; then
        echo "Błąd: '$file' nie istnieje lub nie jest plikiem."
        rm -r "$temp_dir"
        exit 1
    fi

    ((i++))
    # Zbieranie kolumn dopóki nie trafimy na nowy plik lub ostatni argument
    while (( i < arg_count - 1 )); do
        col="${args[$i]}"
        # Jeśli następny argument to istniejący plik, przerywamy
        if [[ -f "$col" ]]; then
            break
        fi

        # Sprawdzenie czy to liczba
        if ! [[ "$col" =~ ^[0-9]+$ ]]; then
            echo "Błąd: '$col' nie jest poprawnym numerem kolumny."
            rm -r "$temp_dir"
            exit 1
        fi

        temp_file="$temp_dir/col_$(basename "$file")_$col"
        awk -v col="$col" '{ print $col }' "$file" > "$temp_file"
        paste_args+=("$temp_file")
        ((i++))
    done
done

# Sklej kolumny
paste "${paste_args[@]}" | awk -f format.sh | tee "$output_file"

# Porządki
rm -r "$temp_dir"

