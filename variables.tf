variable "vCloudAppliance" {
  type        = string
  description = "vCloud URL"
  default     = ""
}

variable "vCloudUser" {
  type        = string
  description = "vCloud User name"
  default     = ""
}

variable "vCloudUserPassword" {
  type        = string
  description = "vCloud User Password"
  default     = ""
}

variable "Organization" {
  type        = string
  description = "New organization name"
  default     = ""
}

variable "VirtualDataCenter" {
  type        = string
  description = "New VirtualDataCenter name"
  default     = ""
}

variable "Tier0Gateways" {
  type        = string
  description = "Allocataed Tier0Gateways name"
  default     = ""
}

variable "Tier0ExternalIP" {
  type        = string
  description = "Allocataed External IP from Tier0Gateway"
  default     = ""
}

variable "EdgeGatewayName" {
  type        = string
  description = "New EdgeGateway name"
  default     = ""
}

variable "EdgeGatewayDescription" {
  type        = string
  description = "New EdgeGateway description"
  default     = ""
}

variable "EdgeGateway_gateway_CIDR" {
  type        = string
  description = "Tier-0-Gateway Gateway"
  default     = ""
}

variable "EdgeGateway_gateway_CIDR_prefix" {
  type        = string
  description = "Tier-0-Gateway Gateway prefix"
  default     = ""
}

variable "VDCnetworkName" {
  type        = string
  description = "New VDC network name backed by NSX-T"
  default     = ""
}

variable "VDCnetworkGateway" {
  type        = string
  description = "New VDC network Gateway backed by NSX-T"
  default     = ""
}

variable "VDCnetworkGateway_prefix" {
  type        = string
  description = "New VDC network Gateway prefix backed by NSX-T"
  default     = ""
}

variable "VDCnetworkGatewayDNS01" {
  type        = string
  description = "New VDC network DNS01 backed by NSX-T"
  default     = ""
}

variable "VDCnetworkGatewayDNS02" {
  type        = string
  description = "New VDC network DNS02 backed by NSX-T"
  default     = ""
}

variable "VDCnetworkGatewayStaticIPpool_start" {
  type        = string
  description = "New VDC network static ip pool start address"
  default     = "" 
}

variable "VDCnetworkGatewayStaticIPpool_end" {
  type        = string
  description = "New VDC network static ip pool end address"
  default     = ""
}

variable "InternalIPsetCIDR" {
  type        = string
  description = "New VDC network internal IP set with prefix"
  default     = ""
}

variable "EXternalIpsetCIDR" {
  type        = string
  description = "New VDC network external IP set with prefix"
  default     = ""
}