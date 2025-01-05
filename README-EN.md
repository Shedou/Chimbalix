## Language / Язык
[Original (Russian)](https://github.com/Shedou/Chimbalix) - **Transtlated (English)**

## WARNING!

This is an "Alpha" version of a Linux distribution, it contains unfinished parts! Use at your own risk!

Chimbalix (github.com/Shedou/Chimbalix) is based on the MX Linux 23.1 x64 AHS "Libretto" distribution (mxlinux.org).

WARNING! Mindlessly installing updates via *sudo apt upgrade / sudo apt-get upgrade* or package managers is not recommended! It may break the system and cause problems! Please be careful when working with repositories!

## Downloads

MD5 (Chimbalix-24.5-alphachi.iso): f97578c78b1b5c6f59625fdf878d5234

GitHub (7-Zip, 2 parts): [Chimbalix 24.5 Alphachi](https://github.com/Shedou/Chimbalix/releases/tag/Chimbalix_245) - [![Github Releases](https://img.shields.io/github/downloads/Shedou/Chimbalix/Chimbalix_245/total.svg)](https://github.com/Shedou/Chimbalix/releases/tag/Chimbalix_245)

Google Drive (Chimbalix 24.5 Alphachi, ISO): https://drive.google.com/drive/folders/1aLBYuxGtlz0r0mBtaSXoB_CvAoli076X

## Chimbalix 24.6 Alphachi
* In development...

# Chimbalix 24.5 Alphachi
* 64-Bit (x86_64)
* Kernel: 6.9.12-2-liquorix-amd64
* Debian version: 12.x (bookworm)
* GLIBC: 2.36, GCC 12.2, make 4.3, CMake 3.25.1, QMake 3.1
* DE: Xfce 4.18.1, GTK 3.24, LightDM 1.26
* Mesa: 24.2.2
* Display: X11 v1.21.1.7

## Minimum system requirements
* CPU: 2 cores, x86_64.
* GPU: VGA compatible.
* RAM: 2 GB.
* HDD/SSD: 20 GB.

## Recommended system requirements
* CPU: AMD Ryzen / Intel Core, 6 cores or more.
* GPU: NVIDIA GTX 900 Series and newer, including GTX 745/750/750Ti (Maxwell), it is also possible to install official drivers for GeForce GTX 600-700 Series (Kepler), but the functionality may be limited.
* RAM: 16 GB or more.
* SSD: 60 GB or more.

## Known issues
* Wine Proton: After installing Windows applications via Wine Proton, shortcuts are not created in the Start menu. The problem can only be solved by replacing Wine Proton with the original Wine Staging.
* Wine Prefix: Problem starting HoYoPlay due to problematic WineTahomaBold font "tahomabd.ttf", [fix released](https://github.com/Shedou/Chimbalix/blob/main/Hot-fixes/Chimbalix-24.4/Chimbalix-24.4-Wine-Fonts-Fix.sh).

## Features:
* Autonomy - the system does not require Internet access for installation, and thanks to the "PortSoft" catalog and the stable "Applications" category in the menu, it is possible to [create and distribute autonomous installation packages of third-party applications](https://github.com/Shedou/Chimbalix-Software-Catalog), also suitable for installation without network access.
* x32 libraries out of the box - allow you to run and use 32-bit software in a 64-bit OS.
* One-click screenshots - use ctrl / shift / ctrl+shift combinations with PrintScreen to quickly create screenshots.
* By default, the nested structure of the "Start" menu.
* WINE (Proton LG) - allows you to run Windows applications, although it is better to use real Windows for this...
* Useful tools - useful tools are built into the Explorer context menu, such as converting images/videos, getting information about files, etc.
* Mangohud - launching games with an overlay via the Explorer context menu (may not work with some games).

## Interesting applications
Interesting and possibly useful applications that are not included in the distribution "out of the box".

* Chimbalix application catalog: [Chimbalix-Software-Catalog](https://github.com/Shedou/Chimbalix-Software-Catalog)

* Image generation using neural networks: [Stable Diffusion Web UI Neuro Linux](https://github.com/Shedou/Neuro/tree/main/SD_WEBUI_Neuro_Linux)

## Development repository:

[chimbalix-indev](https://github.com/Shedou/chimbalix-indev)

## Distribution Component Repositories
List of repositories with source code of applications that are/can be included in the Chimbalix distribution.

The list will be expanded as needed.

<details>
<summary>-= List =-</summary>

* Distribution installer: [chimbalix-installer](https://github.com/Shedou/chimbalix-installer)
* Distribution ISO image creator: [chimbalix-snapshot](https://github.com/Shedou/chimbalix-snapshot)
* Baobab disk space analyzer: [chimbalix-baobab](https://github.com/Shedou/chimbalix-baobab)

</details>
