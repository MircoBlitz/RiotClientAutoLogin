@echo off
setlocal enabledelayedexpansion

:: Display available login files
echo Available login profiles:
set /a count=0
for %%f in (logins\*) do (
    set /a count+=1
    echo !count!. %%~nxf
)

:: Get user selection
set /p selection=Enter profile number: 
set /a selected=0
for %%f in (logins\*) do (
    set /a selected+=1
    if !selected!==!selection! set "selected_file=%%f"
)

:: Extract credentials from selected file
for /f "tokens=1,2 delims==" %%a in ('type "!selected_file!"') do (
    if "%%a"=="GAME" set "GAME=%%b"
    if "%%a"=="GAMEUSER" set "GAMEUSER=%%b"
    if "%%a"=="GAMEPWD" set "GAMEPWD=%%b"
)

:: Kill any running Riot Client processes
echo Closing Riot Client...
taskkill /F /IM "RiotClientServices.exe" 2>nul
taskkill /F /IM "LeagueClient.exe" 2>nul
taskkill /F /IM "RiotClientUx.exe" 2>nul
taskkill /F /IM "VALORANT.exe" 2>nul

:: Wait to ensure processes are closed
timeout /t 2 /nobreak >nul

:: Clear Riot Client credentials
echo Clearing login credentials...
rmdir /s /q "%LocalAppData%\Riot Games\Riot Client\Data" 2>nul

:: Wait for cleanup
timeout /t 1 /nobreak >nul

:: Launch appropriate game based on GAME value
echo Launching !GAME!...
if /i "!GAME!"=="lol" (
    start "" "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=league_of_legends --launch-patchline=live
) else if /i "!GAME!"=="val" (
    start "" "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live
) else (
    echo Unknown game type: !GAME!
    exit /b
)

:: Wait for the application to start
timeout /t 5 /nobreak >nul

:: Run auto-login with credentials
powershell -ExecutionPolicy Bypass -File "auto_login.ps1" -Username "!GAMEUSER!" -Password "!GAMEPWD!"
