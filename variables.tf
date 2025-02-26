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

variable "os_minor_version" {
  description = "Minor version of the OS"
  type        = string
  default     = "5"
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
  description = "The title of the hostgroup which the instance should be in"
  type        = string
  default     = "playground"
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}

variable "certmgr_host" {
  description = "Certificate Manager service hostname"
  type        = string
  default     = "hector.cern.ch"
}

variable "certmgr_fqdn" {
  description = "Fully Qualified Domain Name of the host to be staged"
  type        = string
  default     = "hector.cern.ch"
}

variable "certmgr_port" {
  description = "Certificate Manager service port"
  type        = number
  default     = 8008
}

variable "certmgr_timeout" {
  description = "Timeout for Certmgr requests"
  type        = number
  default     = 30
}

variable "certmgr_deref_alias" {
  description = "Whether to dereference DNS aliases"
  type        = bool
  default     = false
}

variable "foreman_environment" {
  description = "The Foreman environment"
  type        = string
  default     = "qa"
}

variable "foreman_domain" {
  description = "The domain name in which the instance should be created (e.g. cern.ch, dyndns.cern.ch)"
  type        = string
  default     = "cern.ch"
}
