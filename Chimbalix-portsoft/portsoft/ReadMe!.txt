Chimbalix "portsoft" directory v0.1

-= BASIC RULES =-

1) -= Portable independent software (statically compiled) is preferred.
1.1) -= The preferred extension for Linux x86/x86_64 executables is ".exec".

2) -= Directory Structure:
/PORTSOFT_FOLDER / ARCHI_FOLDERS / program_folder

PORTSOFT_FOLDER - Main folder.
ARCHI_FOLDERS - Software "categories", for example x86/x86_64/sctipt/other.
program_folder - Folder with a specific program, for example ChimbaBench.

3) -= System side PORTSOFT_FOLDER:
Path: /portsoft
Rights: 755 (root read/write, others read-only)
Owner-group: root:root
> sudo chown root:root /portsoft
> sudo chmod 755 /portsoft

3.1) -= System side ARCHI_FOLDERS:
Path: /portsoft/ARCHI_FOLDERS
Rights: 777 (read/write for all)
Owner-group: root:root
> sudo chown root:root /portsoft/*
> sudo chmod 777 /portsoft/*

3.2) -= System side program_folder:
Path: /portsoft/ARCHI_FOLDER/program_folder
Rights: 777 (read/write for all, recursive "-R")
Attention! The use of special access parameters is allowed if this does not prevent the use of the program by different users of the system.
Owner-group: Not specified
> chmod -R 777 /portsoft/ARCHI_FOLDER/program_folder

4) -= User side PORTSOFT_FOLDER and ARCHI_FOLDERS:
Path: /home/USERNAME/.local/portsoft
Path: /home/USERNAME/.local/portsoft/ARCHI_FOLDERS
Owner and rights: Not specified

-= ======== =-
-= Examples =-

-- Folder for x86 (32-bit) software:
/portsoft/x86

-- Folder for x86_64 (64 bit) software:
/portsoft/x86_64
e.g.
/portsoft/x86_64/ChimbaBench_v26_Linux_x64/ChimbaBench.exec

-- Folder for scripts and software without executable binaries:
/portsoft/script
e.g.
/portsoft/script/python_thing/main.py
/portsoft/script/bash_thing/change_bg.sh

-- Folder for other non-software things:
/portsoft/other
e.g.
/portsoft/other/very_nice_icon_pack_v11/purple/some_purple_icons.png
I don't know, think of something...

-- Folder for other architectures (must be created by the distribution developer for a specific platform):
/portsoft/armhf
/portsoft/arm64
/portsoft/riscv
and so on...


