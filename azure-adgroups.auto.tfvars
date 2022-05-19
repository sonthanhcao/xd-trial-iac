azuread = {

azuread_groups = {

  ###
  devops = {
    name        = "devops"
    description = "DevOps Team"
    members = {
      user_principal_names = [
      "azadmin@sonthanhcaohotmail.onmicrosoft.com",
      "alice@sonthanhcaohotmail.onmicrosoft.com"
      ]
      group_names = []
      object_ids  = []
      group_keys  = []

      service_principal_keys = [
      ]
    }
    prevent_duplicate_name = false
  }
  ###
  ###
  aks_dev = {
    name        = "aks-dev"
    description = "Provide access to the AKS cluster."
    members = {
      user_principal_names = [
      "azadmin@sonthanhcaohotmail.onmicrosoft.com",
      "alice@sonthanhcaohotmail.onmicrosoft.com"
      ]
      group_names = []
      object_ids  = []
      group_keys  = []

      service_principal_keys = [
      ]
    }
    prevent_duplicate_name = false
  }
  ###
}

}

