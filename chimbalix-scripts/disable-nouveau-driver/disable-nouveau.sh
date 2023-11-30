#!/bin/bash
# WARNING! Works only with sudo / root privilegies!
# LICENSE at the end of this file!
#set -x #(for debug info)

path_to_script=/opt/chimbalix-scripts/disable-nouveau-driver
path_to_output_dir=/etc/modprobe.d

input=$path_to_script/data/chi-blacklist-nouveau.conf
output=$path_to_output_dir/chi-blacklist-nouveau-v1.conf

# Font styles
B=$(tput bold)
N=$(tput sgr0)

echo "-= =================== =-"
echo "Script for Chimbalix 23.1"
echo "WARNING! Works only with sudo / root privilegies!"
echo "-= =================== =-"
echo "Disable Nouveau driver."
echo -e "-= =================== =-\n"

# Run script if user confirm
echo "Do you want to continue? Enter ${B}yes${N} or ${B}y${N} to continue:"
read yn
if [ "$yn" == "yes" ] || [ "$yn" == "y" ]; then
	# Remove old file if exist
	if [ -f $output ]; then
		echo -e "Remove old file: $output\n"
		rm $output
	fi
	
	# Copy prepared file
	echo -e "Copy:\n" $input "\nTo:\n" $output "\n"
	cp -T $input $output
	
	# Updating initramfs
	echo "Updating initramfs (update-initramfs -u)"
	echo -e "After complete reboot system to apply changes.\nPlease wait...\n"
	update-initramfs -u
	
	# Reboot if user confirm
	echo -e "\nDo you want to reboot system? Enter ${B}yes${N} or ${B}y${N} to reboot:"
	read rebuut
	if [ "$rebuut" == "yes" ] || [ "$rebuut" == "y" ]; then
		reboot
	fi
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
