#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold)
N=$(tput sgr0)

path_to_script="$( dirname "$(readlink -f "$0")")"

Debug=false
Silent=false
Files=("$@")


if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
	echo -e "\n${B}-= DEBUG MODE =-${N}"
	echo "Args: $@"
	echo "Array: ${Files[@]}"
	
	echo -e "\n-= Array Elements:"
	for count in "${!Files[@]}"; do
		echo -e "Array[$count]: ${Files[$count]}"
	done
	
	echo -e "\n-= Processing Arguments and remove garbage:"
fi

# Remove garbage from arguments and not found files.
for arg in "${!Files[@]}"; do
	if [ ! -e "${Files[$arg]}" ]; then
		if [[ "${Files[$arg]}" == "--"* ]] || [[ "${Files[$arg]}" == "-"* ]]; then
			if [ "${Files[$arg]}" == "--silent" ] && [ $Silent == false ]; then
				Silent=true
				if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
					echo "* ACTIVATE SILENT MODE!"
				fi
			elif [ "${Files[$arg]}" == "--silent" ] && [ $Silent == true ]; then
				if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
					echo "${B}* SILENT MODE ALREADY ACTIVATED!${N}"
				fi
			fi
		fi
		if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
			echo "- Trash: ${Files[$arg]}"
		fi
		unset 'Files[arg]'
	else
		if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
			echo "${B}+ File present: ${Files[$arg]}${N}"
		fi
	fi
done

if [ $Debug == true ]; then ### -= DEBUG ACTION =- ###
	echo -e "\n-= Array Elements after cleaning:"
	for count in "${!Files[@]}"; do
		echo -e "Array[$count]: ${Files[$count]}"
	done
	echo -e "${B}-= DEBUG MODE =-\n${N}"
fi

# Info
if [ $Silent == false ]; then
	echo "-=  \"check-mime\" script for Chimbalix  =-"
	echo "Display MIME-type of selected files."
	echo "xdg >: xdg-mime query filetype \"FileName\""
	echo "file>: file --mime-type -b \"FileName\""
	echo -e "${B}Current Dir:${N} $(dirname "${Files[0]}")\n"
fi

# BODY
for file in "${Files[@]}"; do
	FileName="$(basename -- "$file")"
	mxdg="$(xdg-mime query filetype "$file")"
	mfile="$(file --mime-type -b -- "$file")"
	if [ "$mxdg" == "$mfile" ]; then
		echo "${B}      $FileName${N} : "$mfile
	else
		echo "xdg > ${B}$FileName${N} : "$mxdg
		echo "file> $FileName : "$mfile
	fi
done

# File mime-type
#echo -e "\n-= \"file --mime-type -b\":"
#for file in "${Files[@]}"; do
#	FileName="$(basename -- "$file")"
#	mime="$(file --mime-type -b "$file")"
#	echo "${B}$FileName${N} : "$mime
#done

# Pause if Debug mode or not Silent
if [ $Silent == false ] || [ $Debug == true ]; then
	echo -e "\nPress ${B}Enter${N} to exit."
	read pause
fi

# MIT License
#
# Copyright (c) 2024 Chimbal
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
