@echo off
pushd "%~dp0"

REM Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

setlocal enabledelayedexpansion

REM Specify the path to the CentBrowser executable
set "chromePath=chromePath\chrome.exe"
set "customURL=customURL"

REM Specify the number of profiles to open
set "numProfiles=100"

REM Loop through and open each profile
start "" "!chromePath!" --profile-directory="Default " "!customURL!"

for /l %%i in (0,1,%numProfiles%) do (
	start "" "!chromePath!" --profile-directory="Profile %%i" "!customURL!"
)

endlocal
