#!/usr/bin/env bash

#########################################################################
#                         bash-a-name                                   #
#                                                                       #
# GNU GPL 2.0                                                           #
# Copyright (C) 2024 https://github.com/zer0theory                      #
#                                                                       #
# This program is free software: you can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation, either version 2 of the License, or     #
# (at your option) any later version.                                   #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
# GNU General Public License for more details.                          #
#                                                                       #
# You should have received a copy of the GNU General Public License     # 
# along with this program.  If not, see https://www.gnu.org/licenses    #
#########################################################################

# Arrays for vowels and consonants with weights
vowels=("a" "e" "i" "o" "u" "a" "e" "i" "o" "u" "a" "e" "i" "o" "u" "a" "e" "i" "o" "u" "oo" "ee")
consonants=("b" "b" "c" "d" "d" "f" "g" "h" "j" "k" "l" "m" "m" "n" "n" "p" "q" "r" "s" "s" "s" "t" "t" "t" "v" "w" "x" "y" "z" "b" "c" "d" "f" "g" "h" "j" "k" "l" "m" "n" "p" "r" "s" "t" "v" "w" "y" "ng" "sm" "sp" "sh" "st" "pl" "ph" "bl" "cl" "fl" "sl" "br" "cr" "dr" "fr" "gr" "pr" "tr" "sw")

# Get a random element from an array
getRandomElement() {
    array=("$@")
    index=$((RANDOM % ${#array[@]}))
    echo "${array[$index]}"
}

# Generate a random name
generateRandomName() {
    firstName=""
    lastName=""

    # Generating first name
    for ((i=0; i < RANDOM % 5 + 3; i++)); do
        if (($i % 2 == 0)); then
            firstName+=`getRandomElement "${consonants[@]}"`
        else
            firstName+=`getRandomElement "${vowels[@]}"`
        fi
    done

    # Generating last name
    for ((i=0; i < RANDOM % 5 + 4; i++)); do
        if (($i % 2 == 0)); then
            lastName+=`getRandomElement "${consonants[@]}"`
        else
            lastName+=`getRandomElement "${vowels[@]}"`
        fi
    done

    # Capitalize first letter of each name
    firstName=$(tr '[:lower:]' '[:upper:]' <<< ${firstName:0:1})${firstName:1}
    lastName=$(tr '[:lower:]' '[:upper:]' <<< ${lastName:0:1})${lastName:1}

    echo "$firstName $lastName"
}

# Generate and print a random name
generateRandomName

