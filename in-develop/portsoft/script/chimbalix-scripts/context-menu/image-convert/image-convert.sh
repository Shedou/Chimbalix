#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold)
N=$(tput sgr0)

Format="$1"; shift; # arg 1
Quality="$1"; shift; # arg 2
Filter="$1"; shift; # arg 4
Resize="$1"; shift; # arg 3
Rotate="$1"; shift; # arg 5
Flip="$1"; shift; # arg 6
Flop="$1"; shift; # arg 7

OutQuality=""
TQ="Def"

OutFilter=""
TFilter=""

OutSize=""
TSize=""

OutRotate=""
TRotate=""

OutFlip=""
TFlip=""

OutFlop=""
TFlop=""
if [ "$Quality" != "-noquality" ]; then OutQuality="-quality $Quality"
	TQ="$Quality"
fi

if [ "$Resize" != "-noresize" ]; then OutSize="-resize $Resize"
	TSize="-$Resize"
	TQ=""
fi

if [ "$Filter" != "-nofilter" ]; then OutFilter="-filter $Filter"
	TFilter="-$Filter"
fi

if [ "$Rotate" != "-norotate" ]; then
	OutRotate="-rotate $Rotate"
	if [[ "$Rotate" == -* ]]; then
		temp="${Rotate:1}"
		TRotate="-L$temp"
	else
		TRotate="-R$Rotate"
	fi
fi

if [ "$Flip" != "-noflip" ]; then OutFlip="-flip"
	TFlip="-flip"
fi

if [ "$Flop" != "-noflop" ]; then OutFlop="-flop"
	TFlop="-flop"
fi




Files=("$@")

#
Exec=convert
ErrorFiles=""
GoodFiles=""
pause="0"

# JPEG
if [ "$Format" == "jpg" ]; then
		
	echo -e "Try to convert. \n"
	
	for i in "${!Files[@]}"; do
		CurrentFile="${Files[$i]}"
		OutputFileName="${CurrentFile%.*}"
		OutName="$OutputFileName-q$TQ$TSize$TFilter$TRotate$TFlip$TFlop.jpg"
		FileNameWithoutPath="$(basename "$OutName")"
		
		if $Exec -strip $OutFlip $OutFlop $OutRotate $OutFilter $OutSize $OutQuality "$CurrentFile" "$OutName"; then
			echo "$FileNameWithoutPath: Finished."
		else
			ErrorFiles="${ErrorFiles}\n $OutName"
			pause="1";
		fi
	done
fi

# PNG
if [ "$Format" == "png" ]; then
		
	echo -e "Try to convert. \n"
	
	for i in "${!Files[@]}"; do
		CurrentFile="${Files[$i]}"
		OutputFileName="${CurrentFile%.*}"
		OutName="$OutputFileName-c$TQ$TSize$TFilter$TRotate$TFlip$TFlop.png"
		FileNameWithoutPath="$(basename "$OutName")"
		
		if $Exec -strip -fuzz 10% $OutFlip $OutFlop $OutRotate $OutFilter $OutSize $OutQuality "$CurrentFile" "$OutName"; then
			echo "$FileNameWithoutPath: Finished."
		else
			ErrorFiles="${ErrorFiles}\n $OutName"
			pause="1";
		fi
	done
fi

if [ "$pause" == "1" ]; then
	echo "-= WARNING =-"
	echo "-= List of not finished or corrupted files:"
	echo -e "$ErrorFiles"
	echo -e "\n-= Not enough system memory? Or damaged files? =-"
	echo "-= WARNING =-"
	read pause
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
