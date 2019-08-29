@echo off&color a&mode con: cols=90 lines=29
cls
pushd "%~dp0"
title Tigoca Installer
fltmc >nul 2>&1 || (
 echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\tigocagetadmin.vbs"
	echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\tigocagetadmin.vbs"
	"%temp%\tigocagetadmin.vbs"
	del /f /q "%temp%\tigocagetadmin.vbs"
	exit /b
)
REG QUERY "HKU\S-1-5-19" >NUL 2>&1 && (
GOTO InstallWindows
) || (
echo Right click and run as administrator...
echo.
pause
GOTO exit
)

:InstallWindows
cls
echo Tigoca Installer v1.0.0
echo.
echo Public: Togoca team
echo Author: Nguyen Quoc Huy
echo Co-author: Nguyen Kha Thi
echo.
echo.
echo Please do NOT press anything during the installation.
echo.
timeout 5

cls
echo Tigoca Installer
echo ________________________________________________________
echo 0'/.
echo ________________________________________________________
echo.
echo Creating program directory
echo.
mkdir "C:\Program Files\Tigoca"

cls
echo Tigoca Installer
echo ________________________________________________________
echo =====10'/.
echo ________________________________________________________
echo.
echo Disabling Windows Defender
echo.
powershell Set-MpPreference -DisableRealtimeMonitoring $true

cls
echo Tigoca Installer
echo ________________________________________________________
echo ==========20'/.
echo ________________________________________________________
echo.
echo Adding program directory to Windows Defender exclusion list
echo.
powershell Add-MpPreference -ExclusionPath 'C:\Program Files\Tigoca'

cls
echo Tigoca Install
echo ________________________________________________________
echo ===============30'/.
echo ________________________________________________________
echo.
echo Downloading program
echo.
powershell (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/khathisoft/tigoca/master/tigoca.exe','C:\Program Files\Tigoca\Tigoca.exe')

cls
echo Tigoca Install
echo ________________________________________________________
echo ===================================70'/.
echo ________________________________________________________
echo.
echo Download program complete
echo.

cls
echo Tigoca Install
echo ________________________________________________________
echo ========================================80'/.
echo ________________________________________________________
echo.
echo Enabling Windows Defender
echo.
powershell Set-MpPreference -DisableRealtimeMonitoring $false

cls
echo Tigoca Install
echo ________________________________________________________
echo =============================================90'/.
echo ________________________________________________________
echo.
echo Creating shorcut
echo.
mklink "%userprofile%\Desktop\Tigoca" "C:\Program Files\Tigoca\Tigoca.exe"


cls
echo Tigoca Install
echo ________________________________________________________
echo ==================================================100'/.
echo ________________________________________________________
echo.
echo Install complete.
echo.
timeout 2

cls
echo Tigoca Install
echo ______________
echo.
echo Thank you for trusting us.
echo.
echo https://tigocasoftware.wordpress.com
echo.
timeout 3
GOTO exit

:Exit
Exit