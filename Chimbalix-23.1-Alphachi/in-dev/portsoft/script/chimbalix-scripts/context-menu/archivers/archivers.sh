#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file
# "$@" - Add all arguments.
# "shift;" - Move the command line arguments to one position left.
# Example usage (Thunar Custom Actions):
# Name: Ark - Open archive
# Command: ~/.config/Thunar/context_menu_archivers.sh ark open %d %F

Archiver="$1"; shift; # arg 1
Act="$1"; shift; # arg 2
Path="$1"; shift; # arg 3

# Paths to arcivers executables
Ark_exec=ark
File_Roller_exec=file-roller
Engrampa_exec=engrampa

# Ark
if [ "$Archiver" == "ark" ]; then
	if [ "$Act" == "open" ]; then
		exec $Ark_exec "$1"
	fi
	if [ "$Act" == "add" ]; then
		exec $Ark_exec --dialog --add "$@"
	fi
	if [ "$Act" == "extract_here" ]; then
		exec $Ark_exec --batch --autosubfolder --destination "$Path" "$@"
	fi
	if [ "$Act" == "extract_to" ]; then
		exec $Ark_exec --batch --dialog --autosubfolder "$@"
	fi
fi

# File Roller
if [ "$Archiver" == "file-roller" ]; then
	if [ "$Act" == "open" ]; then
		exec $File_Roller_exec "$1"
	fi
	if [ "$Act" == "add" ]; then
		exec $File_Roller_exec "--default-dir=$Path" --add "$@"
	fi
	if [ "$Act" == "extract_here" ]; then
		exec $File_Roller_exec "--extract-to=$Path" --extract-here --force "$@"
	fi
	if [ "$Act" == "extract_to" ]; then
		exec $File_Roller_exec "--default-dir=$Path" --extract "$@"
	fi
fi

# Engrampa
if [ "$Archiver" == "engrampa" ]; then
	if [ "$Act" == "open" ]; then
		exec $Engrampa_exec "$1"
	fi
	if [ "$Act" == "add" ]; then
		exec $Engrampa_exec --default-dir="$Path" --add "$@"
	fi
	if [ "$Act" == "extract_here" ]; then
		exec $Engrampa_exec --extract-to="$Path" --extract-here --force "$@"
	fi
	if [ "$Act" == "extract_to" ]; then
		exec $Engrampa_exec --extract "$@"
	fi
fi


# MIT License
#
# Copyright (c) 2023 Chimbal
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
