REM This file will run each interval before saving the hash rate and check if all GPUs are still available
REM In case they are not, it will trigger a reboot

@echo Check GPU file
FOR /F "delims=ß" %%G IN ('C:\PROGRA~1\NVIDIA~1\NVSMI\nvidia-smi.exe -L ^| find /C /I "(UUID:"') DO IF %%G LSS 6 shutdown /r
