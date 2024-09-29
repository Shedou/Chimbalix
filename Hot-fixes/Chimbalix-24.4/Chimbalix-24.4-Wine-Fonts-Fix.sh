#!/usr/bin/env bash

Font_User_Prefix="/home/$USER/.wine/drive_c/windows/Fonts/tahomabd.ttf"
Font_User_Prefix_Founded=""
Font_Template_Prefix="/portsoft/other/chimbalix-wine-prefix/prefix/drive_c/windows/Fonts/tahomabd.ttf"
Font_Template_Prefix_Founded=""

if [ -e "$Font_Template_Prefix" ]; then Font_User_Prefix_Founded="(file is present!)"; fi
if [ -e "$Font_User_Prefix" ]; then Font_Template_Prefix_Founded="(file is present!)"; fi

echo -e " -= Chimbalix 24.4 Wine Fonts Fix =-

 Problem: Free font analogue \"tahomabd.ttf\" can cause some games and launchers to freeze with a black window,
 solved by removing the file \"tahomabd.ttf\" from the Wine prefix.


 Files to be deleted (if any):
  $Font_User_Prefix $Font_User_Prefix_Founded
  
 To delete the following file, you need root rights:
  $Font_Template_Prefix $Font_Template_Prefix_Founded


  Attention! This script does not check for the presence of the problematic font
  in third-party prefixes created by the user!

 Enter \"y\" or \"yes\" to continue."


read confirm

if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
	echo " Removing files..."
	if [ -e "$Font_User_Prefix" ]; then rm -rf "$Font_User_Prefix"; fi
	if [ -e "$Font_Template_Prefix" ]; then sudo rm -rf "$Font_Template_Prefix"; fi
	echo " Complete, press Enter to exit."
	read pause
else
	echo "Abort..."
	echo " Press Enter to exit."
	read pause
fi
