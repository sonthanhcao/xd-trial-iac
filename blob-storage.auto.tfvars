storage_accounts = {
  gitlab = {
    name                     = "gitlab-cache"
    resource_group_key       = "blob_storage"
    account_kind             = "BlobStorage" # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    account_tier             = "Standard"    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_replication_type = "LRS"         #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    is_hns_enabled           = true          # Enable HNS to use SFTP
    tags = {
      environment = "dev"
      team        = "DevOps"
      ##
    }

    # private_endpoints = {
    #   # Require enforce_private_link_endpoint_network_policies set to true on the subnet
    #   gitlab = {
    #     name               = "gitlab-private-link"
    #     resource_group_key = "blob_storage"

    #     vnet_key   = "devops"
    #     subnet_key = "az_services"

    #     private_service_connection = {
    #       name                 = "gitlab-private-psc"
    #       is_manual_connection = false
    #       subresource_names    = ["blob"]
    #     }
    #   }
    # }

  }
  ### Storage Account for Prometheus Thanos


  thanos = {
    name                     = "thanos"
    resource_group_key       = "blob_storage"
    account_kind             = "BlobStorage" # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    account_tier             = "Standard"    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_replication_type = "LRS"         #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    is_hns_enabled           = true          # Enable HNS to use SFTP
    tags = {
      environment = "dev"
      team        = "DevOps"
      ##
    }

    # private_endpoints = {
    #   # Require enforce_private_link_endpoint_network_policies set to true on the subnet
    #   thanos = {
    #     name               = "thanos-private-link"
    #     resource_group_key = "blob_storage"

    #     vnet_key   = "devops"
    #     subnet_key = "az_services"

    #     private_service_connection = {
    #       name                 = "thanos-private-psc"
    #       is_manual_connection = false
    #       subresource_names    = ["blob"]
    #     }
    #   }
    # }

  }

}
