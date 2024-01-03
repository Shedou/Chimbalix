#!/usr/bin/env bash
# WARNING! Works only with sudo / root privilegies!
# Script version 1.0
# LICENSE at the end of this file!

pause=0

echo "-= Refreshing the Main Menu using the \"touch\" command  =-"
echo "sudo touch /etc/xdg/menus/*.menu"

if sudo touch /etc/xdg/menus/*.menu; then
	echo "Success"
else
	echo "Try without root privelegies"
	if [ -f ~/.config/menus/*.menu ]; then
		echo "touch ~/.config/menus/*.menu"
		touch ~/.config/menus/*.menu
	else
		echo "Error: Menu files in \"~/.config/menus/\" Not Found."
		pause=1;
	fi
fi

# Pause if pause...
if [ $pause == 1 ]; then
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
