#!/bin/bash
# WARNING! Works only with sudo / root privilegies!
# Script version 1.0
# LICENSE at the end of this file!
#set -x #(for debug info)
# terminal.sh setsilent path-to-terminal
# terminal.sh set xterm
# terminal.sh custom
# terminal.sh custom path-to-terminal

# Args
mode="$1"
terminal="$2"

# Vars
bin=/bin
term_path=""
execute=0
pause=1
first_term="terminal-Name"
first_term_def="terminal-Name"

# Font styles
B=$(tput bold)
N=$(tput sgr0)

warn="${B}-=== WARNING! ===-${N}"

echo "-= ======== =-"
echo "Script for Chimbalix 23.1"
echo "WARNING! Works only with sudo / root privilegies!"
echo "-- -------- --"
echo "Add/Change default system Terminal (command \"terminal\")."

# Check terminals in system and quick help
echo "Terminals are present in the system:"
if [ -f "/bin/xfce4-terminal" ]; then echo "${B}xfce4-terminal${N} (/bin/xfce4-terminal)"
	if [ $first_term == $first_term_def ]; then first_term="xfce4-terminal"
	fi
fi
if  [ -f "/bin/gnome-terminal" ]; then echo "${B}gnome-terminal${N} (/bin/gnome-terminal)"
	if [ $first_term == $first_term_def ]; then first_term="gnome-terminal"
	fi
fi
if  [ -f "/bin/konsole" ]; then echo "${B}konsole${N} (/bin/konsole)"
	if [ $first_term == $first_term_def ]; then first_term="konsole"
	fi
fi
if  [ -f "/bin/uxterm" ]; then echo "${B}uxterm${N} (/bin/uxterm)"
	if [ $first_term == $first_term_def ]; then first_term="uxterm"
	fi
fi
if  [ -f "/bin/mlterm" ]; then echo "${B}mlterm${N} (/bin/mlterm)"
	if [ $first_term == $first_term_def ]; then first_term="mlterm"
	fi
fi
if  [ -f "/bin/txiterm" ]; then echo "${B}txiterm${N} (/bin/txiterm)"
	if [ $first_term == $first_term_def ]; then first_term="txiterm"
	fi
fi
if  [ -f "/bin/xterm" ]; then echo "${B}xterm${N} (/bin/xterm)"
	if [ $first_term == $first_term_def ]; then first_term="xterm"
	fi
fi
if  [ -f "/bin/alacritty" ]; then echo "${B}alacritty${N} (/bin/alacritty)"
	if [ $first_term == $first_term_def ]; then first_term="alacritty"
	fi
fi
if  [ -f "/bin/kitty" ]; then echo "${B}kitty${N} (/bin/kitty)"
	if [ $first_term == $first_term_def ]; then first_term="kitty"
	fi
fi
if  [ -f "/bin/guake" ]; then echo "${B}guake${N} (/bin/guake)"
	if [ $first_term == $first_term_def ]; then first_term="guake"
	fi
fi
if  [ -f "/bin/tilda" ]; then echo "${B}tilda${N} (/bin/tilda)"
	if [ $first_term == $first_term_def ]; then first_term="tilda"
	fi
fi
if  [ -f "/bin/tilix" ]; then echo "${B}tilix${N} (/bin/tilix)"
	if [ $first_term == $first_term_def ]; then first_term="tilix"
	fi
fi
if  [ -f "/bin/urxvt" ]; then echo "${B}urxvt${N} (/bin/urxvt)"
	if [ $first_term == $first_term_def ]; then first_term="urxvt"
	fi
fi
if  [ -f "/bin/rxvt-unicode" ]; then echo "${B}rxvt-unicode${N} (/bin/rxvt-unicode)"
	if [ $first_term == $first_term_def ]; then first_term="rxvt-unicode"
	fi
fi
if  [ -f "/bin/stterm" ]; then echo "${B}stterm${N} (/bin/stterm)"
	if [ $first_term == $first_term_def ]; then first_term="stterm"
	fi
fi

if [ "$mode" == "" ] || [ "$mode" == "--help" ]; then
	echo -e "\nQuick usage help (examples):"
	echo "./terminalix.sh set ${B}$first_term${N}"
	echo -e " - Set default system terminal, check the list of terminals above.\n"
	
	echo "./terminalix.sh custom"
	echo -e " - Enter the path to the terminal while the script is running.\n"
	
	echo "./terminalix.sh custom terminal-Path ( for example: /bin/$first_term )"
	echo -e " - Allows you to use any custom path to the terminal executable, if it exist.\n"
	
	echo "./terminalix.sh setsilent terminal-Path ( for example: /bin/$first_term )"
	echo " - For other scripts. Don't wait after success or error."
fi

echo -e "-= ======== =-\n"

# -= ======================================================== =-
# -= ======================================================== =-
# -= SETSILENT mode =-
if [ "$mode" == "setsilent" ] && [ "$terminal" != "" ]; then
	pause=0
	execute=0
	term_path=$terminal
	if [ -f "$term_path" ]; then
		echo -e "Change default terminal to: $terminal ($term_path)\n"
		# Create symlink
		if ln -sf $term_path $bin/terminal; then
			echo "Success. You can use the $term_path with the command terminal"
		else
			echo "Error. Trying execute with sudo..."
			if sudo ln -sf $term_path $bin/terminal; then
				echo "Success. You can use the $term_path with the command terminal"
			else
				echo "Something went wrong..."
			fi
		fi
	else
		echo "$warn"
		echo "File \"$terminal\" ($term_path) not found!"
		echo "Abort."
	fi
elif [ "$mode" == "setsilent" ] && [ "$terminal" == "" ]; then
	pause=0
	execute=0
	echo "Terminal name is not entered after \"setsilent\"!"
fi

# -= ======================================================== =-
# -= ======================================================== =-
# -= SET mode =-
if [ "$mode" == "set" ] && [ "$terminal" != "" ]; then
	term_path=$bin/$terminal
	if [ -f "$term_path" ]; then
		echo -e "Change default terminal to: $terminal ($term_path)\n"
		execute=1
	else
		echo "$warn"
		echo "File \"$terminal\" ($term_path) not found!"
		echo "Abort."
	fi
elif [ "$mode" == "set" ] && [ "$terminal" == "" ]; then
	echo "Terminal name is not entered after \"set\"!"
	echo "Enter terminal ${B}Name${N} to set (check names above):"
	read terminal
	term_path=$bin/$terminal
	if [ -f "$term_path" ]; then
		echo -e "Change default terminal to: $term_path\n"
		execute=1
	else
		echo "$warn"
		echo "File \"$term_path\" not found!"
		echo "Abort."
	fi
fi

# -= ======================================================== =-
# -= ======================================================== =-
# -= CUSTOM mode =-
if [ "$mode" == "custom" ] && [ "$terminal" != "" ]; then
	term_path=$terminal
	if [ -f "$term_path" ]; then
		echo -e "Change default terminal to: $terminal ($term_path)\n"
		execute=1
	else
		echo "$warn"
		echo "File \"$terminal\" ($term_path) not found!"
	fi
elif [ "$mode" == "custom" ] && [ "$terminal" == "" ]; then
	echo "Terminal name is not entered after \"CUSTOM\"!"
	echo "Enter path to custom terminal executable:"
	read term_path
	if [ -f "$term_path" ]; then
		echo -e "Change default terminal to: $term_path\n"
		execute=1
	else
		echo "$warn"
		echo "File \"$term_path\" not found!"
		echo "Abort."
	fi
fi

# -= ======================================================== =-
# -= ======================================================== =-
# Run if user confirm
if [ $execute == 1 ] && [ "$term_path" != "terminal" ] && [ "$term_path" != "/bin/terminal" ] && [ "$term_path" != "/usr/bin/terminal" ]; then
	echo "Do you want to apply changes? Enter ${B}yes${N} or ${B}y${N} to continue:"
	read yn
	if [ "$yn" == "yes" ] || [ "$yn" == "y" ]; then
		# Create symlink
		if ln -sf $term_path $bin/terminal; then
			echo "Success. You can use command ${B}terminal${N} to execute $term_path"
		else
			echo "${B}- Try to execute with sudo -${N}"
			if sudo ln -sf $term_path $bin/terminal; then
				echo "Success. You can use command ${B}terminal${N} to execute $term_path"
			else
				echo "Something went wrong..."
			fi
		fi
	else
		echo "Abort."
	fi
elif [ $execute == 1 ] && [ "$term_path" == "terminal" ] || [ "$term_path" == "/bin/terminal" ] || [ "$term_path" == "/usr/bin/terminal" ]; then
	echo "WARNING! Don't choose \"$term_path\" as input. It will break the command \"terminal\"."
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
