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
