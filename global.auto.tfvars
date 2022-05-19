global_settings = {
  default_region = "primary"
  regions = {
    primary = "southeastasia"
  }
  prefix       = "xd-trial"
  inherit_tags = true
}

resource_groups = {
  # -- For network management purpose
  network = {
    name   = "network"
    region = "primary"
  }

  # -- For managing AKS resources
  aks = {
    name   = "aks"
    region = "primary"
  }
  shared_svc = {
    name   = "shared-svc"
    region = "primary"
  }

  # -- Resource group for blob-storage
  blob_storage = {
    name = "blob-storages"
    region = "primary"
  }
}

tags = {
  "Project Name" = "SC DevOps"
}