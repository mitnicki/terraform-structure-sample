terraform {
    required_providers {
        ionoscloud = {
            source = "ionos-cloud/ionoscloud"
            version = "= 6.3.6"
        }
    }
}


provider "ionoscloud" {
    token = var.IONOS_TOKEN
    endpoint = "https://api.ionos.com/cloudapi/v6/"
}

#

#IONOES Cube template
   data "ionoscloud_template" "cubetmp" {
   name            = var.cube_size_2
}

# CREATE NEW CUBE SERVER
# resource "ionoscloud_cube_server" "TestCube01" {
#    availability_zone = "AUTO"
#    datacenter_id     = "21fe538b-3ae8-4535-8390-8e7185f1e539"
#    name              = "TestCube01"
#    image_name        = var.adn_image_name
#    template_uuid     = data.ionoscloud_template.cubetmp.id

#    nic {
#        dhcp            = true
#        firewall_active = true
#        firewall_type   = "INGRESS"
#        lan             = ionoscloud_lan.LAN2.id
#    }

#    volume {
#        bus                    = "VIRTIO"
#        disk_type              = "DAS"
#        name                   = "TestCube01"
#    }
# }

 resource "ionoscloud_lan" "LAN2" {
     datacenter_id     = "21fe538b-3ae8-4535-8390-8e7185f1e539"
     name              = "LAN2"
     public            = true
 }

# Create Virtual Machine
# resource "ionoscloud_server" "SBlade01" {
#     availability_zone = "AUTO"
#     cores             = var.vm_vcores
#     cpu_family        = "INTEL_SKYLAKE"
#     datacenter_id     = "21fe538b-3ae8-4535-8390-8e7185f1e539"
#     name              = "SBlade01"
#     ram               = 28672
#     type              = "ENTERPRISE"

#     nic {
#         dhcp            = true
#         firewall_active = true
#         firewall_type   = "INGRESS"
#         lan             = ionoscloud_lan.LAN2.id
#     }

#     volume {
#         availability_zone      = "AUTO"
#         bus                    = "VIRTIO"
#         disk_type              = "SSD Standard"
#         licence_type           = "UNKNOWN"
#         name                   = "SBlade01"
#         size                   = 50
#     }
# }