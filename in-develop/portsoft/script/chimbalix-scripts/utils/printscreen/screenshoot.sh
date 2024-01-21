#!/usr/bin/env bash
# Script version 1.1
# LICENSE at the end of this file!
# Usage: PATH_TO_SCRIPT/screenshoot.sh Screen
# Modes (case sensitive!): Screen, Window, Region.

Mode="$1"
UserDir=~
OutDir="$UserDir/Pictures/Screenshoots/$Mode"

if [ "$Mode" == "Screen" ]; then
	ns=$(date +%N)
	r=$(($ns/1000000))
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	xfce4-screenshooter -f -m -c -s "$OutDir/$(date +%Y-%m-%d_%H-%M-%S-)$r.jpg"
fi

if [ "$Mode" == "Window" ]; then
	ns=$(date +%N)
	r=$(($ns/1000000))
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	xfce4-screenshooter -w -m -c -s "$OutDir/$(date +%Y-%m-%d_%H-%M-%S-)$r.jpg"
fi

if [ "$Mode" == "Region" ]; then
	ns=$(date +%N)
	r=$(($ns/1000000))
	if [ ! -d "$OutDir" ]; then mkdir "$OutDir"
	fi
	xfce4-screenshooter -r -c -s "$OutDir/$(date +%Y-%m-%d_%H-%M-%S-)$r.jpg"
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
