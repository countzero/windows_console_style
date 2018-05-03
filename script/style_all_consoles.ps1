Write-Host "Installing preset..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 import ./preset/default.json --non-interactive

Write-Host "Removing overrides from the registry and shortcut files..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 clean

Write-Host "Starting styled PowerShell instance..." -ForegroundColor Green
Start-Process "PowerShell" -ArgumentList "-NoExit `
                                          -NoProfile `
                                          -ExecutionPolicy Bypass `
                                          -File ${PSScriptRoot}\list_all_colors.ps1"

Write-Host "Starting styled CMD instance..." -ForegroundColor Green
Start-Process "CMD" -ArgumentList "/k ${PSScriptRoot}\list_all_colors.cmd"

Write-Host "Closing automatically in 10 seconds..." -ForegroundColor Green
Start-Sleep -Seconds 10
