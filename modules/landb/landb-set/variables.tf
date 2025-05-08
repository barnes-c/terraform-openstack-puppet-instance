variable "description" {
  description = "Optional description of the set"
  type        = string
  default     = ""
}

variable "name" {
  description = "Unique name of the Landb set"
  type        = string
}

variable "network_domain" {
  description = "Network domain for the set"
  type        = string
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

variable "responsible" {
  description = "Name of the e-group responsible for this set"
  type        = string
}

variable "responsible_email" {
  description = "Email of the responsible user/e-group for this set"
  type        = string
}

variable "responsible_type" {
  description = "Contact type for responsible (e.g. EGROUP)"
  type        = string
  default     = "EGROUP"
}

variable "set_present" {
  description = "Whether the set already exists. If false, the set is required to be already created in LanDB"
  type        = bool
  default     = true
}

variable "type" {
  description = "Type of the Landb set (e.g. INTERDOMAIN)"
  type        = string
}
