#####################################
##                                 ## 
##  SAVE AS UTF-8 with BOM         ##
##  Domänen-Admins funktioniert    ##
##  sonst nicht                    ##
#####################################
$password = ConvertTo-SecureString "<INSERT_YOUR_OWN_INFO_HERE>" -AsPlainText -Force
$organizationalUnit = "OU=Schulung,DC=ausfall-S,DC=internal"
$domainRoot = "DC=ausfall-S,DC=internal"
$domainName = "ausfall-S.internal"

New-ADOrganizationalUnit -Name "Schulung" -Path $domainRoot

New-ADOrganizationalUnit -Name "Dozenten" -Path $organizationalUnit

for ($i = 1; $i -le 8; $i++) {
    New-ADOrganizationalUnit -Name "ITA$i" -Path $organizationalUnit
}

for ($i = 1; $i -le 10; $i++) {
    New-ADUser -Name "Dozent$i" -UserPrincipalName "Dozent$i@$domainName" -Path "OU=Dozenten;$organizationalUnit" -AccountPassword $password -ChangePasswordAtLogon $true -Enabled $true 
}



function New-Users {
    param (
        [int]$itaZahl,
        [int]$tnZahl
    )

    for ($i = 1; $i -le $itaZahl; $i++) {
        for ($j = 0; $j -le $tnZahl; $j++) {
            $userName = "ita$i-tn$j"
            $userPrincipalName = "$userName@$domainName"
            $displayName = "User $userName"
            $description = "User $userName in ITA$i"

            New-ADUser `
                -Name $userName `
                -GivenName $userName `
                -SamAccountName $userName `
                -UserPrincipalName $userPrincipalName `
                -DisplayName $displayName `
                -Description $description `
                -Path "OU=ita$i,$organizationalUnit" `
                -AccountPassword $password `
                -ChangePasswordAtLogon $true `
                -Enabled $true
            
        }
    }
}


$itaZahl = 8
$tnZahl = 30


New-Users -itaZahl $itaZahl -tnZahl $tnZahl


$DomainAdminPassword = ConvertTo-SecureString "<INSERT_YOUR_OWN_INFO_HERE>" -AsPlainText -Force
New-ADUser -Name "<INSERT_YOUR_OWN_INFO_HERE>" -GivenName "<INSERT_YOUR_OWN_INFO_HERE>" -SamAccountName "<INSERT_YOUR_OWN_INFO_HERE>" -UserPrincipalName "<INSERT_YOUR_OWN_INFO_HERE>@$domainName" -DisplayName "<INSERT_YOUR_OWN_INFO_HERE>" -Description "Domain Admin" -AccountPassword $DomainAdminPassword -ChangePasswordAtLogon $true -Enabled $true

Add-ADGroupMember -Identity 'Domänen-Admins' -Members "<INSERT_YOUR_OWN_INFO_HERE>"
