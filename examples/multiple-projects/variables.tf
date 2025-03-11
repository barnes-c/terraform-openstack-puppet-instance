variable "foreman_hostname" {
  description = "The hostname of the foreman server"
  type        = string
  default     = "judy.cern.ch"
}

variable "location_id" {
  description = "The foreman location ID"
  type        = number
  default     = 1
}

variable "organization_id" {
  description = "The foreman organization ID"
  type        = number
  default     = 2
}

variable "tenant_id_1" {
  description = "The OpenStack tenant ID"
  type        = string
}

variable "tenant_id_2" {
  description = "The OpenStack tenant ID"
  type        = string
}