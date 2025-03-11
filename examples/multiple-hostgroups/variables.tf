variable "foreman_hostgroup" {
  description = "The title of the foreman hostgroup which the instance should be in"
  type        = string
  default     = "playground"
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
