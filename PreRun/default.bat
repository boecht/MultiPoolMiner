REM This file will run for any algo if AlgoName.bat does not exist

@echo PreRun default file
.\nvidiaProfileInspector\nvidiaInspector.exe ^
-setBaseClockOffset:0,0,180 -setMemoryClockOffset:0,0,650 ^
-setBaseClockOffset:1,0,150 -setMemoryClockOffset:1,0,650 ^
-setBaseClockOffset:2,0,150 -setMemoryClockOffset:2,0,600 ^
-setBaseClockOffset:3,0,200 -setMemoryClockOffset:3,0,600 ^
-setBaseClockOffset:4,0,150 -setMemoryClockOffset:4,0,550 ^
-setBaseClockOffset:5,0,220 -setMemoryClockOffset:5,0,650

REM Example clock settings using nvidiaInspector update nvidiaInspector.exe path accordingly or place it in prerun directory
REM nvidiaInspector.exe -setBaseClockOffset:0,0,50 -setMemoryClockOffset:0,0,100 -setVoltageOffset:0,0,0 -setPowerTarget:0,75 -setTempTarget:0,0,83