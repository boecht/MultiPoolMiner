REM This file will run for any algo if AlgoName.bat does not exist

@echo PreRun init file
.\nvidiaProfileInspector\nvidiaInspector.exe ^
-setPowerTarget:0,90 -setTempTarget:0,1,68 -lockVoltagePoint:0,900000 -setIlumination:0,0,0 -setIlumination:0,1,0 ^
-setPowerTarget:1,90 -setTempTarget:1,1,68 -lockVoltagePoint:1,900000 -setIlumination:1,0,0 -setIlumination:1,1,0 ^
-setPowerTarget:2,90 -setTempTarget:2,1,68 -lockVoltagePoint:2,900000 -setIlumination:2,0,0 -setIlumination:2,1,0 ^
-setPowerTarget:3,90 -setTempTarget:3,1,68 -lockVoltagePoint:3,900000 -setIlumination:3,0,0 -setIlumination:3,1,0 ^
-setPowerTarget:4,90 -setTempTarget:4,1,68 -lockVoltagePoint:4,900000 -setIlumination:4,0,0 -setIlumination:4,1,0 ^
-setPowerTarget:5,90 -setTempTarget:5,1,68 -lockVoltagePoint:5,900000 -setIlumination:5,0,0 -setIlumination:5,1,0

REM Example clock settings using nvidiaInspector update nvidiaInspector.exe path accordingly or place it in prerun directory
REM nvidiaInspector.exe -setBaseClockOffset:0,0,50 -setMemoryClockOffset:0,0,100 -setVoltageOffset:0,0,0 -setPowerTarget:0,75 -setTempTarget:0,0,83