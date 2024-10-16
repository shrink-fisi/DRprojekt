$backupPath = "C:\temp\gpo backup"

$gpoNames = @(
    "Drucker verbindenITA1",
    "Drucker verbindenITA2",
    "Drucker verbindenITA3",
    "Drucker verbindenITA4",
    "Drucker verbindenITA5",
    "Drucker verbindenITA6",
    "Drucker verbindenITA7",
    "Drucker verbindenITA8",
    "Drucker verbinden (Subnetz gefiltert)",
    "DFS-Mapping"
)

$sourceDomain = "<INSERT_YOUR_OWN_INFO_HERE>"
$targetDomain = "ausfall-S.internal"

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
