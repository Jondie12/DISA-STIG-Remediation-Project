<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jondie Mark Autentico
    LinkedIn        : linkedin.com/in/jondiemark/
    GitHub          : github.com/jondiemark
    Date Created    : 4/20/2025
    Last Modified   : 4/20/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Define the registry path and value name
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$desiredValue = 0x00008000 # 32768 in decimal

# Check if the registry key exists, create it if necessary
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -Type DWord

# Verify the change
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Output "Updated '$valueName' to: $($currentValue.$valueName)"
