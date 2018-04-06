REM This file will run for any algo if AlgoName.bat does not exist

@echo PreRun default file
@sleep 10

REM Example clock settings using nvidiaInspector update nvidiaInspector.exe path accordingly or place it in prerun directory
REM nvidiaInspector.exe -setBaseClockOffset:0,0,50 -setMemoryClockOffset:0,0,100 -setVoltageOffset:0,0,0 -setPowerTarget:0,75 -setTempTarget:0,0,83 
