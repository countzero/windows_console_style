clear

Write-Host "Listing all PowerShell colors... `n"

[enum]::GetValues([System.ConsoleColor]) | Foreach-Object {Write-Host $_ -ForegroundColor $_}

Write-Host ""
