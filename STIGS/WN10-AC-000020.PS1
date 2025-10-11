<#
.SYNOPSIS
    # Configures local password policy to remember the last 24 passwords (Enforce password history)

.STIG RATIONALE
    # Prevents users from cycling back to old passwords, reducing the risk of reuse and weak password practices.
.NOTES
    Author          : Kokui Agbenu
    LinkedIn        : linkedin.com/in/kokuiagbenu/
    GitHub          : github.com/kokuiagbenu
    Date Created    : 11-10-2025
    Last Modified   : 11-10-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-AC-000020.ps1 

.SCRIPT

# Enforce password history: 24 passwords remembered
net accounts /uniquepw:24
