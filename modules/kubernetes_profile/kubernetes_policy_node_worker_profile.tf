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

resource "intersight_kubernetes_node_group_profile" "worker-node-profile" {
  name        = "${var.cluster_name}-worker-node-profile"
  description = "terraform - Kubernetes Worker Node Profile"

  node_type   = "Worker"
  desiredsize = var.worker_desired_size
  maxsize     = var.worker_max_size
  minsize     = var.worker_min_size

  ip_pools {
    object_type = "ippool.Pool"
    moid        = intersight_ippool_pool.ippool.moid
  }

  kubernetes_version {
    object_type = "kubernetes.VersionPolicy"
    moid        = intersight_kubernetes_version_policy.kubernetes-version-policy.moid
  }

  cluster_profile {
    object_type = "kubernetes.ClusterProfile"
    moid        = intersight_kubernetes_cluster_profile.kubernetes-cluster-profile.moid
  }

  lifecycle {
    ignore_changes = [tags]
  }
}