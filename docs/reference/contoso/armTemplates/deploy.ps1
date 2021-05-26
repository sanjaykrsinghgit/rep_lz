cd .\Enterprise-Scale\docs\reference\contoso\armTemplates

Connect-AzAccount

$user = Get-AzADUser -UserPrincipalName (Get-AzContext).Account

New-AzRoleAssignment -Scope '/' -RoleDefinitionName 'Owner' -ObjectId $user.Id

New-AzManagementGroupDeployment `
  -Name old-2-mg `
  -Location "uksouth" `
  -ManagementGroupId "old-3-mg" `
  -TemplateUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg.json" `
  -TemplateParameterUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg-portal-parameters.json" `
  -WhatIf

  New-AzManagementGroupDeployment `
  -Name old-4-mg `
  -Location "uksouth" `
  -ManagementGroupId "old-4-mg" `
  -TemplateUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg.json" `
  -TemplateParameterUri "https://raw.githubusercontent.com/Mahesh-MSFT/Enterprise-Scale/deploy-at-mg/docs/reference/contoso/armTemplates/es-vwan-mg-portal-parameters.json"


  remove-azroleassignment -scope / -objectId 39a368c8-d73a-4c59-9ff7-97ac13e8150a -roledefinitionname Owner

  new-azroleassignment -scope / -objectId 39a368c8-d73a-4c59-9ff7-97ac13e8150a -roledefinitionname Owner