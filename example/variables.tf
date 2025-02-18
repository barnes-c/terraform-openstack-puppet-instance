variable "distro" {
  description = "The name of the OpenStack distro"
  type        = string
  default    = "RHEL"
}

variable "os_major_version" {
  description = "Major version of the OS"
  type        = string
    default    = "9"
}

variable "os_edition" {
  description = "The name of the edition"
  type        = string
  default    = "Base"
}

variable "arch" {
  description = "The name of the architecture (e.g. x86_64)"
  type        = string
  default    = "x86_64"
}

variable "flavor" {
  description = "The name of the OpenStack flavor"
  type        = string
  default    = "m1.small"
}

variable "instance_name" {
  description = "The name of the OpenStack instance"
  type        = string
  default    = "test-instance"
}


variable "cinder_volume_name" {
  description = "The name of the Cinder volume"
  type        = string
}

variable "cinder_volume_size" {
  description = "Size of the Cinder volume in GB"
  type        = number
}

variable "cinder_volume_type" {
  description = "Type of the Cinder volume"
  type        = string
  default     = ""
}

variable "cinder_image_ref" {
  description = "Image to be turned into a volume (optional)"
  type        = string
  default     = ""
}

variable "cinder_availability_zone" {
  description = "Availability zone for the Cinder volume"
  type        = string
  default     = ""
}