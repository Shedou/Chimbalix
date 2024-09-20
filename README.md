## Language / Язык
**Original (Russian)** - [Transtlated (English)](https://github.com/Shedou/Chimbalix/blob/main/README-EN.md)

## ВНИМАНИЕ!

Это "Alpha" версия дистрибутива Linux, она содержит незавершённые детали! Используйте на свой страх и риск!

Chimbalix ( github.com/Shedou/Chimbalix ) основан на дистрибутиве MX Linux 23.1 x64 AHS "Libretto" ( mxlinux.org ).

ПРЕДУПРЕЖДЕНИЕ! Бездумная установка обновлений через *sudo apt upgrade / sudo apt-get upgrade* или менеджеры пакетов не рекомендуется! Это может нарушить порядок в системе и привести к проблемам! Пожалуйста, будьте осторожны при работе с репозиториями!

## Загрузки

MD5 (Chimbalix-24.4-Alphachi.iso): 75515c0e01ea888252767f72779c9d21

GitHub (7-Zip, 2 parts): [Chimbalix 24.4 Alphachi](https://github.com/Shedou/Chimbalix/releases/tag/Chimbalix_244) - [![Github Releases](https://img.shields.io/github/downloads/Shedou/Chimbalix/Chimbalix_244/total.svg)](https://github.com/Shedou/Chimbalix/releases/tag/Chimbalix_244)

Google Drive (Chimbalix 24.4 Alphachi, ISO): https://drive.google.com/drive/folders/1aLBYuxGtlz0r0mBtaSXoB_CvAoli076X

# Chimbalix 24.4 Alphachi
* 64-Bit (x86_64)
* Ядро: 6.9.12-2-liquorix-amd64
* Версия Debian: 12.x (bookworm)
* DE: Xfce 4.18.1

### Известные проблемы
* Wine Proton: После установки Windows приложений через Wine Proton не создаются ярлыки в меню "Пуск", Решается проблема только заменой Wine Proton на оригинальный Wine Staging.

### Особенности:
* x32 библиотеки из коробки - позволяют запускать и использовать 32 битный софт в 64 битной ОС.
* Скриншоты в одно нажатие - используйте сочетания ctrl / shift / ctrl+shift вместе с PrintScreen для быстрого создания скриншотов.
* "PortSoft" - основной каталог для приложений, позволяющий располагать в себе даже полностью портативное ПО.
* По умолчанию вложенная структура меню "Пуск".
* "Apps" - стабильный раздел меню "Пуск" для сторонних приложений, позволяет разработчикам иметь свои собственные разделы меню для приложений.
* WINE (Proton LG) - позволяет запускать Windows приложения, хотя для этого лучше всё же использовать настоящую Windows...
* Полезные инструменты - в контекстное меню проводника встроены полезные инструменты, например конвертация изображений/видео, получение информации о файлах и т.п.
* Mangohud - запуск игр с оверлеем через контекстное меню проводника (может не работать с некоторыми играми).

## Интересные приложения
Интересные и возможно полезные приложения, которые не включены в дистрибутив "из коробки".

* Каталог приложений для Chimbalix (в начальной стадии): [Chimbalix-Software-Catalog](https://github.com/Shedou/Chimbalix-Software-Catalog)

* Генерация изображений с помощью нейронных сетей: [Сборка Stable Diffusion Web UI Neuro Linux](https://github.com/Shedou/Neuro/tree/main/SD_WEBUI_Neuro_Linux)

## Репозиторий разработки:

[chimbalix-indev](https://github.com/Shedou/chimbalix-indev)

## Репозитории компонентов дистрибутива
Список репозиториев с исходным кодом приложений, которые включены/могут быть включены дистрибутив Chimbalix.

Список будет дополняться по мере необходимости.

<details>
  <summary>-= Список =-</summary>

* Скрипты для Chimbalix: [chimbalix-scripts](https://github.com/Shedou/chimbalix-scripts)
* Программа установки дистрибутива: [chimbalix-installer](https://github.com/Shedou/chimbalix-installer)
* Программа создания ISO образа дистрибутива: [chimbalix-snapshot](https://github.com/Shedou/chimbalix-snapshot)
* Анализатор использованного места на дисках Baobab: [chimbalix-baobab](https://github.com/Shedou/chimbalix-baobab)

</details>
