#!/usr/bin/env bash
# WARNING! Works only with sudo / root privilegies!
# Script version 1.1
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
bin="/bin"
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

# Check binaries directory
if  [ -d "$bin" ]; then
	echo "Using default binary directory \"$bin\"."
	echo "If this is the wrong location, correct the script (\"bin\" variable) according to your Linux distribution."
else
	echo $warn
	echo "Binary directory \"$bin\" not found! Try to use \"/usr/bin\""
	if  [ -d "/usr/bin" ]; then
		bin="/usr/bin"
		echo "Success. Using the \"$bin\" directory."
	else
		echo "Error! Please correct the script (\"bin\" variable) according to your Linux distribution."
		echo "Press Enter to exit."
		read rr
		exit 0;
	fi
fi

# Check terminals in system
function check_terminal() {
	ct_terminal_name="$1"
	ct_full_path="$bin/$ct_terminal_name"
	if  [ -f "$ct_full_path" ]; then
		if [ $first_term == $first_term_def ]; then first_term="$ct_terminal_name"
		fi
		echo "${B}$ct_terminal_name${N} ($ct_full_path)"
	fi
}

echo -e "\nTerminals are present in the system:"
check_terminal "konsole"
check_terminal "xfce4-terminal"
check_terminal "gnome-terminal"
check_terminal "wezterm"
check_terminal "alacritty"
check_terminal "xterm"
check_terminal "stterm"
check_terminal "kitty"
check_terminal "txiterm"
check_terminal "mlterm"
check_terminal "uxterm"
check_terminal "tilix"
check_terminal "urxvt"
check_terminal "rxvt-unicode"
check_terminal "tilda"
check_terminal "guake"

# Quick help
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
