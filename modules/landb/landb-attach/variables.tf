variable "description" {
  description = "Optional description for the attachment"
  type        = string
  default     = ""
}

variable "device_name" {
  description = "Device which should be attached to the set"
  type        = string
}

variable "ipv4" {
  description = "The IPv4 address to attach"
  type        = string
}

variable "ipv6" {
  description = "The IPv6 address to attach"
  type        = string
}

variable "set_name" {
  description = "The name of the Landb set to attach to"
  type        = string
}
