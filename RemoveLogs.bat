@echo off
cd /d %~dp0
if exist "Bin\Cryptonight-Claymore\*_log.txt" del "Bin\Cryptonight-Claymore\*_log.txt"
if exist "Bin\Equihash-Claymore\*_log.txt" del "Bin\Equihash-Claymore\*_log.txt"
if exist "Bin\Ethash-Claymore\*_log.txt" del "Bin\Ethash-Claymore\*_log.txt"
for /f "skip=1 eol=: delims=" %%F in ('dir /b /o-d "Logs\*.txt"') do @del "Logs\%%F"
ECHO All existing log files have been successfully deleted.
