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


resource "intersight_hyperflex_cluster_profile" "hx_cluster_profile" {
  name        = "${var.hx_system_name}-hyperflex"
  description = "terraform - Hyperflex Cluster Profile"
  action      = var.cluster_profile_action

  type                = "instance"
  replication         = var.replication
  mgmt_ip_address     = var.mgmt_ip_address
  mgmt_platform       = var.hx_deployment_type
  hypervisor_type     = "ESXi"
  mac_address_prefix  = var.mac_pool_prefix
  wwxn_prefix         = ""
  host_name_prefix    = "${var.hx_system_name}-hyperflex"
  wait_for_completion = var.wait_for_completion

  storage_data_vlan {
    name    = "${var.hx_system_name}-data"
    vlan_id = var.vlan_id_data
  }

  auto_support {
    moid = intersight_hyperflex_auto_support_policy.hx-auto-support-policy.moid
  }

  cluster_network {
    moid = intersight_hyperflex_cluster_network_policy.hx-cluster-network-policy.moid
  }

  cluster_storage {
    moid = intersight_hyperflex_cluster_storage_policy.hx-cluster-storage-policy.moid
  }

  local_credential {
    moid = intersight_hyperflex_local_credential_policy.hx-local-credential-policy.moid
  }

  node_config {
    moid = intersight_hyperflex_node_config_policy.hx-node-config-policy.moid
  }

  software_version {
    moid = intersight_hyperflex_software_version_policy.hx-software-version-policy.moid
  }

  sys_config {
    moid = intersight_hyperflex_sys_config_policy.hx-sys-config-policy.moid
  }

  vcenter_config {
    moid = intersight_hyperflex_vcenter_config_policy.hx-vcenter-config-policy.moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags, data_ip_address, storage_client_ip_address, storage_client_netmask, storage_cluster_auxiliary_ip]
  }
}
