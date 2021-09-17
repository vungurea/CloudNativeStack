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

# Use the kubernetes_profile module to deploy a HyperFlex cluster
module "kubernetes_profile" {
    # Using kubernetes_profile module
    source = "../../modules/kubernetes_profile"

    # Deployment specific
    # Intersight moid for the organization where policies will be created
    org_name = "MyOrg"

    cluster_profile_action = "" # Deploy, Undeploy or null
    #cluster_profile_action = "Deploy"
    #cluster_profile_action = "Undeploy"

    cluster_name = "CloudNativeStack-Demo-k8s-1"
    cluster_version = "v1.19.5"
    pod_cidr = "172.16.0.0/16"
    service_cidr = "172.17.0.0/16"
    cni_type = "Calico"
    load_balancer_count = "1"
    ssh_user = "iksadmin"
    ssh_keys = [ "ecdsa-sha2-nistp521 <keystring> iksadmin@fakehostaname" ]
    dns_servers = [ "x.x.x.x" ]
    ntp_servers = [ "x.x.x.x" ]
    timezone = "Europe/Zurich"
    dns_domain_name = "ceclabs.local"

    vminstance_cpu = 4 #vCPU
    vminstance_disk_size = 20 #GB
    vminstance_memory = 16384 #MiB

    infra_target = {
        vc_hostname = "hxlab-vcenter.ceclabs.local"
        vc_dc_name = "hxlab-hyperflex"
        vc_datastore = "DS01"
        vc_password = "Cisco123"
        vc_resource_pool = ""
    }
    infra_target_portgroup = [ "hxlab-vmnetwork-2400" ]
    ip_pool = {
        from = "10.x.x.10"
        size = "100"
        netmask = "255.255.255.0"
        gateway = "10.x.x.1"
        primary_dns = "x.x.x.x"
        secondary_dns = ""
    }
    controlplane_desired_size = 1
    controlplane_max_size = 3
    worker_desired_size = 5
    worker_max_size = 3
}