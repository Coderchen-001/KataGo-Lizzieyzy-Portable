@echo off
title Create Lizzieyzy Desktop Shortcut

set "TARGET=%~dp0Lizzieyzy-2.5.3-win64.exe"
set "WORKDIR=%~dp0"
set "SHORTCUT_NAME=Lizzieyzy Go AI"

echo ===================================================
echo      Create Lizzieyzy Desktop Shortcut
echo ===================================================
echo.

if not exist "%TARGET%" (
    echo ERROR: Could not find Lizzieyzy-2.5.3-win64.exe
    echo.
    echo Please make sure this batch file is in the same folder as the main program.
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

echo.
echo NOTE: This step is optional. You can launch the program directly by
echo double-clicking Lizzieyzy-2.5.3-win64.exe without creating a shortcut.
echo.
echo IMPORTANT: Some antivirus software may falsely flag this script as a
echo threat because it uses PowerShell to create a Windows shortcut.
echo This is a known false positive - the script is completely safe.
echo If your AV blocks it, temporarily disable real-time protection or
echo add an exclusion for this file.
echo.
echo ---------------------------------------------------
echo Press any key to continue, or close this window to cancel.
echo ---------------------------------------------------
pause >nul
echo.
echo Creating shortcut...
echo Target: %TARGET%
echo Working Directory: %WORKDIR%
echo Shortcut Name: %SHORTCUT_NAME%

powershell -Command ^
    $ws = New-Object -ComObject WScript.Shell; ^
    $sc = $ws.CreateShortcut([Environment]::GetFolderPath('Desktop') + '\' + '%SHORTCUT_NAME%' + '.lnk'); ^
    $sc.TargetPath = '%TARGET%'; ^
    $sc.WorkingDirectory = '%WORKDIR%'; ^
    $sc.Description = 'Lizzieyzy Go AI - KataGo Portable Bundle'; ^
    $sc.Save()

if %ERRORLEVEL% equ 0 (
    echo.
    echo ===================================================
    echo      Shortcut created successfully!
    echo ===================================================
    echo.
    echo A shortcut named "%SHORTCUT_NAME%" has been added to your desktop.
    echo You can now double-click it to launch Lizzieyzy.
    echo.
) else (
    echo.
    echo ERROR: Failed to create shortcut. Please try running this script
    echo as Administrator (right-click ^> "Run as administrator").
    echo.
)

echo.
echo Press any key to exit...
pause >nul
