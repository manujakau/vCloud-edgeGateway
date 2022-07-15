terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "3.6.0"
    }
  }
}

provider "vcd" {
  user                 = var.vCloudUser
  password             = var.vCloudUserPassword
  auth_type            = "integrated"
  org                  = "System"
  url                  = var.vCloudAppliance
  allow_unverified_ssl = true
}

data "vcd_external_network_v2" "nsxt-ext-net" {
  name = var.Tier0Gateways
}

data "vcd_org_vdc" "vdc1" {
  org  = var.Organization
  name = var.VirtualDataCenter
}

resource "vcd_nsxt_edgegateway" "nsxt-edge" {
  org      = var.Organization
  owner_id = data.vcd_org_vdc.vdc1.id

  name        = var.EdgeGatewayName
  description = var.EdgeGatewayDescription

  external_network_id = data.vcd_external_network_v2.nsxt-ext-net.id

  subnet {
    gateway       = var.EdgeGateway_gateway_CIDR
    prefix_length = var.EdgeGateway_gateway_CIDR_prefix
    primary_ip    = var.Tier0ExternalIP
    allocated_ips {
      start_address = var.Tier0ExternalIP
      end_address   = var.Tier0ExternalIP
    }
  }
}

resource "vcd_network_routed_v2" "nsxt-backed" {
  org         = var.Organization
  name        = var.VDCnetworkName
  description = "My routed Org VDC network backed by NSX-T"

  edge_gateway_id = vcd_nsxt_edgegateway.nsxt-edge.id

  gateway       = var.VDCnetworkGateway
  prefix_length = var.VDCnetworkGateway_prefix

  dns1       = var.VDCnetworkGatewayDNS01
  dns2       = var.VDCnetworkGatewayDNS02
  dns_suffix = ""

  static_ip_pool {
    start_address = var.VDCnetworkGatewayStaticIPpool_start
    end_address   = var.VDCnetworkGatewayStaticIPpool_end
  }
}


resource "vcd_nsxt_ip_set" "internal" {
  org = var.Organization

  edge_gateway_id = vcd_nsxt_edgegateway.nsxt-edge.id

  name        = "internal"
  description = "Internal IPv4 ranges"

  ip_addresses = [
    var.InternalIPsetCIDR
  ]
}

resource "vcd_nsxt_ip_set" "external" {
  org = var.Organization

  edge_gateway_id = vcd_nsxt_edgegateway.nsxt-edge.id

  name        = "external"
  description = "External IPv4 ranges"

  ip_addresses = [
    var.EXternalIpsetCIDR
  ]
}

resource "vcd_nsxt_firewall" "firewall_rule01" {
  org = var.Organization
  vdc = var.VirtualDataCenter

  edge_gateway_id = vcd_nsxt_edgegateway.nsxt-edge.id

  rule {
    action      = "ALLOW"
    name        = "outbound"
    direction   = "OUT"
    ip_protocol = "IPV4"
    source_ids = [
      vcd_nsxt_ip_set.internal.id
    ]
    destination_ids = [
      vcd_nsxt_ip_set.external.id
    ]
  }
}