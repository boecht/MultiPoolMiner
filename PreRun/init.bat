REM This file will run once after starting MultiPoolMiner
REM MSI, Zotac, MSI, Zotac, Gigabyte, Gigabyte

@echo PreRun init file
.\nvidiaProfileInspector\nvidiaInspector.exe ^
-setPowerTarget:0,83 -setTempTarget:0,1,68 -setFanSpeed:0,75 -lockVoltagePoint:0,900000 -setIlumination:0,0,0 -setIlumination:0,1,0 ^
-setPowerTarget:1,76 -setTempTarget:1,1,72 -setFanSpeed:1,90 -lockVoltagePoint:1,900000 -setIlumination:1,0,0 -setIlumination:1,1,0 ^
-setPowerTarget:2,83 -setTempTarget:2,1,68 -setFanSpeed:2,70 -lockVoltagePoint:2,900000 -setIlumination:2,0,0 -setIlumination:2,1,0 ^
-setPowerTarget:3,97 -setTempTarget:3,1,68 -setFanSpeed:3,75 -lockVoltagePoint:3,900000 -setIlumination:3,0,0 -setIlumination:3,1,0 ^
-setPowerTarget:4,88 -setTempTarget:4,1,68 -setFanSpeed:4,65 -lockVoltagePoint:4,900000 -setIlumination:4,0,0 -setIlumination:4,1,0 ^
-setPowerTarget:5,88 -setTempTarget:5,1,68 -setFanSpeed:5,65 -lockVoltagePoint:5,900000 -setIlumination:5,0,0 -setIlumination:5,1,0
