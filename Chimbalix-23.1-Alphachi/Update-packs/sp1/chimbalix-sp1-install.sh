#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file
Path_To_Script="$( dirname "$(readlink -f "$0")")"
# Font styles
B=$(tput bold)
N=$(tput sgr0)

# Arguments
arg1="$1"

# Welcome message
echo "-=  Service Pack 1 for Chimbalix 23.1 Alphachi  =-"

# Check "root"
if [ "$EUID" -ne 0 ]; then echo "Please run as ${B}root${N}"; read pause; exit 1; fi

# Check Distro version and installed Service Packs
DistroVersion="Unknown"
SpInstalled=0
if [ -f /etc/lsb-release ]; then . /etc/lsb-release; DistroVersion=$PRETTY_NAME
	if [ -f "/etc/chimbalix/sp"*"-installed" ]; then
		for SpVer in "/etc/chimbalix/sp"*"-installed"; do SpInstalled=$(($SpInstalled+1)); done
	fi
else
	if uname &>/dev/null; then DistroVersion="$(uname -sr)"; fi
fi

# Settings
In_InstallDir="$Path_To_Script/data"
Out_InstallDir="/"
Error=false

# Display info and wait confirmation
echo -e "\nWARNING! Service pack only for Chimbalix 23.1 Alphachi! DO NOT INSTALL ON OTHER SYSTEMS!"
echo "-= Changes =-"
echo "Menu \"Start\":"
echo " Added categories \"AI\" and \"Record & Stream\""
echo -e "Install Python3 packages:\n python3-venv\n python3.11-venv\n python3-setuptools-whl\n python3-pip-whl"
echo "Check file \"/etc/chimbalix/sp1-installed\" for details."

echo -e "\nDetected OS Version: $DistroVersion"; echo -e "Service pack installed: $SpInstalled"
if [ "$DistroVersion" != "Chimbalix 23.1 Alphachi" ]; then
	Error=true
	echo -e "\nWARNING! DO NOT INSTALL THE SERVICE PACK ON OTHER LINUX DISTRIBUTIONS!\n THIS MAY CAUSE ERRORS OR HARM TO THE SYSTEM!"
fi

if (( $SpInstalled >= 1 )) && [ "$DistroVersion" == "Chimbalix 23.1 Alphachi" ]; then
	Error=true
	echo -e "\nWARNING! Service Pack 1 or later already installed!"
fi

if [ $Error == false ]; then echo -e "\nEnter \"${B}y${N}\" or \"${B}yes${N}\" to begin installation."; Confirm=""
	if [ "$arg1" != "--silent" ]; then read Confirm; fi; fi

# Run installation if confirm or "--silent"
if [ "$Confirm" == "y" ] || [ "$Confirm" == "yes" ] || [ "$arg1" == "--silent" ] && [ $Error == false ]; then
	echo -e "\nInstalling Python 3 Dependencies...\n"
	if dpkg -s python3-venv; then echo "> python3-venv is already present. Skip."
	else dpkg -i "$Path_To_Script/python-deps/python3.11-venv_3.11.2-6_amd64.deb"; fi
	
	if dpkg -s python3.11-venv; then echo "> python3.11-venv is already present. Skip."
	else dpkg -i "$Path_To_Script/python-deps/python3-venv_3.11.2-1+b1_amd64.deb"; fi
	
	if dpkg -s python3-setuptools-whl; then echo "> python3-setuptools-whl is already present. Skip."
	else dpkg -i "$Path_To_Script/python-deps/python3-setuptools-whl_66.1.1-1_all.deb"; fi
	
	if dpkg -s python3-pip-whl; then echo "> python3-pip-whl is already present. Skip."
	else dpkg -i "$Path_To_Script/python-deps/python3-pip-whl_23.0.1+dfsg-1_all.deb"; fi
	
	echo -e "\nInstalling other files...\n"
	if cp -r "$In_InstallDir/." "$Out_InstallDir"; then echo "Complete."; touch /etc/xdg/menus/*.menu; else echo "Something went wrong..."; fi
fi

if [ "$arg1" != "--silent" ]; then
	echo -e "\nExit..."
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
