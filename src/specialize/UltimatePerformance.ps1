$guid = New-Guid
powercfg /DuplicateScheme e9a42b02-d5df-448d-aa00-03f14749eb61 $guid
powercfg /SetActive $guid
