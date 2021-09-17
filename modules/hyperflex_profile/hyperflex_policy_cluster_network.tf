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


resource "intersight_hyperflex_cluster_network_policy" "hx-cluster-network-policy" {
  name        = "${var.hx_system_name}-cluster-network-policy"
  description = "terraform - Hyperflex Cluster Network Policy"

  jumbo_frame  = var.jumbo_frames_enable
  uplink_speed = var.uplink_speed

  kvm_ip_range {
    start_addr = var.ip_range_kvm.start_addr
    end_addr   = var.ip_range_kvm.end_addr
    netmask    = var.ip_range_kvm.netmask
    gateway    = var.ip_range_kvm.gateway
  }

  mac_prefix_range {
    start_addr = var.mac_pool_prefix
    end_addr   = var.mac_pool_prefix
  }

  mgmt_vlan {
    name    = "${var.hx_system_name}-mgmt"
    vlan_id = var.vlan_id_mgmt
  }

  vm_migration_vlan {
    name    = "${var.hx_system_name}-vmotion"
    vlan_id = var.vlan_id_vmotion
  }

  vm_network_vlans {
    name    = "${var.hx_system_name}-vmnetwork"
    vlan_id = var.vlan_id_vmnetwork
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
