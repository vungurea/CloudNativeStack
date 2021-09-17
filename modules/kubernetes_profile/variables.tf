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

variable "wait_for_completion" {
  type = bool
  default = false
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "pod_cidr" {
  type = string
}

variable "service_cidr" {
  type = string
}

variable "cni_type" {
  type = string
}

variable "load_balancer_count" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "ssh_keys" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}

variable "ntp_servers" {
  type = list(string)
}

variable "timezone" {
  type = string
}

variable "dns_domain_name" {
  type = string
}

variable "vminstance_cpu" {
  type = number
}

variable "vminstance_disk_size" {
  type = number
}

variable "vminstance_memory" {
  type = number
}

variable "root_ca_registries" {
  type = list(string)
  default = null
}

variable "unsigned_registries" {
  type = list(string)
  default = null
}

variable "infra_target" {
  type = map(any)
}

variable "infra_target_portgroup" {
  type = list(string)
}

variable "ip_pool" {
  type = map(any)
}

variable "controlplane_desired_size" {
  type = number
}

variable "controlplane_max_size" {
  type = number
}

variable "controlplane_min_size" {
  type = number
  default = 0
}

variable "worker_desired_size" {
  type = number
}

variable "worker_max_size" {
  type = number
}

variable "worker_min_size" {
  type = number
  default = 0
}

