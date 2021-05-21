cd .\Enterprise-Scale\docs\reference\contoso\armTemplates

Connect-AzAccount

$user = Get-AzADUser -UserPrincipalName (Get-AzContext).Account

New-AzRoleAssignment -Scope '/' -RoleDefinitionName 'Owner' -ObjectId $user.Id

New-AzManagementGroupDeployment `
  -Name demoMGDeployment `
  -Location "UK South" `
  -ManagementGroupId "old-mg" `
  -TemplateFile "es-vwan-mg.json" `
  -TemplateParameterFile "es-vwan-mg-portal-parameters.json"