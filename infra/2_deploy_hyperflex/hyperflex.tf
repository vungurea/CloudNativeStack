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


# Deployment of a HyperFlex System
module "hyperflex_profile" {
    # Using hyperflex_profile module
    source = "../../modules/hyperflex_profile"

    # Hyperflex Cluster Profile Action
    #   No-op -> Just create objects in Intersight
    #   Validate -> Start a validation on the profile
    #   Deploy -> Trigger a deployment
    #   Continue, Retry, Abort, Unassign -> Optiona
    cluster_profile_action = "No-op"
    wait_for_completion = false
    
    # Global Cluster Parameters
    org_name = "MyOrg"
    hx_system_name = "hxlab"
    
    # Deployment specific
    hx_deployment_type = "FI"
    replication = 3
    mgmt_ip_address = "x.x.x.x"
    timezone = "Europe/Zurich"
    dns_servers = [ "x.x.x.x" ]
    ntp_servers = [ "x.x.x.x" ]

    vdi_optimization = false
    dns_domain_name = "ceclabs.local"
    disk_partition_cleanup = true
    laz_auto_config = false
    hxdp_version = "4.5(2a)"
    server_firmware_version = "4.1(2f)"
    auto_support_enabled = true
    auto_support_email = "email@domain.com"
    vcenter_data_center = "DC1"
    vcenter_hostname = "hxlab-vcenter.ceclabs.local"
    vcenter_username = "administrator@vsphere.local"
    jumbo_frames_enable = true
    uplink_speed = "default"
    vlan_id_mgmt = 1100
    vlan_id_data = 1200
    vlan_id_vmotion = 1300
    vlan_id_vmnetwork = 1400
    ip_range_kvm = {
        start_addr = "x.x.x.x"
        end_addr = "x.x.x.x"
        netmask = "x.x.x.x"
        gateway = "x.x.x.x"
    }
    ip_range_mgmt = {
        start_addr = "x.x.x.x"
        end_addr = "x.x.x.x"
        netmask = "x.x.x.x"
        gateway = "x.x.x.x"
    }
    ip_range_hxdp = {
        start_addr = "x.x.x.x"
        end_addr = "x.x.x.x"
        netmask = "x.x.x.x"
        gateway = "x.x.x.x"
    }
    mac_pool_prefix = "00:25:B5:99"
    hypervisor_admin_user = "root"
    hypervisor_default_pwd = true

    vcenter_password = var.vcenter_password
    hypervisor_admin_pwd = var.hypervisor_admin_pwd
    hxdp_root_pwd = var.hxdp_root_pwd

    hx_node_profiles = {
        # "-esx-1" = {
        #     node_serial_number = "NODESERIALNO"
        #     hxdp_mgmt_ip = "x.x.x.x"
        #     hypervisor_data_ip = "x.x.x.x"
        #     hypervisor_mgmt_ip = "x.x.x.x"
        # },
        # "-esx-2" = {
        #     node_serial_number = "NODESERIALNO"
        #     hxdp_mgmt_ip = "x.x.x.x"
        #     hypervisor_data_ip = "x.x.x.x"
        #     hypervisor_mgmt_ip = "x.x.x.x"
        # },
        # "-esx-3" = {
        #     node_serial_number = "NODESERIALNO"
        #     hxdp_mgmt_ip = "x.x.x.x"
        #     hypervisor_data_ip = "x.x.x.x"
        #     hypervisor_mgmt_ip = "x.x.x.x"
        # }
    }
}