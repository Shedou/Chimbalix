#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file

# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold); N=$(tput sgr0)

Format="$1"; shift; # arg 1
Filter="$1"; shift; # arg 2
Resize="$1"; shift; # arg 3

OutQualityJ="-quality 97"; OutQualityP="-quality 60"
OutFilter="-filter $Filter"; TFilter=""
OutSize="-resize $Resize"; TSize="-s"

if [ "$Filter" == "point" ] || [ "$Filter" == "Point" ]; then TFilter="-f"; fi
if [[ "$Resize" == *p ]]; then OutSize="-resize ${Resize::-1}%"; TSize="-sp"; fi

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
		OutName="$OutputFileName$TSize$TFilter"
		
		# Check if the output file exists
		OutName="$(CheckName "$OutName")"
		
		FileNameWithoutPath="$(basename "$OutName")"
		
		if $Exec -strip -alpha remove $OutFilter $OutSize $OutQualityJ "$CurrentFile" "$OutName"; then
			echo "$FileNameWithoutPath: Finished."
		else
			ErrorFiles="${ErrorFiles}\n $OutName"
			pause="1";
		fi
	done
fi

# PNG Module
if [ "$Format" == "png" ]; then
	echo -e "Try to convert. \n"
	for i in "${!Files[@]}"; do
		CurrentFile="${Files[$i]}"
		OutputFileName="${CurrentFile%.*}"
		OutName="$OutputFileName$TSize$TFilter"
		
		# Check if the output file exists
		OutName="$(CheckName "$OutName")"
		
		FileNameWithoutPath="$(basename "$OutName")"
		
		# Run prepared command
		if $Exec -strip $OutFilter $OutSize $OutQualityP "$CurrentFile" "$OutName"; then echo "$FileNameWithoutPath: Finished."
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


# https://www.imagemagick.org/script/convert.php
# Filters:
# Point       Hermite       Cubic
# Box         Gaussian      Catrom
# Triangle    Quadratic     Mitchell
# CubicSpline

# Lanczos       Hamming       Parzen
# Blackman      Kaiser        Welsh
# Hanning       Bartlett      Bohman

# Geometry:
# scale%				Height and width both scaled by specified percentage.
# scale-x%xscale-y%		Height and width individually scaled by specified percentages. (Only one % symbol needed.)
# width					Width given, height automagically selected to preserve aspect ratio.
# xheight				Height given, width automagically selected to preserve aspect ratio.
# widthxheight		Maximum values of height and width given, aspect ratio preserved.
# widthxheight^		Minimum values of width and height given, aspect ratio preserved.
# widthxheight!		Width and height emphatically given, original aspect ratio ignored.
# widthxheight>		Shrinks an image with dimension(s) larger than the corresponding width and/or height argument(s).
# widthxheight<		Enlarges an image with dimension(s) smaller than the corresponding width and/or height argument(s).
# area@					Resize image to have specified area in pixels. Aspect ratio is preserved.
# x:y					Here x and y denotes an aspect ratio (e.g. 3:2 = 1.5).
# x:y^					remove rows or columns to achieve the given aspect ratio.
# x:y#					add rows or columns to achieve the given aspect ratio.
# {size}{offset}		Specifying the offset (default is +0+0). Below, {size} refers to any of the forms above.
# {size}{+-}x{+-}y		Horizontal and vertical offsets x and y, specified in pixels. Signs are required for both. Offsets are affected by -gravity setting. Offsets are not affected by % or other size operators. Note that positive X and Y offsets are in the inward direction towards the center of the image for all -gravity options, except 'center'. For East, +X is left. For South, +Y is up. For SouthEast, +X is left and +Y is up. For center, the normal X and Y directional convention is used (+X is right and +Y is down).


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
