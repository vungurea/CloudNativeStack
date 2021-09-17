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

resource "intersight_kubernetes_cluster_profile" "kubernetes-cluster-profile" {
  #name        = "${var.cluster_name}"
  name        =  var.cluster_name
  description = "terraform - Kubernetes Cluster Profile"

  action              = var.cluster_profile_action
  wait_for_completion = var.wait_for_completion

  cluster_ip_pools {
    object_type = "ippool.Pool"
    moid        = intersight_ippool_pool.ippool.moid
  }

  management_config {
    load_balancer_count = var.load_balancer_count
    ssh_user = var.ssh_user
    ssh_keys = var.ssh_keys
  }
  
  net_config {
    moid = intersight_kubernetes_network_policy.network-policy.moid
  }
  
  sys_config {
    moid = intersight_kubernetes_sys_config_policy.kubernetes-sys-config-policy.moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags]
  }
}