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

variable "instance_count" {
  description = "Number of instances to deploy in the hostgroup"
  type        = number
  default     = 3 # or any desired default
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
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
  type = string
}
