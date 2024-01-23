# Define the name of the Chrome process
$chromeProcessName = "chrome"

# Get the Chrome process
$chromeProcess = Get-Process -Name $chromeProcessName -ErrorAction SilentlyContinue

# Check if Chrome is running
if ($chromeProcess -ne $null) {
    # Get the command line arguments of the Chrome process
    $chromeCommandLine = $chromeProcess.CommandLine

    # Kill the Chrome process
    Stop-Process -Name $chromeProcessName -Force

    # Wait for a few seconds to ensure the process is terminated
    Start-Sleep -Seconds 3
}

# Reopen Chrome with all tabs from the previous session
Start-Process "chrome" -ArgumentList "--restore-last-session"