#!/bin/bash
# WARNING! Works only with sudo / root privilegies!
# LICENSE at the end of this file!
#set -x #(for debug info)

path_to_script="$( dirname "$(readlink -f "$0")")"
path_to_output_dir=/etc/modprobe.d

output=$path_to_output_dir/chi-blacklist-nouveau-v1.conf

# Font styles
B=$(tput bold)
N=$(tput sgr0)

echo "-= =================== =-"
echo "Script for Chimbalix 23.1"
echo "WARNING! Works only with sudo / root privilegies!"
echo "-= =================== =-"
echo "Remove Nouveau driver from the blacklist."
echo "The script may not give the desired result if the Nouveau driver is blocked by third-party methods!"
echo -e "-= =================== =-\n"

# Run script if user confirm
echo "Do you want to continue? Enter ${B}yes${N} or ${B}y${N} to continue:"
read yn
if [ "$yn" == "yes" ] || [ "$yn" == "y" ]; then
	# Remove file if exist
	if [ -f $output ]; then
		echo -e "Remove file: $output\n"
		sudo rm $output
	fi
	
	# Updating initramfs
	echo "Updating initramfs (update-initramfs -u)"
	echo -e "After complete reboot system to apply changes.\nPlease wait...\n"
	sudo update-initramfs -u
	
	# Reboot
	echo -e "\nPlease, reboot the system!"
	read rebuut
else
	echo -e "Abort.\n"
fi

# Pause if pause...
if [ "$#" != 0 ]; then
	if [ "${1}" == "pause" ]; then
		echo "Press ${B}Enter${N} to close"
		read temp
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
