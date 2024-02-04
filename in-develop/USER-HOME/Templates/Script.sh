#!/usr/bin/env bash
# Script version 1.0

# -= Examples =-
# path_to_script="$( dirname "$(readlink -f "$0")")"
# Current User Name: $USER
# Pause: read pause

# FileNameWithoutExtension="${FileName%.*}"
# FileNameWithoutPath="$(basename $FileName)"
# FilePathWithoutFileName="$(dirname $FileNameWithPath)"
# Remove 2 first and 1 last char from String: "${String:2:-1}"

# Add all arguments to variable: Files="$@"
# Remove the first argument from the queue: shift

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
