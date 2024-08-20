reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"

reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OEMPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f

reg.exe unload "HKU\DefaultUser"

reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 0 /f