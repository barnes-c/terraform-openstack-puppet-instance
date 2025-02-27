variable "architecture" {
  description = "The name of the architecture (e.g. x86_64)"
  type        = string
  default     = "x86_64"
}

variable "certmgr_deref_alias" {
  description = "Whether to dereference DNS aliases"
  type        = bool
  default     = false
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

variable "distro" {
  description = "The name of the OpenStack distro"
  type        = string
  default     = "RHEL"
}

variable "foreman_domain" {
  description = "The domain name in which the instance should be created (e.g. cern.ch, dyndns.cern.ch)"
  type        = string
  default     = "cern.ch"
}

variable "foreman_environment" {
  description = "The Foreman environment"
  type        = string
  default     = "qa"
}

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

variable "foreman_media_name" {
  description = "The name of the foreman medium"
  type        = string
  default     = "RedHatCERN"
}

variable "foreman_model_name" {
  description = "The name of the foreman model"
  type        = string
  default     = "OpenStack Compute"
}

variable "image_ref" {
  description = "Image to be turned into a volume (optional)"
  type        = string
  default     = ""
}

variable "instance_flavor" {
  description = "The name of the OpenStack flavor"
  type        = string
  default     = "m1.small"
}

variable "instance_name" {
  description = "The name of the OpenStack instance"
  type        = string
  default     = ""
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
  default     = ""
}

variable "location_id" {
  description = "The foreman location ID"
  type        = number
  default     = 1
}

variable "no_reboot" {
  description = "no reboot (default 1)"
  type        = number
  default     = 1
}

variable "organization_id" {
  description = "The foreman organization ID"
  type        = number
  default     = 2
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

variable "os_minor_version" {
  description = "Minor version of the OS"
  type        = string
  default     = "5"
}

variable "ptable_name" {
  description = "The name of the partition table"
  type        = string
  default     = "AFS Server"
}

variable "puppet_master_host" {
  description = "Puppet master hostname"
  type        = string
  default     = "it-puppet-masters-public-a.cern.ch"
}

variable "volume_availability_zone" {
  description = "Availability zone for the volume"
  type        = string
  default     = ""
}

variable "volume_name" {
  description = "The name of the volume"
  type        = string
  default     = "volume"
}

variable "volume_size" {
  description = "Size of the volume in GB"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
  default     = ""
}
