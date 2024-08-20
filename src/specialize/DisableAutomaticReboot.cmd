reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetActiveHours" /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 5 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "IncludeRecommendedUpdates" /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d 1 /f