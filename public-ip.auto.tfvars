public_ip_addresses = {
  public_ip_nat_gateway_primary = {
    name                    = "moca-devops-nat-gateway-primary-ip"
    region                  = "primary"
    resource_group_key      = "network"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}
