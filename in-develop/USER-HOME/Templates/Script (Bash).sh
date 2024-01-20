#!/usr/bin/env bash
# Script version 1.0
# Example Vars:
# path_to_script="$( dirname "$(readlink -f "$0")")"
# Add all arguments to variable: Files="$@"
# Remove the first argument from the queue: shift
# Current User Name: $USER
# Pause: read pause
# FileNameWithoutExtension="${FileName%.*}"
# FileNameWithoutPath="$(basename $FileName)"
# FilePathWithoutFileName="$(dirname $FileNameWithPath)"

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold)
N=$(tput sgr0)
