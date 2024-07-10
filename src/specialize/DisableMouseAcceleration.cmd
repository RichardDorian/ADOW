reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"
reg.exe add "HKU\DefaultUser\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 0 /f
reg.exe unload "HKU\DefaultUser"