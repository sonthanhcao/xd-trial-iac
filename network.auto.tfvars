vnets = {
  devops = {
    resource_group_key = "network"
    region             = "primary"
    vnet = {
      name          = "primary"
      address_space = ["10.242.0.0/16"]
    }
    subnets = {
      aks = {
        name    = "aks"
        cidr    = ["10.242.0.0/19"]
        enforce_private_link_endpoint_network_policies = true
        # route_table_key = "azure_fw"
      }
      vm_instances = {
        name    = "vm-instances"
        cidr    = ["10.242.48.0/21"]
      }
      az_services = {
        name = "az-services"
        cidr = ["10.242.56.0/21"]
        # Private endpoint require enforce_private_link_endpoint_network_policies set to true on the subnet
        enforce_private_link_endpoint_network_policies = true
      }
      aci = {
        name = "aci"
        cidr = ["10.242.32.0/24"]
        # Private endpoint require enforce_private_link_endpoint_network_policies set to true on the subnet
        enforce_private_link_endpoint_network_policies = true
        delegation = {
          name    = "aci"
          service_delegation = "Microsoft.ContainerInstance/containerGroups"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action"
          ]
        }
      }
      
    }
  }
}

nat_gateways = {
  nat_gateway_primary = {
    name                    = "moca-devops-nat-gateway-primary"
    region                  = "primary" #we need to use the CAF regions rather than using location value
    idle_timeout_in_minutes = 10        #optional if not defined will default to 4 minutes
    #zones                   = ["1"] #optional need to match public ip zone
    vnet_key           = "devops"
    subnet_key         = "aks"
    public_ip_key      = "public_ip_nat_gateway_primary"
    resource_group_key = "network"
  }
}