<#
.SYNOPSIS
    # Ensures Windows\Personalization registry path exists and sets NoLockScreenCamera (DWORD=1) to disable camera on the lock screen per STIG compliance


.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 06-10-2025
    Last Modified   : 06-10-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\__remediation_template(WN10-CC-000005).ps1 
#>

# Define the registry path for Personalization policy
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update NoLockScreenCamera as DWORD=1
New-ItemProperty -Path $RegPath -Name "NoLockScreenCamera" -Value 1 -PropertyType DWord -Force

# Verify the value (should return 1 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object NoLockScreenCamera
