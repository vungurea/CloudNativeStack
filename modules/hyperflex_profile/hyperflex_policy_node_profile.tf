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


data "intersight_compute_rack_unit" "hx-node" {
  for_each        = var.hx_node_profiles
  serial          = each.value.node_serial_number
}

resource "intersight_hyperflex_node_profile" "hx-node-profile-node" {
  for_each = var.hx_node_profiles

  name        = "${var.hx_system_name}${each.key}"
  description = "terraform - Hyperflex Node Profile node${each.key}"

  hxdp_mgmt_ip       = each.value.hxdp_mgmt_ip
  hypervisor_mgmt_ip = each.value.hypervisor_mgmt_ip

  assigned_server {
    object_type = "compute.RackUnit"
    moid        = data.intersight_compute_rack_unit.hx-node[each.key].results[0].moid
  }

  cluster_profile {
    moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
  }

  lifecycle {
    ignore_changes = [tags, description, hxdp_data_ip, hxdp_storage_client_ip, hypervisor_data_ip]
  }
}
