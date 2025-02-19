variable "distro" {
  description = "The name of the OpenStack distro"
  type        = string
  default     = "RHEL"
}

variable "os_major_version" {
  description = "Major version of the OS"
  type        = string
  default     = "9"
}

variable "os_edition" {
  description = "The name of the edition"
  type        = string
  default     = "Base"
}

variable "arch" {
  description = "The name of the architecture (e.g. x86_64)"
  type        = string
  default     = "x86_64"
}

variable "flavor" {
  description = "The name of the OpenStack flavor"
  type        = string
  default     = "m1.small"
}

variable "instance_name" {
  description = "The name of the OpenStack instance"
  type        = string
  default     = "test-instance"
}


variable "volume_name" {
  description = "The name of the volume"
  type        = string
}

variable "volume_size" {
  description = "Size of the volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
  default     = ""
}

variable "volume_availability_zone" {
  description = "Availability zone for the volume"
  type        = string
  default     = ""
}

variable "image_ref" {
  description = "Image to be turned into a volume (optional)"
  type        = string
  default     = ""
}

# variable "openstack_auth_url" {
#   description = "Openstack authentication URL"
#   type        = string
#   default     = ""
# }

# variable "openstack_user_name" {
#   description = "Openstack username"
#   type        = string
#   default     = ""
# }

# variable "openstack_password" {
#   description = "Openstack password"
#   type        = string
#   default     = ""
# }

# variable "openstack_region" {
#   description = "Openstack region zone"
#   type        = string
#   default     = ""
# }

# variable "openstack_tenant_name" {
#   description = "Openstack tenant name"
#   type        = string
#   default     = ""
# }

variable "foreman_environment" {
  default = "production"
}

variable "image_name" {
  description = "The name of the image to retrieve"
  type        = string
}

variable "image_id" {
  description = "The ID of the image to retrieve"
  type        = string
  default     = ""
}

variable "hostgroup" {
  description = "The hostgroup which the instance should be in"
  type        = string
  default     = "playground"
}