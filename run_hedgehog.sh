#!/usr/bin/env bash

delay=0.08

trap 'printf "\033[?25h"; clear; exit' INT TERM EXIT

printf '\033[?25l'

hedgehog1='   .|||||||||.
  |||||||||||||
 ( o    |||||||
  /           \
    /       \ '

hedgehog2='   .|||||||||.
  |||||||||||||
 ( o    |||||||
  /           \
    |       | '

while true; do
    cols=$(tput cols)

    for ((x=0; x<cols-16; x++)); do
        clear

        padding=$(printf "%${x}s" "")

        if (( x % 2 == 0 )); then
            while IFS= read -r line; do
                printf '%s%s\n' "$padding" "$line"
            done <<< "$hedgehog1"
        else
            while IFS= read -r line; do
                printf '%s%s\n' "$padding" "$line"
            done <<< "$hedgehog2"
        fi

        sleep "$delay"
    done
done
