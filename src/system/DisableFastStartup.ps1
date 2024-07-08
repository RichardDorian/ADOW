# Question: Disable fast startup?
# Recommended: Yes
# Core: Yes

Set-ItemProperty -LiteralPath "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberBootEnabled" -Value 0 -Force
