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


# Module variables definition starts here

variable "org_name" {
  type    = string
  default = null
}

variable "cluster_profile_action" {
  type = string
}

variable "hx_system_name" {
  type = string
}

variable "hx_deployment_type" {
  type = string
}

variable "replication" {
  type = number
}

variable "server_firmware_version" {
  type = string
}

variable "hxdp_version" {
  type = string
}

variable "mgmt_ip_address" {
  type = string
}

variable "dns_servers" {
  type = list(string)
}

variable "ntp_servers" {
  type = list(string)
}

variable "dns_domain_name" {
  type = string
}

variable "timezone" {
  type = string
}

variable "mac_pool_prefix" {
  type = string
}

variable "disk_partition_cleanup" {
  type = bool
}

variable "vdi_optimization" {
  type = bool
}

variable "laz_auto_config" {
  type = bool
}

variable "auto_support_enabled" {
  type = bool
}

variable "auto_support_email" {
  type = string
}

variable "vcenter_data_center" {
  type = string
}

variable "vcenter_hostname" {
  type = string
}

variable "vcenter_username" {
  type = string
}

variable "vcenter_password" {
  type = string
  sensitive = true
}

variable "jumbo_frames_enable" {
  type = bool
}

variable "uplink_speed" {
  type = string
}

variable "vlan_id_mgmt" {
  type = number
}

variable "vlan_id_data" {
  type = number
}

variable "vlan_id_vmotion" {
  type = number
}

variable "vlan_id_vmnetwork" {
  type = number
}

variable "ip_range_kvm" {
  type = map(any)
}

variable "ip_range_mgmt" {
  type = map(any)
}

variable "ip_range_hxdp" {
  type = map(any)
}

variable "hypervisor_admin_user" {
  type = string
}

variable "hypervisor_default_pwd" {
  type = bool
}

variable "hypervisor_admin_pwd" {
  type = string
  sensitive = true
}

variable "hxdp_root_pwd" {
  type = string
  sensitive = true
}

variable "hx_node_profiles" {
  type = map(any)
}

variable "wait_for_completion" {
  type = bool
}
