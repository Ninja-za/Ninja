@echo off
setlocal enabledelayedexpansion

:login
cls
title LOGIN
mode 85, 20
color D
echo.
set /p userkey="Enter the Key: "

if "%userkey%"=="ninjaisthebest" (
    goto start
) else (
    echo Incorrect key. Try again.
    timeout /t 2 /nobreak >nul
    goto login
)

:start
POWERSHELL.EXE -Command "Add-Type -AssemblyName System.Windows.Forms; [void][System.Windows.Forms.MessageBox]::Show('Welcome to NINJA', 'NINJA', 'OK', 'Information')"

title NINJA TOOL - by ninja
mode 85, 20
cd files
chcp 65001 >nul

:banner
mode 85, 20
chcp 65001 >nul
cls
echo:  
echo:
ping localhost -n 2 >nul
echo       [35m ███[0m[95m╗   [0m[35m██[0m[95m╗[0m[35m██[0m[95m╗[0m[35m███[0m[95m╗[0m   [35m██[0m[95m╗[0m     [35m██[0m[95m╗[0m [35m█████[0m[95m╗ [0m
ping localhost -n 1 >nul
echo       [35m ████[0m[0m[95m╗[0m  [35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m████[0m[95m╗[0m  [35m██[0m[95m║[0m     [35m██[0m[95m║[0m[35m██[0m[95m╔══[0m[35m██[0m[95m╗[0m
ping localhost -n 1 >nul
echo       [35m ██[0m[95m╔[0m[35m██[0m[95m╗[0m [35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m╔[0m[35m██[0m[95m╗[0m [35m██[0m[95m║[0m     [35m██[0m[95m║[0m[35m███████[0m[95m║[0m
ping localhost -n 1 >nul
echo       [35m [35m██[0m[95m║[0m[95m╚[0m[35m██[0m[95m╗[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m[95m╚[0m[35m██[0m[95m╗[0m[35m██[0m[95m║[0m[35m██[0m   [35m██[0m[95m║[0m[35m██[0m[95m╔══[0m[35m██[0m[95m║[0m
ping localhost -n 1 >nul
echo       [35m ██[0m[95m║[0m [95m╚[0m[35m████[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m [95m╚[0m[35m████[0m[95m║[0m[95m╚[0m[35m█████[0m[95m╔╝[0m[35m██[0m[95m║[0m  [35m██[0m[95m║[0m
ping localhost -n 1 >nul
echo       [95m ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═╝[0m
echo:   [35m╔══════════════════════════════════════════════╗[0m                                  
echo:   [35m║[95m[1] ip lookup        [5] wifi pass extractor[0m[35m  ║      ╔════════════════╗[0m
echo:   [35m║[95m[2] port scanner     [6] system info dump   [0m[35m  ║[0m[35m══════║[0m[95m[9] - next page[0m [35m║[0m
echo:   [35m║[95m[3] ip grabber       [7] registory editor   [0m[35m  ║      ╚════════════════╝[0m
echo:   [35m║[95m[4] username checker [8] exit               [0m[35m  ║[0m
echo:   [35m╚══════════════════════════════════════════════╝[0m           
echo:

<nul set /p "=[35m ┌─── ([95m@%USERNAME%[0m[35m) [0m"
echo.
<nul set /p "=[35m └─► [0m"
set /p choice=

if "%choice%"=="1" goto ip_lookup
if "%choice%"=="2" goto port_scanner
if "%choice%"=="3" goto ip_grabber
if "%choice%"=="4" goto username_checker
if "%choice%"=="5" goto wifi_passwords
if "%choice%"=="6" goto system_info
if "%choice%"=="7" goto registry_editor
if "%choice%"=="8" exit
if "%choice%"=="9" goto page2

echo Invalid option. Try again.
pause
goto banner

:ip_lookup
cls
color d

echo.
<nul set /p "= ┌───(@%USERNAME%) "
echo.
echo │          
<nul set /p "= └─► "
set /p ip=Enter IP: 

color d
echo.
echo [INFO]
curl -s "https://ipinfo.io/%ip%/json"

pause
goto banner

:port_scanner
cls
color d
echo [Port Scanner]
set /p target="Enter IP: "
set /p port="Enter port: "
powershell -Command "if (Test-NetConnection -ComputerName %target% -Port %port% -InformationLevel Quiet) { Write-Host '[SUCCESS] Port %port% is OPEN on %target%' } else { Write-Host '[FAILED] Port %port% is CLOSED or filtered on %target%' }"

pause
goto :menu

:ip_grabber
cls
color d
echo [IP grabber]
set /p WEBHOOK_URL=Enter full webhook URL: "
for /f "delims=" %%i in ('powershell -Command "(Invoke-RestMethod -Uri 'https://api.ipify.org?format=text')"') do set "IP=%%i"
set "JSON={\"ip\":\"%IP%\",\"timestamp\":\"%DATE% %TIME%\"}"
powershell -Command "Invoke-RestMethod -Uri '%WEBHOOK_URL%' -Method POST -Body '%JSON%' -ContentType 'application/json'"
echo Sent IP %IP% to webhook.
pause

:username_checker
cls
color d
echo.
echo [Username Checker]
echo.
set /p username="Enter username: "

echo.

echo Checking Twitter...
curl -s -o nul -w "%%{http_code}" "https://twitter.com/%username%" > twitter_status.txt
set /p status=<twitter_status.txt
del twitter_status.txt
if "%status%"=="200" (
    echo Twitter username "%username%" exists.
) else (
    echo Twitter username "%username%" does not exist.
)

echo.

echo Checking GitHub...
curl -s -o nul -w "%%{http_code}" "https://github.com/%username%" > github_status.txt
set /p status=<github_status.txt
del github_status.txt

if "%status%"=="200" (
    echo GitHub username "%username%" exists.
) else (
    echo GitHub username "%username%" does not exist.
)

echo.

echo Checking Instagram...
curl -s -o nul -w "%%{http_code}" "https://www.instagram.com/%username%/" > instagram_status.txt
set /p status=<instagram_status.txt
del instagram_status.txt
if "%status%"=="200" (
    echo Instagram username "%username%" exists.
) else (
    echo Instagram username "%username%" does not exist.
)

echo.

echo Checking TikTok...
curl -s -o nul -w "%%{http_code}" "https://www.tiktok.com/@%username%" > tiktok_status.txt
set /p status=<tiktok_status.txt
del tiktok_status.txt
if "%status%"=="200" (
    echo TikTok username "%username%" exists.
) else (
    echo TikTok username "%username%" does not exist.
)

echo.


pause
goto banner

:wifi_passwords
cls
color d
echo [Wi-Fi Password Extractor]
echo Saved Wi-Fi Networks and Passwords:
netsh wlan show profiles | findstr "All User Profile"
set /p network="Enter Wi-Fi name: "
netsh wlan show profile "%network%" key=clear | findstr "Key Content"
pause
goto banner

:system_info
cls
color d
echo [System Info Dump]
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
wmic memorychip get capacity
wmic diskdrive get model,size
pause
goto banner

:registry_editor
cls
color d
echo [Registry Editor - Read-Only]
echo Example: HKCU\Software\Microsoft\Windows
set /p reg_path="Enter registry path: "
reg query "%reg_path%"
pause
goto banner



:page2
cls
title NINJA page[2]
echo:  
ping localhost -n 2 >nul
echo       [35m ███[0m[95m╗   [0m[35m██[0m[95m╗[0m[35m██[0m[95m╗[0m[35m███[0m[95m╗[0m   [35m██[0m[95m╗[0m     [35m██[0m[95m╗[0m [35m█████[0m[95m╗ [0m
ping localhost -n 1 >nul
echo       [35m ████[0m[0m[95m╗[0m  [35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m████[0m[95m╗[0m  [35m██[0m[95m║[0m     [35m██[0m[95m║[0m[35m██[0m[95m╔══[0m[35m██[0m[95m╗[0m
ping localhost -n 1 >nul
echo       [35m ██[0m[95m╔[0m[35m██[0m[95m╗[0m [35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m╔[0m[35m██[0m[95m╗[0m [35m██[0m[95m║[0m     [35m██[0m[95m║[0m[35m███████[0m[95m║[0m
ping localhost -n 1 >nul
echo       [35m [35m██[0m[95m║[0m[95m╚[0m[35m██[0m[95m╗[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m[95m╚[0m[35m██[0m[95m╗[0m[35m██[0m[95m║[0m[35m██[0m   [35m██[0m[95m║[0m[35m██[0m[95m╔══[0m[35m██[0m[95m║[0m
ping localhost -n 1 >nul
echo       [35m ██[0m[95m║[0m [95m╚[0m[35m████[0m[95m║[0m[35m██[0m[95m║[0m[35m██[0m[95m║[0m [95m╚[0m[35m████[0m[95m║[0m[95m╚[0m[35m█████[0m[95m╔╝[0m[35m██[0m[95m║[0m  [35m██[0m[95m║[0m
ping localhost -n 1 >nul
echo       [95m ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═╝[0m
echo:   [35m╔══════════════════════════════════════════════╗[0m                                  
echo:   [35m║[95m[10] credits          [14] ???              [0m[35m  ║      ╔════════════════╗[0m
echo:   [35m║[95m[11] github           [15] ???              [0m[35m  ║[0m[35m══════║[0m[95m[0] - next page[0m [35m║[0m
echo:   [35m║[95m[12] webhook spammer  [16] ???              [0m[35m  ║      ╚════════════════╝[0m
echo:   [35m║[95m[13] ???              [17] ???              [0m[35m  ║[0m
echo:   [35m╚══════════════════════════════════════════════╝[0m           
echo:

<nul set /p "=[35m ┌─── ([95m@%USERNAME%[0m[35m) [0m"
echo.
<nul set /p "=[35m └─► [0m"
set /p choice=

if "%choice%"=="0" goto banner
if "%choice%"=="10" goto credits
if "%choice%"=="11" goto git
if "%choice%"=="12" goto messagesender

pause

:github
start https://github.com/Ninja-za
pause
goto page2

:credits
cls
color D

setlocal enabledelayedexpansion
set count=0

:credits_loop
cls
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo.
echo ┌─────────────────────────────────────┐
echo    Made by Ninja
echo    Made For Educational Purposes Only!
echo └─────────────────────────────────────┘
echo.
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

timeout 1 /NOBREAK >nul

set /a count+=1
if !count! lss 4 goto credits_loop

endlocal
cls
goto page2

:messagesender
cls
color D
echo.
echo [Discord webhook spammer]
echo.
set /p "webhook= Enter Discord webhook URL for Message Sender: "
set /p "message= Enter the message to send: "
set /p "num_times= Enter the number of times to send the message: "

for /l %%n in (1,1,%num_times%) do (
    :: Send message to Discord webhook
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook%
)
echo Messages sent successfully.
pause
goto page2