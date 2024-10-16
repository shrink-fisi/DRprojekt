New-Item -Path "C:\DFSRoots\Daten" -ItemType Directory

New-SmbShare -Name "Daten" -Path "C:\DFSRoots\Daten" -FullAccess Jeder

New-DfsnRoot -TargetPath "\\verwaltung-dfs\Daten" -Type DomainV2 -Path "\\ausfall-V.internal\Daten"

New-DfsnFolder -Path '\\ausfall-V.internal\Daten\Archiv' -TargetPath '\\verwaltung-dfs\Daten\Archiv' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-V.internal\Daten\Austauschordner' -TargetPath '\\verwaltung-dfs\Daten\Austauschordner' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-V.internal\Daten\P-Bereich-Dozenten' -TargetPath '\\verwaltung-dfs\Daten\P-Bereich-Dozenten' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-V.internal\Daten\QM-Bereich' -TargetPath '\\verwaltung-dfs\Daten\QM-Bereich' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-V.internal\Daten\S-Bereich' -TargetPath '\\verwaltung-dfs\Daten\S-Bereich' -EnableTargetFailback $true

