#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold); N=$(tput sgr0)

Format="$1"; shift; # arg 1
Compression="$1"; shift; # arg 2
Type="$1"; shift; # arg 3

OutQuality=""; OutType=""; OutAlpha=""; TQ=""; TT=""

if [ "$Compression" != "default" ]; then OutQuality="-quality $Compression"; TQ="-q$Compression"; fi

if [ "$Type" != "default" ]; then
	OutType="-type $Type"
	TT="-$Type"
	if [ "$Type" == "TrueColor" ] || [ "$Type" == "GrayScale" ] || [ "$Type" == "Palette" ] || [ "$Type" == "BiLevel" ]; then
		OutAlpha="-alpha remove"
	fi
	if [ "$Type" == "TrueColor.B" ] || [ "$Type" == "GrayScale.B" ] || [ "$Type" == "Palette.B" ] || [ "$Type" == "BiLevel.B" ]; then
		OutType="-type ${Type%.*}"
		OutAlpha="-background #000000 -alpha remove"
	fi
fi

Exec=convert; ErrorFiles=""; GoodFiles=""; pause="0"; Files=("$@")

# CheckName function
function CheckName {
	local FileName="$1"; local OutFileName="$FileName.$Format"; local time="$(date +%s)"; local tx="${time:6}"
	if [ -e "$OutFileName" ]; then OutFileName="$FileName-new.$Format"; if [ -e "$OutFileName" ]; then OutFileName="$FileName-new-$tx.$Format"; fi; fi
	echo "$OutFileName"
}

# JPEG Module
if [ "$Format" == "jpg" ]; then
		
	echo -e "Try to convert. \n"
	
	for i in "${!Files[@]}"; do
		CurrentFile="${Files[$i]}"
		OutputFileName="${CurrentFile%.*}"
		OutName="$OutputFileName$TQ"
		
		# check if the output file exists
		OutName="$(CheckName "$OutName")"
		
		FileNameWithoutPath="$(basename "$OutName")"
		
		# Run prepared command
		if $Exec -strip $OutAlpha $OutQuality $OutType "$CurrentFile" "$OutName"; then echo "$FileNameWithoutPath: Finished."
		else ErrorFiles="${ErrorFiles}\n $OutName"; pause="1"; fi
	done
fi

if [ "$pause" == "1" ]; then
	echo -e "\
	-= WARNING =-
	-= List of not finished or corrupted files:
	$ErrorFiles
	\n-= Not enough system memory? Or damaged files? =-"
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
