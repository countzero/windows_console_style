# Stop on any errors.
$ErrorActionPreference = 'Stop'

# Terminate with a non-zero exit code on any errors.
trap {
    write-output $_
    exit 1
}

Write-Host "Installing console font..." -ForegroundColor Green
& "${PSScriptRoot}\install_font.ps1"

Write-Host "Installing console preset..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 import ./preset/default.json --non-interactive

Write-Host "Removing overrides from the registry and shortcut files..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 clean

Write-Host "Starting styled PowerShell console instance..." -ForegroundColor Green
Start-Process "PowerShell" -ArgumentList "-NoExit `
                                          -NoProfile `
                                          -ExecutionPolicy Bypass `
                                          -File ${PSScriptRoot}\list_all_colors.ps1"

Write-Host "Starting styled CMD console instance..." -ForegroundColor Green
Start-Process "CMD" -ArgumentList "/k ${PSScriptRoot}\list_all_colors.cmd"

Write-Host "Installation completed successfully!" -ForegroundColor Green

Read-Host "Press Enter to close this window"

# Exit with a zero exit code.
exit 0
