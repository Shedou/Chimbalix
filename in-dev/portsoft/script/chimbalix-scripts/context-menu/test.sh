#!/usr/bin/env bash
# Script version 1.0
# Example Vars:
# path_to_script="$( dirname "$(readlink -f "$0")")"
# Current User Name: $USER
# Pause: read pause
# FileNameWithoutExtension="${FileName%.*}"
# FileNameWithoutPath="$(basename $FileName)"

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold)
N=$(tput sgr0)

sed '/<\/actions>/e cat xmltext.xml' uca.xml >> uca_new.xml
