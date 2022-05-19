diagnostics = {

  diagnostic_log_analytics = {
    logs_primary = {
      region             = "primary"
      name               = "primary"
      resource_group_key = "shared_svc"
    }
  }

  # diagnostics_destinations = {
  #   # Storage keys must reference the azure region name
  #   # For storage, reference "all_regions" and we will send the logs to the storage account
  #   # in the region of the deployment

  #   log_analytics = {
  #     central_logs = {
  #       // storage_account_id             = "/subscriptions/7f274791-a57a-4b43-a6f7-de31c287fafe/resourceGroups/moca-devops-rg-blob-storages/providers/Microsoft.Storage/storageAccounts/mocadevopsstlog"
  #       log_analytics_key              = "logs_primary"
  #       log_analytics_destination_type = "Dedicated"    # When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table.
  #       # log_analytics_resource_id      = "/subscriptions/c50abfab-96bd-4073-99dc-d4c19c34624a/resourceGroups/sc-devops-rg-shared-svc/providers/Microsoft.OperationalInsights/workspaces/sc-devops-log-primary"
  #     }
  #   }
  # }

  # diagnostics_definition = {
  #   networking_all = {
  #     name = "network_logs_and_metrics"
  #     categories = {
  #       log = [
  #         # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["VMProtectionAlerts", true, false, 7],
  #       ]
  #       metric = [
  #         #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["AllMetrics", true, false, 7],
  #       ]
  #     }
  #   }
  #   public_ip_address = {
  #     name = "pip_logs_and_metrics"
  #     categories = {
  #       log = [
  #         # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["DDoSProtectionNotifications", true, false, 7],
  #         ["DDoSMitigationFlowLogs", true, false, 7],
  #         ["DDoSMitigationReports", true, false, 7],
  #       ]
  #       metric = [
  #         #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["AllMetrics", true, false, 7],
  #       ]
  #     }
  #   }
  #   azure_container_registry = {
  #     name = "acr_logs_and_metrics"
  #     categories = {
  #       log = [
  #         # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["ContainerRegistryRepositoryEvents", true, false, 7],
  #         ["ContainerRegistryLoginEvents", true, false, 7],
  #       ]
  #       metric = [
  #         #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["AllMetrics", true, false, 7],
  #       ]
  #     }
  #   }
  #   azure_kubernetes_cluster = {
  #     name = "aks_logs_and_metrics"
  #     categories = {
  #       log = [
  #         # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["kube-apiserver", true, false, 7],
  #         ["kube-audit", true, false, 7],
  #         ["kube-audit-admin", true, false, 7],
  #         ["kube-controller-manager", true, false, 7],
  #         ["kube-scheduler", true, false, 7],
  #         ["cluster-autoscaler", true, false, 7],
  #         ["guard", true, false, 7],
  #       ]
  #       metric = [
  #         #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
  #         ["AllMetrics", true, false, 7],
  #       ]
  #     }
  #   }
  # }

}

