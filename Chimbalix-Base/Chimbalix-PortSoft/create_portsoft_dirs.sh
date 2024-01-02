#!/usr/bin/env bash
# Chimbalix Create "portsoft" Script
# LICENSE for this script is at the end of this file!
ScriptVersion="1.0"
# Font styles usage: ${B}
B=$(tput bold)
N=$(tput sgr0)
UserHome=~
ScriptDir="$( dirname "$(readlink -f "$0")")"

Input="$ScriptDir/portsoft"
SystemSide="/portsoft"
UserSide="$UserHome/.local/portsoft"

# ====================================== #
# ====================================== #
#Arguments
argOne="$1"

#Variables:
silent=false
pause=true
confirm="no"

echo "-= Chimbalix Create \"portsoft\" Script v$ScriptVersion =-"
echo "Please, check the \"ReadMe!.txt\" file in the \"portsoft\" catalog."
echo -e "Installs the \"Program Files\" (portsoft) folder on the system.\n"
echo -e "> System Side:\n$SystemSide\n"
echo -e "> User Side:\n$UserSide\n"
echo "----------"

# Check silent install argument:
if [ "$argOne" == "--silent" ]; then
	pause=false
	silent=true
	confirm="yes"
	echo "Silent Mode"
fi

# Wait for user confirmation if not in silent mode:
if [ $silent == false ]; then
	echo -e "\nEnter \"y\" or \"yes\" to continue:"
	read confirm
fi

# Copy dir function
function create_system() {
in_dir="$1"
out_dir="$2"
if [ -d "$out_dir" ]; then
	echo "Warning! The ${B}\"$out_dir\"${N} folder is already present."
else
	echo "Creating \"$out_dir\" folder..."
	if sudo mkdir -p "$out_dir"; then
		sudo chown root:root $out_dir
		sudo chmod -R 755 $out_dir
		if sudo cp -R "$in_dir/." "$out_dir"; then
			sudo chown root:root $out_dir/*
			sudo chmod 777 $out_dir/*
			echo -e "System side installed.\n"
		else echo "Something went wrong..."
		fi
	else
		echo "Error. Problems with access rights?"
	fi
fi
}

function create_user() {
in_dir="$1"
out_dir="$2"
if [ -d "$out_dir" ]; then
	echo "Warning! The ${B}\"$out_dir\"${N} folder is already present."
else
	echo "Creating \"$out_dir\" folder..."
	if mkdir -p "$out_dir"; then
		if cp -R "$in_dir/." "$out_dir"; then
			echo -e "User side installed.\n"
		else echo "Something went wrong..."
		fi
	else
		echo "Error. Problems with access rights?"
	fi
fi
}

# Install part
if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
	if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
		create_system "$Input" "$SystemSide"
	else echo "Abort."
	fi

	if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
		create_user "$Input" "$UserSide"
	else echo "Abort."
	fi
else
	echo "Abort."
fi


# Pause if pause...
if [ $pause == true ]; then
	echo -e "\nPress ${B}Enter${N} to exit."
	read end
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
