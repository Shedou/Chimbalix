## Language / Язык
**Original (Russian)** - [Transtlated (English)](https://github.com/Shedou/Chimbalix/blob/main/README-EN.md)

## ВНИМАНИЕ!

Это "Alpha" версия дистрибутива Linux, она содержит незавершённые детали! Используйте на свой страх и риск!

Chimbalix ( github.com/Shedou/Chimbalix ) основан на дистрибутиве MX Linux 23.1 x64 AHS "Libretto" ( mxlinux.org ).

ПРЕДУПРЕЖДЕНИЕ! Бездумная установка обновлений через *sudo apt upgrade / sudo apt-get upgrade* или менеджеры пакетов не рекомендуется! Это может нарушить порядок в системе и привести к проблемам! Пожалуйста, будьте осторожны при работе с репозиториями!

## Загрузки

MD5 - Chimbalix-24.6-alphachi-core61.iso: fafbd3eb925e7702ca90c0086b286429

MD5 - Chimbalix-24.6-alphachi-core68.iso: de698457c8506b58440ba727079addf5

Google Drive (Chimbalix 24.6 Alphachi, ISO): https://drive.google.com/drive/folders/1aLBYuxGtlz0r0mBtaSXoB_CvAoli076X

## Chimbalix 24.6 Alphachi
* 64-Bit (x86_64)
* Ядро - core61: 6.1.0-25-amd64 (6.1.106-3)
* Ядро - core68: 6.8.12-1-liquorix-amd64 (6.8-18.1)
* Версия Debian: 12.x (bookworm)
* GLIBC: 2.36, GCC 12.2, make 4.3, CMake 3.25.1, QMake 3.1
* DE: Xfce 4.18.1, GTK 3.24, LightDM 1.26
* Mesa: 24.2.2
* Display: X11 v1.21.1.7

## Минимальные системные требования
* CPU: 2 ядра, x86_64.
* GPU: VGA совместимая.
* RAM: 2 GB.
* HDD/SSD: 20 GB.

## Рекомендуемые системные требования (core68)
* CPU: AMD Ryzen / Intel Core, 6 ядер и больше.
* GPU: NVIDIA GTX 900 Series и новее, в том числе GTX 745/750/750Ti (Maxwell), так же возможна установка официальных драйверов для GeForce GTX 600-700 Series (Kepler), но функционал может быть ограниченным.
* RAM: 16 GB и больше.
* SSD: 60 GB и больше.

## Особенности:
* Автономность - система не требует наличия доступа к интернету для установки, а благодаря каталогу "PortSoft" и стабильной категории "Applications" в меню, возможно создание и распространение [автономных установочных пакетов сторонних приложений](https://github.com/Shedou/Chimbalix-Software-Catalog), так же пригодных для установки без доступа к сети.
* x32 библиотеки из коробки - позволяют запускать и использовать 32 битный софт в 64 битной ОС.
* Скриншоты в одно нажатие - используйте сочетания ctrl / shift / ctrl+shift вместе с PrintScreen для быстрого создания скриншотов.
* По умолчанию вложенная структура меню "Пуск".
* WINE (Proton LG) - позволяет запускать Windows приложения, хотя для этого лучше всё же использовать настоящую Windows...
* Полезные инструменты - в контекстное меню проводника встроены полезные инструменты, например конвертация изображений/видео, получение информации о файлах и т.п.
* Mangohud - запуск игр с оверлеем через контекстное меню проводника (может не работать с некоторыми играми).

## Интересные приложения
Интересные и возможно полезные приложения, которые не включены в дистрибутив "из коробки".

* Каталог приложений для Chimbalix: [Chimbalix-Software-Catalog](https://github.com/Shedou/Chimbalix-Software-Catalog)

* Генерация изображений с помощью нейронных сетей: [Сборка Stable Diffusion Web UI Neuro Linux](https://github.com/Shedou/Neuro/tree/main/SD_WEBUI_Neuro_Linux)

## Репозиторий разработки:

[chimbalix-indev](https://github.com/Shedou/chimbalix-indev)

## Репозитории компонентов дистрибутива
Список репозиториев с исходным кодом приложений, которые включены/могут быть включены дистрибутив Chimbalix.

Список будет дополняться по мере необходимости.

<details>
  <summary>-= Список =-</summary>

* Программа установки дистрибутива: [chimbalix-installer](https://github.com/Shedou/chimbalix-installer)
* Программа создания ISO образа дистрибутива: [chimbalix-snapshot](https://github.com/Shedou/chimbalix-snapshot)
* Анализатор использованного места на дисках Baobab: [chimbalix-baobab](https://github.com/Shedou/chimbalix-baobab)

</details>
