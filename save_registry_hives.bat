@echo off
setlocal

:: Ask user for output directory with example
echo Enter the full path where you want to save the files.
echo Example: C:\Users\YourName\Desktop
set /p outdir=Path: 

:: Remove trailing backslash if present
if "%outdir:~-1%"=="\" set outdir=%outdir:~0,-1%

:: Check if directory exists
if not exist "%outdir%" (
    echo The directory does not exist.
    pause
    exit /b
)

echo.
echo Saving registry hives to "%outdir%"...
echo.

reg save hklm\system "%outdir%\system" && ^
reg save hklm\sam "%outdir%\sam" && ^
reg save hklm\security "%outdir%\security"

if %errorlevel% equ 0 (
    echo.
    echo All operations completed successfully.
) else (
    echo.
    echo One or more operations failed.
)

pause