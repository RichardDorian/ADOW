# Question: Add and enable Ultimate Performance power plan?
# Recommended: No
# Core: Yes

$guid = New-Guid
powercfg /DuplicateScheme e9a42b02-d5df-448d-aa00-03f14749eb61 $guid
powercfg /SetActive $guid
