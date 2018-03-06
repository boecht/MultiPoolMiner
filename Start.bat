@cd /d %~dp0

@setx GPU_FORCE_64BIT_PTR 1
@setx GPU_MAX_HEAP_SIZE 100
@setx GPU_USE_SYNC_OBJECTS 1
@setx GPU_MAX_ALLOC_PERCENT 100
@setx GPU_SINGLE_ALLOC_PERCENT 100

set "command=& .\multipoolminer.ps1 -wallet 18qAwwg11ZqsRyB32y686kyNTKVZ6emMoW -username boecht -workername %COMPUTERNAME% -region europe -currency btc,usd,eur -type nvidia -watchdog -interval 90 -minerstatusurl https://multipoolminer.io/monitor/miner.php -switchingprevention 5 -ExcludeAlgorithm CryptoNight,C11,DecredNiceHash,Groestl,Blakecoin,MyriadGroestl,Pascal,Lbry,SiaNiceHash -ExcludeMinerName CcminerKlaust,Prospector,XmrigNvidia"

RemoveLogs.bat

start pwsh -noexit -executionpolicy bypass -command "& .\reader.ps1 -log 'MultiPoolMiner_\d\d\d\d-\d\d-\d\d\.txt' -sort '^[^_]*_' -quickstart"

pwsh -noexit -executionpolicy bypass -windowstyle maximized -command "%command%"

@pause
