variable "name" {
  description = "Unique name of the Landb set"
  type        = string
}

variable "type" {
  description = "Type of the Landb set (e.g. INTERDOMAIN)"
  type        = string
}

variable "network_domain" {
  description = "Network domain for the set"
  type        = string
}

variable "description" {
  description = "Optional description of the set"
  type        = string
  default     = ""
}

variable "project_url" {
  description = "Optional URL for the project"
  type        = string
  default     = ""
}

variable "receive_notifications" {
  description = "Whether the set should receive notifications"
  type        = bool
  default     = false
}

variable "responsible_type" {
  description = "Contact type for responsible (e.g. EGROUP)"
  type        = string
  default     = "EGROUP"
}

variable "responsible_egroup_name" {
  description = "Name of the e-group responsible for this set"
  type        = string
}

variable "responsible_egroup_email" {
  description = "Email of the e-group responsible for this set"
  type        = string
}
