@echo off
setlocal enabledelayedexpansion

:: Папка, откуда начинать копирование (текущая директория)
set "source_dir=%~dp0"

:: Переходим в исходную директорию
cd /d "%source_dir%"

:: Рекурсивно копируем все аудиофайлы в корень
for /r %%f in (*.mp3 *.flac *.m4a) do (
    set "filename=%%~nxf"
    set "dest=%source_dir%\!filename!"
    if not exist "!dest!" (
        copy "%%f" "!dest!" >nul
        echo Скопирован: %%f
    ) else (
        echo Файл уже существует: !dest!
    )
)

echo Все треки скопированы в корень!
pause
