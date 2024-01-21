#!/usr/bin/env bash
# Script version 1.0
# LICENSE for this script is at the end of this file
# "$@" - Add all arguments.
# "shift;" - Move the command line arguments to one position left.
# Example usage (Thunar Custom Actions):
# Font styles
# Usage: "${B}Bold Text${N}"
B=$(tput bold)
N=$(tput sgr0)

Codec="$1"; shift; # arg 1
QualityVideo="$1"; shift; # arg 2
Preset="$1"; shift; # arg 3
QualityAudio="$1"; shift; # arg 4
Files=("$@")

#
ffmpeg_exec=ffmpeg
ErrorFiles=""
GoodFiles=""
pause="0"

# HEVC / x265
if [ "$Codec" == "libx265" ]; then
	libx265_crf="-crf 28"
	libx265_preset="-preset faster"
	libvorbis_q="-aq 4"
	
	if [ "$QualityVideo" == "bad" ]; then libx265_crf="-crf 40"
	elif  [ "$QualityVideo" == "low" ]; then libx265_crf="-crf 31"
	elif  [ "$QualityVideo" == "def" ]; then libx265_crf="-crf 28"
	elif  [ "$QualityVideo" == "med" ]; then libx265_crf="-crf 22"
	elif  [ "$QualityVideo" == "hi" ]; then libx265_crf="-crf 16"
	elif  [ "$QualityVideo" == "best" ]; then libx265_crf="-crf 10"
	fi
	
	if [ "$Preset" == "slow" ]; then libx265_preset="-preset slow"
	elif  [ "$Preset" == "medium" ]; then libx265_preset="-preset medium"
	elif  [ "$Preset" == "faster" ]; then libx265_preset="-preset faster"
	else libx265_preset=$Preset
	fi
	
	if [ "$QualityAudio" == "bad" ]; then libvorbis_q="-aq 0"
	elif  [ "$QualityAudio" == "low" ]; then libvorbis_q="-aq 2"
	elif  [ "$QualityAudio" == "med" ]; then libvorbis_q="-aq 4"
	elif  [ "$QualityAudio" == "hi" ]; then libvorbis_q="-aq 6"
	elif  [ "$QualityAudio" == "best" ]; then libvorbis_q="-aq 8"
	fi
	
	echo "Quality: $libx265_crf"
	echo "Preset: $libx265_preset"
	echo "Audio Quality: $libvorbis_q"
	echo -e "Try to execute ffmpeg. \n"
	
	for i in "${!Files[@]}"; do
		CurrentFile="${Files[$i]}"
		OutputFileName="${CurrentFile%.*}"
		if [ ! -f "$OutputFileName.mkv" ]; then
			Out="$OutputFileName.bad.mkv"
		else
			Out="$OutputFileName-x265.bad.mkv"
		fi
		
		if $ffmpeg_exec -i "$CurrentFile" -vcodec libx265 $libx265_preset $libx265_crf -acodec libvorbis $libvorbis_q "$Out"; then
			echo "Finished. Renaming file to normal."
			if [ ! -f "$OutputFileName.mkv" ]; then
				echo "if"
				mv "$Out" "$OutputFileName.mkv"
				GoodFiles="${GoodFiles}\n $OutputFileName.mkv"
			else
				echo "else"
				mv "$Out" "$OutputFileName-x265.mkv"
				GoodFiles="${GoodFiles}\n $OutputFileName-x265.mkv"
			fi
		else
			echo "-= WARNING =-"
			echo "Something went wrong..."
			ErrorFiles="${ErrorFiles}\n $OutputFileName.bad.mkv"
			pause="1";
		fi
	done
fi

# MPEG4
if [ "$Codec" == "mpeg4" ]; then
	libmpeg4_q="-crf 28"
	libmpeg4_preset="-preset faster"
	libvorbis_q="-aq 4"
	
	if [ "$QualityVideo" == "bad" ]; then libx265_crf="-crf 40"
	elif  [ "$QualityVideo" == "low" ]; then libx265_crf="-crf 31"
	elif  [ "$QualityVideo" == "def" ]; then libx265_crf="-crf 28"
	elif  [ "$QualityVideo" == "med" ]; then libx265_crf="-crf 22"
	elif  [ "$QualityVideo" == "hi" ]; then libx265_crf="-crf 16"
	elif  [ "$QualityVideo" == "best" ]; then libx265_crf="-crf 10"
	fi
	
	if [ "$Preset" == "slow" ]; then libx265_preset="-preset slow"
	elif  [ "$Preset" == "medium" ]; then libx265_preset="-preset medium"
	elif  [ "$Preset" == "faster" ]; then libx265_preset="-preset faster"
	else libx265_preset=$Preset
	fi
	
	if [ "$QualityAudio" == "bad" ]; then libvorbis_q="-aq 0"
	elif  [ "$QualityAudio" == "low" ]; then libvorbis_q="-aq 2"
	elif  [ "$QualityAudio" == "med" ]; then libvorbis_q="-aq 4"
	elif  [ "$QualityAudio" == "hi" ]; then libvorbis_q="-aq 6"
	elif  [ "$QualityAudio" == "best" ]; then libvorbis_q="-aq 8"
	fi
	
	echo "Quality: $libx265_crf"
	echo "Preset: $libx265_preset"
	echo "Audio Quality: $libvorbis_q"
	echo -e "Try to execute ffmpeg. \n"
	
	for i in $Files; do
		OutputFileName="${i%.*}"
		if [ ! -f "$OutputFileName.mkv" ]; then
			Out="$OutputFileName.bad.mkv"
		else
			Out="$OutputFileName-x265.bad.mkv"
		fi
		
		if $ffmpeg_exec -i "$i" -vcodec libx265 $libx265_preset $libx265_crf -acodec libvorbis $libvorbis_q "$Out"; then
			echo "Finished. Renaming file to normal."
			if [ ! -f "$OutputFileName.mkv" ]; then
				mv "$Out" "$OutputFileName.mkv"
				GoodFiles="${GoodFiles}\n $OutputFileName.mkv"
			else
				mv "$Out" "$OutputFileName-x265.mkv"
				GoodFiles="${GoodFiles}\n $OutputFileName-x265.mkv"
			fi
		else
			echo "-= WARNING =-"
			echo "Something went wrong..."
			ErrorFiles="${ErrorFiles}\n $OutputFileName.bad.mkv"
			pause="1";
		fi
	done
fi

if [ "$pause" == "1" ]; then
	echo "-= WARNING =-"
	echo "-= List of bad files:"
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
