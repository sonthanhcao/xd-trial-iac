
route_tables = {
  # no_internet = {
  #   name               = "no_internet"
  #   resource_group_key = "network"
  # }

  azure_fw = {
    name               = "azure-fw"
    resource_group_key = "network"
  }
}

azurerm_routes = {
  gateway = {
    name               = "special_route"
    resource_group_key = "network"
    route_table_key    = "azure_fw"
    address_prefix     = "0.0.0.0/0"
    next_hop_type      = "VirtualAppliance"
    next_hop_in_ip_address = "10.240.16.132"          # Azure FW Internal IP
  }
}