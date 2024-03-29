provider "tfe" {
  token    = var.token  
}

# Terraform workspace
resource "tfe_workspace" "test" {
  name = "test-tfe-provider3"
  organization = "ddenov"
}

resource "tfe_variable" "pcb_evars" {
  for_each = var.envvarslist
  key = each.key
  value = each.value
  category = "env"
  workspace_id = tfe_workspace.test.id
}
