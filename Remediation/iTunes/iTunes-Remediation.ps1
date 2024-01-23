#Software Remediation Script to update the software
#Author: John Bryntze
#Date: 6th January 2023

#Help System to find winget.exe
$WinGetResolve = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.21.3482.0_x64__8wekyb3d8bbwe\winget.exe"
$WinGetPathExe = $WinGetResolve[-1].Path

$WinGetPath = Split-Path -Path $WinGetPathExe -Parent
set-location $WinGetPath

#Variables
$AppID = "Apple.iTunes"

#Run upgrade of the software
.\winget.exe upgrade -e --id $AppID --silent --accept-package-agreements --accept-source-agreements