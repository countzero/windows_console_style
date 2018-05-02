@echo off

::
:: Execute the main PowerShell script in the same window,
:: bypass the Execution Policy and keep the window
:: open after the script has finished.
::
PowerShell -NoProfile ^
           -NoExit ^
           -ExecutionPolicy Bypass ^
           -Command "& '%~dp0script\style_all_consoles.ps1'"
