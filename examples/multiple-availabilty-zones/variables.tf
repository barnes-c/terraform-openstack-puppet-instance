variable "availability_zones" {
  type = list(string)
}

variable "region" {
  type = string
}

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

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}
