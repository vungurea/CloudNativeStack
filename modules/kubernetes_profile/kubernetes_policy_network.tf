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

resource "intersight_kubernetes_network_policy" "network-policy" {
  name        = "${var.cluster_name}-network-policy"
  description = "terraform - Kubernetes Network Policy"

  pod_network_cidr = var.pod_cidr
  service_cidr     = var.service_cidr
  cni_type         = var.cni_type

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags]
  }
}