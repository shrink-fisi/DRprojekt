$backupPath = "C:\temp\gpo backup"

$gpoNames = @(
    "Drucker verbindenVerwaltung",
    "DFS-Mapping"
)

$sourceDomain = "ausfall-V.internal"
$targetDomain = "ausfall-V.internal"

foreach ($gpoName in $gpoNames) {
    try {
        New-GPO -Name $gpoName -ErrorAction Stop
    }
    catch {
		Write-Host "Error"
        continue
    }

    try {
        Import-GPO -BackupGpoName $gpoName -Path $backupPath -TargetName $gpoName -ErrorAction Stop
    }
    catch {
        Write-Host "Error"
    }
}
