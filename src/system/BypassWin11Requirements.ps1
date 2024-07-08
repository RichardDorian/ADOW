# Question: Bypass Windows 11 system requirements?
# Recommended: Yes
# Core: Yes

Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassTPMCheck" -Value 1 -Force
Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassSecureBootCheck" -Value 1 -Force
Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassStorageCheck" -Value 1 -Force
Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassCPUCheck" -Value 1 -Force
Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassRAMCheck" -Value 1 -Force
Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" -Name "BypassDiskCheck" -Value 1 -Force
