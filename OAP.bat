@echo off
pushd "%~dp0"
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
