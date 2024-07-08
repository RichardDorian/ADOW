# Question: Disable Windows Defender services?
# Recommended: No
# Core: Yes

"Sense", "WdBoot", "WdFilter", "WdNisDrv", "WdNisSvc", "WinDefend" | ForEach-Object {
  Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\$_" -Name "Start" -Value 4
}