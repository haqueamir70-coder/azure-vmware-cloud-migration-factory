variable "subscription_id" {
  description = "Azure subscription ID to deploy into. Supply via environment or uncommitted tfvars."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for the starter landing-zone resources."
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Resource group name for the starter foundation."
  type        = string
  default     = "rg-migration-factory-dev"
}

variable "vnet_name" {
  description = "Virtual network name."
  type        = string
  default     = "vnet-migration-dev"
}

variable "address_space" {
  description = "IPv4 address space. Check for overlap with on-premises and existing Azure ranges."
  type        = list(string)
  default     = ["10.80.0.0/16"]

  validation {
    condition     = length(var.address_space) > 0
    error_message = "Provide at least one address prefix."
  }
}

variable "tags" {
  description = "Governance tags applied to resources."
  type        = map(string)
  default = {
    project     = "azure-vmware-cloud-migration-factory"
    environment = "dev"
    managed_by  = "terraform"
    purpose     = "portfolio-learning"
  }
}