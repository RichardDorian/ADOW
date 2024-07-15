@echo off
cd C:\Program Files (x86)\Microsoft\Edge\Application
for /f "delims=" %%i in ('dir /b /a-d /s "setup.exe"') do cd /d "%%~dpi"
setup.exe -uninstall -system-level -verbose-logging -force-uninstall