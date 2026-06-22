@echo off
title Lizzieyzy KataGo One-Click Performance Tuning

echo ===================================================
echo      Lizzieyzy KataGo One-Click Performance Tuning v1.1
echo ===================================================
echo.
echo This script will perform benchmark tests for both 18B and 28B models,
echo automatically extract optimal numSearchThreads values,
echo and update configuration files accordingly.
echo.
echo Estimated time: approximately 2~6 minutes, please wait patiently.
echo Note: Please ensure Lizzieyzy is NOT running during this process.
echo.
echo *** No manual intervention needed throughout the process, just keep this window open ***
echo.
pause
echo.

rem ========== 1/2: 18B Model Tuning ==========
echo ===================================================
echo  [1/2] Now tuning 18B model...
echo ===================================================
echo.
cd /d "%~dp0engine_18b"
powershell -ExecutionPolicy Bypass -File "%~dp0engine_18b\update_threads_18b.ps1"
echo.
echo  18B model tuning completed, now proceeding to 28B model tuning...
echo  Please do not close this window, continue waiting (approximately 1~3 minutes)
echo.

rem ========== 2/2: 28B Model Tuning ==========
echo ===================================================
echo  [2/2] Now tuning 28B model...
echo ===================================================
echo.
cd /d "%~dp0engine_28b"
powershell -ExecutionPolicy Bypass -File "%~dp0engine_28b\update_threads_28b.ps1"
echo.
echo ===================================================
echo      All tuning completed!
echo ===================================================
echo.
echo Configuration files have been updated for both models, backups saved as:
echo   engine_18b\default_gtp.cfg.bak
echo   engine_28b\default_gtp.cfg.bak
echo.
echo You can now launch Lizzieyzy and start using it!
echo.
pause
