reg.exe "HKLM\SOFTWARE\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d 1 /f
reg.exe "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d 1 /f
reg.exe "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f
reg.exe "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d 1 /f
reg.exe "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableMeteredNetworkFileSync" /t REG_DWORD /d 1 /f

IF EXIST %SystemRoot%\System32\OneDriveSetup.exe del.exe /f /q %SystemRoot%\System32\OneDriveSetup.exe
IF EXIST %SystemRoot%\SysWOW64\OneDriveSetup.exe del.exe /f /q %SystemRoot%\SysWOW64\OneDriveSetup.exe