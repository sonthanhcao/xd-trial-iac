variable "resource_groups" {
  default = {}
}

variable "keyvaults" {
  default = {}
}
variable "global_settings" {
  default = {}
}
#####################################
##    Networking
#####################################
variable "vnets" {
  default = {}
}
variable "public_ip_addresses" {
  default = {}
}
variable "nat_gateways" {
  default = {}
}
variable "azurerm_routes" {
  default = {}
}
variable "route_tables" {
  default = {}
}
variable "network_security_group_definition" {
  default = {}
}

variable "aks_clusters" {
  default = {}
}
variable "virtual_machines" {
  default = {}
}

# Identities 
variable "managed_identities" {
  default = {}
}
variable "azuread" {
  default = {}
}
variable "role_mapping" {
  default = {}
}
variable "custom_role_definitions" {
  default = {}
}

variable "azure_container_registries" {
  default = {}
}

#####################################
##    Logging
#####################################

variable "diagnostics" {
  default = {}
}
variable "diagnostic_log_analytics" {
  default = {}
}
###
variable "diagnostic_storage_accounts" {
  default = {}
}
variable "storage_accounts" {
  default = {}
}
variable "tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
  default = {
    "Project Name" = "MOCA"
  }
}