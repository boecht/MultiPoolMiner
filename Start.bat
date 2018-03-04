@cd /d %~dp0

@setx GPU_FORCE_64BIT_PTR 1
@setx GPU_MAX_HEAP_SIZE 100
@setx GPU_USE_SYNC_OBJECTS 1
@setx GPU_MAX_ALLOC_PERCENT 100
@setx GPU_SINGLE_ALLOC_PERCENT 100

start pwsh -noexit -executionpolicy bypass -command "& .\reader.ps1 -log 'MultiPoolMiner_\d\d\d\d-\d\d-\d\d\.txt' -sort '^[^_]*_' -quickstart"

pwsh -noexit -executionpolicy bypass -windowstyle maximized -command "& .\multipoolminer.ps1 -Wallet 18qAwwg11ZqsRyB32y686kyNTKVZ6emMoW -UserName boecht -WorkerName %COMPUTERNAME%"

@pause
