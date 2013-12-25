<#
.SYNOPSIS
Returns the field names from a separated values file, assuming the first row is header data.

.DESCRIPTION
Reads in the first line of a separated values file, splits the input using the supplied
delimiter and returns a list of field names.

.PARAMETER Path
Specifies the path to the separated values file.
.PARAMETER LiteralPath
Specifies the literal path to the separated values file.
.PARAMETER Delimiter
Specifies the single character delimiter, default is comma (,).
.EXAMPLE
Get-Fields -Path .\autouns.tsv -delimiter "`t"
Time
Entry Location
Entry
Enabled
Category
Description
Publisher
Image Path
Launch String
MD5
SHA-1
SHA-256
.EXAMPLE
Get-Fields -LiteralPath .\1102-events.tsv
Machine
Sequence
TaskCat
TimestampUtc
Source
EventId
Unknown
FQDN
Description
EventData
IP
#>
[CmdletBinding()]
Param(
    [Parameter(ParameterSetName='Path',Mandatory=$True,Position=0)]
        [string]$Path,
    [Parameter(ParameterSetName='LitPath',Mandatory=$True,Position=0)]
        [string]$LiteralPath,
    [Parameter(Mandatory=$False)]
        [char]$Delimiter=","
)

switch ($PSCmdlet.ParameterSetName) {
    Path { 
        (gc -Path $Path -TotalCount 1) -split $Delimiter
    }
    LitPath {
        (gc -LiteralPath $LiteralPath -TotalCount 1) -split $Delimiter
    }
}
