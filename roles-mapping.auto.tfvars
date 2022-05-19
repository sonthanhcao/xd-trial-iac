#
# Services supported: subscriptions, storage accounts and resource groups
# Can assign roles to: AD groups, AD object ID, AD applications, Managed identities
#
role_mapping = {
  custom_role_mapping = {}

  built_in_role_mapping = {
    resource_groups = {
      network = {
        "Network Contributor" = {
          # azuread_groups = {
          #   keys = ["aks_admins"]
          # }
          # logged_in = {
          #   keys = ["user"]
          # }
          managed_identities = {
            keys = ["aks_usermsi"]
          }
        }

      }

    }
    # ###
    # aks_clusters = {
    #   primary = {
    #     "Azure Kubernetes Service Cluster Admin Role" = {
    #       azuread_groups = {
    #         keys = ["devops"]
    #       }
    #       logged_in = {
    #         keys = ["user"]
    #       }
    #       # managed_identities = {
    #       #   keys = ["jumpbox"]
    #       # }
    #     }
    #   }
    # }
    # ###
  }
}