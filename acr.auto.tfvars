azure_container_registries = {
  acr = {
    name               = "main"
    resource_group_key = "shared_svc"
    sku                = "Premium" # "Standard" # "Premium" #"Basic"
    diagnostic_profiles = {
      operations = {
        name             = "acr_logs"
        definition_key   = "azure_container_registry"
        destination_type = "log_analytics"
        destination_key  = "logs_primary"
      }
    }
    
    # Private endpoint only avaiable for Premium ACR
    private_endpoints = {
      # Require enforce_private_link_endpoint_network_policies set to true on the subnet
      devops_vnet_aks_re1_acr = {
        name               = "devops-vnet-acr-private-link"
        resource_group_key = "aks"

        # lz_key     = "networking_spoke_aks"
        vnet_key   = "devops"
        subnet_key = "az_services"

        private_service_connection = {
          name                 = "devops-vnet-acr-private-psc"
          is_manual_connection = false
          subresource_names    = ["registry"]
        }
      }
    }

  }
}