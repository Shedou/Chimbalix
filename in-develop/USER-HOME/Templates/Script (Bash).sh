#!/usr/bin/env bash
# Script version 1.0

### -= Examples =- ###
# Path_To_Script="$( dirname "$(readlink -f "$0")")"
# Current User Name: $USER
# Pause: read pause
# MD5_OF_FILE=`md5sum "filename.zip" | awk '{print $1}'`

# FileNameWithoutExtension="${FileName%.*}"
# FileNameWithoutPath="$(basename $FileName)"
# FilePathWithoutFileName="$(dirname $FileNameWithPath)"
# Remove 2 first and 1 last char from String: "${String:2:-1}"
#
# sed -i -e "s~TEXT_TO_REPLACE~TEXT~g" "File.txt"

## Add all arguments to variable: Files="$@"
# Remove the first argument from the queue: shift
# get error code from last command: "$?"

## Array arguments iterate:
# Args=("$@")
# for i in "${!Args[@]}"; do
#	CurrentFile="${Args[$i]}"
# 	Current_Array_Number="$i"
# done

## Insert data into an array and place data from the array into file "mod_file.sh" after the line "SEARCH_THIS_TEXT_IN_mod_file":
# DirFiles=()
# readarray -t DirFiles < <(ls "/portsoft/x86_64/")
# DirFiles=( $(ls "/portsoft/x86_64/") ) # Another variant
#
# for Number in "${!DirFiles[@]}"; do
#	CurrentFile="${DirFiles[$Number]}"
#	awk -i inplace '{if($0=="SEARCH_THIS_TEXT_IN_mod_file") $0=$0"\n\"'"$CurrentFile"'\"";print}' "mod_file.sh"
# done

## Font styles
# Usage: "${B}Bold Text${N}"
# B=$(tput bold)
# N=$(tput sgr0)
