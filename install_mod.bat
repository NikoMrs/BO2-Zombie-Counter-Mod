@echo off
setlocal

set "BASE=%LOCALAPPDATA%\Plutonium\storage\t6"

:: Check if the \scripts folder exists
if not exist "%BASE%" (
    echo ERROR: Plutonium Black Ops 2 folder not found in %BASE%.
    echo Make sure you have launched the game at least once.
    pause
    exit /b
)

:: Create the \zm folder if it does not exist
if not exist "%BASE%\scripts\zm" mkdir "%BASE%\scripts\zm"

:: Check if the script file exists
if not exist "zombie_counter.gsc" (
    echo ERROR: zombie_counter.gsc not found in the current directory.
    pause
    exit /b
)

:: Copy the .gsc file to the \zm folder
copy /Y "zombie_counter.gsc" "%BASE%\scripts\zm"

echo Mod successfully installed!
pause
