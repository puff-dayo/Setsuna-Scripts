$checkInterval = Read-Host "Enter the interval for checking battery status (in seconds)"
$checkInterval = [int]$checkInterval

$batteryModeThreshold = Read-Host "Enter the threshold for the duration in battery mode (in minutes)"
$batteryModeThreshold = [int]$batteryModeThreshold

$batteryModeStartTime = $null

$userScript = Read-Host "Enter the path to your script (e.g., C:\Scripts\MyScript.ps1)"

$logFile = Read-Host "Enter the path to your log file (leave blank for on-screen logging only)"

$enableLogging = -not [string]::IsNullOrWhiteSpace($logFile)

function LogMessage($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "${timestamp}: $message"
    Write-Host $logMessage
    if ($enableLogging) {
        Add-Content -Path $logFile -Value $logMessage
    }
}

function CheckPowerStatus {
    $batteryStatus = Get-WmiObject -Class Win32_Battery
    if ($batteryStatus.BatteryStatus -eq 1) {
        return "Battery"
    } else {
        return "AC"
    }
}

while ($true) {
    $powerStatus = CheckPowerStatus
    if ($powerStatus -eq "Battery") {
        if ($batteryModeStartTime -eq $null) {
            $batteryModeStartTime = Get-Date
            LogMessage "Switched to battery mode."
        } elseif (((Get-Date) - $batteryModeStartTime).TotalMinutes -ge $batteryModeThreshold) {
            LogMessage "Battery mode duration exceeded threshold. Running user script and shutting down."
            & $userScript
            Stop-Computer -Force
            break
        }
    } else {
        if ($batteryModeStartTime -ne $null) {
            LogMessage "Switched back to AC power."
        }
        $batteryModeStartTime = $null
    }

    Start-Sleep -Seconds $checkInterval
}
