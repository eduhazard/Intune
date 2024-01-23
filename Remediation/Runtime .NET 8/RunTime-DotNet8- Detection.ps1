$WinGetResolve = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.21.3482.0_x64__8wekyb3d8bbwe\winget.exe"
$WinGetPathExe = $WinGetResolve[-1].Path

$WinGetPath = Split-Path -Path $WinGetPathExe -Parent
set-location $WinGetPath

#Variables
$AppID = "Microsoft.DotNet.Runtime.8"
$AppFriendlyName = ".NET Runtime 8"

#Check locally installed software version
$LocalInstalledSoftware = .\winget.exe list -e --id $AppID --accept-source-agreements

$Available = (-split $LocalInstalledSoftware[-3])[-2]

#Check if needs update
if ($Available -eq 'Available')
{
    write-host $AppFriendlyName "is installed but not the latest version, needs an update"
    exit 1
}

if ($Available -eq 'Version')
{
    write-host $AppFriendlyName "is installed and is the latest version"
    exit 0
}

if (!$Available)
{
    write-host $AppFriendlyName "VLC is not installed"
    exit 0
}