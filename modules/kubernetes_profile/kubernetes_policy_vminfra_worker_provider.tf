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

resource "intersight_kubernetes_virtual_machine_infrastructure_provider" "vminfra-worker-provider-policy" {
  name        = "${var.cluster_name}-vminfra-worker-node-profile"
  description = "terraform - Kubernetes VM Infra Provider Policy"

  node_group {
    moid = intersight_kubernetes_node_group_profile.worker-node-profile.moid
  }

  instance_type {
    moid = intersight_kubernetes_virtual_machine_instance_type.vminstance-type-policy.moid
  }

  infra_config_policy {
    moid = intersight_kubernetes_virtual_machine_infra_config_policy.vminfra-config-policy.moid
  }

  lifecycle {
    ignore_changes = [tags, name]
  }
}