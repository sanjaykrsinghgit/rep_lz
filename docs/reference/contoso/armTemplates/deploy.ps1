cd .\Enterprise-Scale\docs\reference\contoso\armTemplates

Connect-AzAccount

$user = Get-AzADUser -UserPrincipalName (Get-AzContext).Account

New-AzRoleAssignment -Scope '/' -RoleDefinitionName 'Owner' -ObjectId $user.Id

New-AzManagementGroupDeployment `
  -Name old-2-mg `
  -Location "uksouth" `
  -ManagementGroupId "old-mg" `
  -TemplateUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg.json" `
  -TemplateParameterUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg-portal-parameters.json" `
  -WhatIf

  New-AzManagementGroupDeployment `
  -Name old-2-mg `
  -Location "uksouth" `
  -ManagementGroupId "old-mg" `
  -TemplateUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg.json" `
  -TemplateParameterUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg-portal-parameters.json"