<#
.SYNOPSIS
Simulated malicious script for EDR testing purposes.
.DESCRIPTION
Mimics credential dumping behavior without actually performing any malicious actions.
#>

# dimp lsass like data
Function Simulate-LsassDump {
    Write-Output "Simulating LSASS memory dump..."
    Start-Sleep -Seconds 2
    $lsassData = @"
Process: lsass.exe
PID: 1234
Memory Dump: [Simulated Data Stream]
-------------------------------------
Username: admin
Password: P@ssw0rd
Domain: EXAMPLE
-------------------------------------
"@
    Write-Output $lsassData
}

# in memory execution
Function Simulate-InMemoryExecution {
    Write-Output "Simulating in-memory script execution..."
    Start-Sleep -Seconds 2
    $script = {
        Write-Host "This is a simulated payload running in memory."
    }
    Invoke-Command -ScriptBlock $script
}

# cred harvesting
Function Simulate-CredentialHarvesting {
    Write-Output "Simulating credential harvesting via WMI..."
    Start-Sleep -Seconds 2
    Get-WmiObject -Class Win32_Account | Select-Object Name, Domain
}

# execute the simulations
Simulate-LsassDump
Simulate-InMemoryExecution
Simulate-CredentialHarvesting

Write-Output "Simulated malicious activity completed."
