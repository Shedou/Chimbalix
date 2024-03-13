#!/usr/bin/env bash
# Script version 1.0

# -= Examples =-
# Path_To_Script="$( dirname "$(readlink -f "$0")")"
# Current User Name: $USER
# Pause: read pause
# Pause (press any key to exit): read -rn1

# FileNameWithoutExtension="${FileName%.*}"
# FileNameWithoutPath="$(basename $FileName)"
# FilePathWithoutFileName="$(dirname $FileNameWithPath)"
# Remove 2 first and 1 last char from String: "${String:2:-1}"
#
# sed -i -e "s~TEXT_TO_REPLACE~TEXT~g" "File.txt"

# Add all arguments to variable: Files="$@"
# Remove the first argument from the queue: shift
# get error code from last command: "$?"

# Array arguments iterate:
# Files=("$@")
# for i in "${!Files[@]}"; do
#	CurrentFile="${Files[$i]}"
# 	Current_Array_Number="$i"
# done

# Font styles
# Usage: "${B}Bold Text${N}"
# B=$(tput bold)
# N=$(tput sgr0)
