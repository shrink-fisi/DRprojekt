New-Item -Path "C:\DFSRoots\Akademie" -ItemType Directory

New-SmbShare -Name "Akademie" -Path "C:\DFSRoots\Akademie" -FullAccess Jeder

New-DfsnRoot -TargetPath "\\schulung-dfs\Akademie" -Type DomainV2 -Path "\\ausfall-S.internal\Akademie"

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA1' -TargetPath '\\schulung-dfs\Akademie\ITA1' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA2' -TargetPath '\\schulung-dfs\Akademie\ITA2' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA3' -TargetPath '\\schulung-dfs\Akademie\ITA3' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA4' -TargetPath '\\schulung-dfs\Akademie\ITA4' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA5' -TargetPath '\\schulung-dfs\Akademie\ITA5' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA6' -TargetPath '\\schulung-dfs\Akademie\ITA6' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA7' -TargetPath '\\schulung-dfs\Akademie\ITA7' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\ITA8' -TargetPath '\\schulung-dfs\Akademie\ITA8' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\Stundenpläne' -TargetPath '\\schulung-dfs\Akademie\Stundenpläne' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\Software' -TargetPath '\\schulung-dfs\Akademie\Software' -EnableTargetFailback $true

New-DfsnFolder -Path '\\ausfall-S.internal\Akademie\Dokumente' -TargetPath '\\schulung-dfs\Akademie\Dokumente' -EnableTargetFailback $true
