reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"
reg.exe add "HKU\DefaultUser\Control Panel\Bluetooth" /v "Notification Area Icon" /t REG_DWORD /d 0 /f
reg.exe unload "HKU\DefaultUser"