@echo off

:: Execute the main PowerShell script in the same window, bypassing the Execution Policy.
PowerShell -NoProfile ^
           -ExecutionPolicy Bypass ^
           -File "%~dp0script\style_all_consoles.ps1"
