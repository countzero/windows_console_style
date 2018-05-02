#
# Let concfg install the custom default preset.
#
Write-Host "Installing preset..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 import ./preset/default.json --non-interactive

Write-Host "Removing overrides from the registry and shortcut files..." -ForegroundColor Green
./vendor/concfg/bin/concfg.ps1 clean

# [enum]::GetValues([System.ConsoleColor]) | Foreach-Object {Write-Host $_ -ForegroundColor $_}
