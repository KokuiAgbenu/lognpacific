<#
.SYNOPSIS
    # Ensures the Power\PowerSettings registry path exists and sets DCSettingIndex (DWORD=1) under {0e796bdb-100d-47d6-a2d5-f7d2daa51f51} to enforce STIG compliance

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/okuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 06-10-2025
    Last Modified   : 06-10-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\__remediation_template(WN10-CC-000145).ps1 
#>

# Define the full registry path for the STIG
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update DCSettingIndex as DWORD=1
New-ItemProperty -Path $RegPath -Name "DCSettingIndex" -Value 1 -PropertyType DWord -Force

# Verify the value (should return 1 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object DCSettingIndex
