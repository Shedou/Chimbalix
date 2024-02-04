#!/usr/bin/env bash
# Script version 1.2
# LICENSE at the end of this file!
# Usage: PATH_TO_SCRIPT/screenshoot.sh Screen
# Modes (case sensitive!): Screen, Window, Region.

Mode="$1"
UserDir=~
OutDir="$UserDir/Pictures/Screenshoots/$Mode"

ns=$(date +%N)
r=$(($ns/1000000))
OutName="$(date +%Y-%m-%d_%H-%M-%S-)$r.jpg"

if [ "$Mode" == "Screen" ]; then
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	xfce4-screenshooter -f -m -s "$OutDir/$OutName.jpg"
	xclip -selection clipboard -t image/png -i "$OutDir/$OutName.jpg"
fi

if [ "$Mode" == "Window" ]; then
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	xfce4-screenshooter -w -m -s "$OutDir/$OutName.jpg"
	xclip -selection clipboard -t image/png -i "$OutDir/$OutName.jpg"
fi

if [ "$Mode" == "Region" ]; then
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	if xfce4-screenshooter -r -s "$OutDir/$OutName.jpg"; then
		xclip -selection clipboard -t image/png -i "$OutDir/$OutName.jpg"
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
