#
# Execute the styling script in the same window,
# bypass the Execution Policy and keep the window
# open after the styling script has finished.
#
Start-Process -FilePath "powershell" `
              -ArgumentList "-NoExit -File `"./script/style_all_consoles.ps1`" -ExecutionPolicy Bypass" `
              -NoNewWindow
