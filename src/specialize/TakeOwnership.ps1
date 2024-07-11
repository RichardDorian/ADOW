# Author: Couleur
# https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Add-ContextMenu.ps1

"*", "Directory" | ForEach-Object {
  New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell\runas"
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas" -Name "(Default)" -Value "Take Ownership"
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas" -Name "NoWorkingDirectory" -Value ""
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas" -Name "HasLUAShield" -Value ""
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas" -Name "Position" -Value "Middle"
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas" -Name "AppliesTo" -Value "NOT (System.ItemPathDisplay:=`"$env:HOMEDRIVE\`")"

  New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell\runas\command"
  $Command = 'cmd.exe /c title Taking ownership.. & mode con:lines=30 cols=150 & takeown /f "%1" && icacls "%1" /grant administrators:F & timeout 2 >nul'
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas\command" -Name "(Default)" -Value $Command
  Set-ItemProperty -LiteralPath "Registry::HKEY_CLASSES_ROOT\$_\shell\runas\command" -Name "IsolatedCommand" -Value $Command
}
