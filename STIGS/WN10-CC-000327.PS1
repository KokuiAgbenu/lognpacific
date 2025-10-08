<#
.SYNOPSIS
    # Enables PowerShell Transcription, which logs all commands and output to a file. 

.HOW?
    # Sets EnableTranscripting (DWORD=1) under HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription to enforce STIG compliance

.STIG RATIONALE
    # Provides an auditable trail of PowerShell activity, helping detect malicious use, privilege abuse, or unauthorized changes.

.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 08-10-2025
    Last Modified   : 08-10-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000327

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000327.ps1 

.SCRIPT

# Define the registry path for PowerShell Transcription
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Ensure the registry path exists (creates parent keys if missing)
New-Item -Path $RegPath -Force | Out-Null

# Create or update EnableTranscripting as DWORD=1
New-ItemProperty -Path $RegPath -Name "EnableTranscripting" -Value 1 -PropertyType DWord -Force

# Verify the value (should return 1 if applied correctly)
Get-ItemProperty -Path $RegPath | Select-Object EnableTranscripting
