<#
.SYNOPSIS
    # Sets ConsentPromptBehaviorUser (DWORD=0) under HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System to enforce STIG compliance

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 06-10-2025
    Last Modified   : 06-10-252025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-SO-000255.ps1 
#>

# Define the registry path for UAC settings
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update ConsentPromptBehaviorUser as DWORD=0
New-ItemProperty -Path $RegPath -Name "ConsentPromptBehaviorUser" -Value 0 -PropertyType DWord -Force

# Verify the value (should return 0 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object ConsentPromptBehaviorUser
