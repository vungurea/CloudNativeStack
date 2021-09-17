# Copyright (c) 2021 Cisco and/or its affiliates.

# This software is licensed to you under the terms of the Cisco Sample
# Code License, Version 1.1 (the "License"). You may obtain a copy of the
# License at

#                https://developer.cisco.com/docs/licenses

# All use of the material herein must be in accordance with the terms of
# the License. All rights not expressly granted by the License are
# reserved. Unless required by applicable law or agreed to separately in
# writing, software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied.

data "intersight_asset_target" "infra-target" {
  name = var.infra_target["vc_hostname"]
}

resource "intersight_kubernetes_virtual_machine_infra_config_policy" "vminfra-config-policy" {
  name        = "${var.cluster_name}-vminfra-config-policy"
  description = "terraform - Kubernetes VM Infra Config Policy"

  vm_config {
    object_type = "kubernetes.EsxiVirtualMachineInfraConfig"
    interfaces  = var.infra_target_portgroup
    additional_properties = jsonencode({
      Datastore    = var.infra_target["vc_datastore"]
      Cluster      = var.infra_target["vc_dc_name"]
      Passphrase   = var.infra_target["vc_password"]
      ResourcePool = var.infra_target["vc_resource_pool"]
    })
  }

  target {
    object_type = "asset.DeviceRegistration"
    moid        = data.intersight_asset_target.infra-target.results[0].registered_device[0].moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags, vm_config]
  }
}