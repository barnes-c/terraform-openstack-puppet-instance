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

variable "region" {
  description = "Region in which the instance should spawn"
  type        = string
  default     = "cern"
}

variable "max_availability_zones" {
  description = "Maximum number of availability zones to deploy instances into"
  type        = number
  default     = 5
}
