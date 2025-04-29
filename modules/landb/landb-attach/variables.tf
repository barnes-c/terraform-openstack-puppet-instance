variable "set_name" {
  description = "The name of the Landb set to attach to"
  type        = string
}

variable "name" {
  description = "Unique name for this attachment (e.g. <set>-01)"
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

variable "description" {
  description = "Optional description for the attachment"
  type        = string
  default     = ""
}
