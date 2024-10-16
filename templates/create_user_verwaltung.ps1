#####################################
##                                 ## 
##  SAVE AS UTF-8 with BOM         ##
##  Domänen-Admins funktioniert    ##
##  sonst nicht                    ##
#####################################
$password = ConvertTo-SecureString "<INSERT_YOUR_OWN_INFO_HERE>" -AsPlainText -Force
$organizationalUnit = "OU=Verwaltung,DC=ausfall-V,DC=internal"
$domainRoot = "DC=ausfall-S,DC=internal"
$domainName = "ausfall-V.internal"

New-ADOrganizationalUnit -Name "Verwaltung" -Path $domainRoot

for ($i = 1; $i -le 10; $i++) {
    New-ADUser -Name "Verwaltung$i" -UserPrincipalName "Verwaltung$i@$domainName" -Path "OU=Verwaltung;$organizationalUnit" -AccountPassword $password -ChangePasswordAtLogon $true -Enabled $true 
}

$DomainAdminPassword = ConvertTo-SecureString "<INSERT_YOUR_OWN_INFO_HERE>" -AsPlainText -Force
New-ADUser -Name "<INSERT_YOUR_OWN_INFO_HERE>" -GivenName "<INSERT_YOUR_OWN_INFO_HERE>" -SamAccountName "<INSERT_YOUR_OWN_INFO_HERE>" -UserPrincipalName "<INSERT_YOUR_OWN_INFO_HERE>@$domainName" -DisplayName "<INSERT_YOUR_OWN_INFO_HERE>" -Description "Domain Admin" -AccountPassword $DomainAdminPassword -ChangePasswordAtLogon $true -Enabled $true

Add-ADGroupMember -Identity 'Domänen-Admins' -Members "<INSERT_YOUR_OWN_INFO_HERE>"
