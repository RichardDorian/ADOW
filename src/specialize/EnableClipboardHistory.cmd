reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"
reg.exe add "HKU\DefaultUser\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d 1 /f
reg.exe unload "HKU\DefaultUser"