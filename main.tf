# https://github.com/aztfmod/terraform-azurerm-caf/commit/4c3965a7385ff6cf28b8894dbd0f94a56d117ae3
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.5.0"

  providers = {
    azurerm.vhub = azurerm.vhub
  }

  global_settings = var.global_settings
  resource_groups = var.resource_groups

  # azuread            = var.azuread
  managed_identities = var.managed_identities
  role_mapping                = var.role_mapping
  custom_role_definitions     = var.custom_role_definitions
  # azuread_apps                = var.azuread_apps
  storage_accounts            = var.storage_accounts

  networking = {
    vnets                             = var.vnets
    network_security_group_definition = var.network_security_group_definition
    # public_ip_addresses                 = var.public_ip_addresses
    # route_tables = var.route_tables
    # azurerm_routes = var.azurerm_routes
    # Nat GateWay
    # nat_gateways                        = var.nat_gateways
  }
  compute = {
    # Create DevOps AKS Cluster
    aks_clusters               = var.aks_clusters
    # azure_container_registries = var.azure_container_registries
  }
  # diagnostics = var.diagnostics
  # diagnostics = {
  #   # Get the diagnostics settings of services to create
  #   diagnostic_log_analytics = var.diagnostic_log_analytics
  #   diagnostic_storage_accounts = var.diagnostic_storage_accounts
  # }
  tags = var.tags
}


# resource "null_resource" "aks_enable_virtualnode" {
#   provisioner "local-exec" {
#     command = "az aks enable-addons --resource-group sc-devops-rg-aks --name sc-devops-aks-primary --addons virtual-node --subnet-name sc-devops-snet-aci"
#   }
# }
