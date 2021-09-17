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


resource "intersight_hyperflex_vcenter_config_policy" "hx-vcenter-config-policy" {
  name        = "${var.hx_system_name}-vcenter-config-policy"
  description = "terraform - Hyperflex vCenter Configuration Policy"

  data_center = var.vcenter_data_center
  hostname    = var.vcenter_hostname
  username    = var.vcenter_username
  password    = var.vcenter_password

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.intersight_organization.results[0].moid
  }

  lifecycle {
    ignore_changes = [tags, password]
  }
}
