variable "availability_zone" {
  description = "The availability zone for the instance"
  type        = string
  default     = ""
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

variable "foreman_location_id" {
  description = "The foreman location ID"
  type        = number
  default     = 1
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

variable "foreman_organization_id" {
  description = "The foreman organization ID"
  type        = number
  default     = 2
}

variable "image_distro" {
  description = "The name of the OpenStack distro"
  type        = string
  default     = "RHEL"
}

variable "image_os_major_version" {
  description = "Major version of the OS"
  type        = string
  default     = "9"
}

variable "image_os_minor_version" {
  description = "Minor version of the OS"
  type        = string
  default     = "5"
}

variable "image_ref" {
  description = "Image to be turned into a volume (optional)"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Number of instances to spawn"
  type        = number
  default     = 1
}

variable "instance_flavor" {
  description = "The name of the OpenStack flavor"
  type        = string
  default     = "m2.small"
}

variable "instance_key_pair_name" {
  description = "Name of the key pair to be used for the instance"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of the OpenStack instance"
  type        = string
  default     = "tf-instance-1"
}

variable "instance_name_prefix" {
  description = "Prefix for the instance name"
  type        = string
  default     = ""
}

variable "instance_waitdns" {
  description = "Wether the instance should wait for the dns to be propagated"
  type        = bool
  default     = true
}

variable "landb_mainuser" {
  description = "LanDB user of the instance"
  type        = string
  default     = "TERRAFORM-PROVIDER-LANDB"
}

variable "landb_responsible" {
  description = "User or E-group name. The person responsible for the machine/set"
  type        = string
  default     = "TERRAFORM-PROVIDER-LANDB"
}

variable "landb_responsible_email" {
  description = "E-group email for the sets responsible"
  type        = string
  default     = "terraform-provider-landb@cern.ch"
}

variable "landb_responsible_type" {
  description = "Contact type of the user/responsible/manager for the machine/set (e.g. EGROUP)"
  type        = string
  default     = "EGROUP"
}

variable "no_reboot" {
  description = "no reboot (default 0)"
  type        = number
  default     = 0
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

variable "region" {
  description = "Region in which the instance should spawn"
  type        = string
  default     = "cern"
}

variable "roger_appstate" {
  description = "Optional appstate value. Possible values are 'production', 'draining' or 'quiesce'"
  type        = string
  default     = "production"
}

variable "roger_host" {
  description = "The host for the Roger service."
  type        = string
  default     = "woger-direct.cern.ch"
}

variable "roger_message" {
  description = "Optional message for state creation/updating."
  type        = string
  default     = ""
}

variable "roger_port" {
  description = "The port for the Roger service."
  type        = number
  default     = 8201
}

variable "security_groups" {
  description = "List of security groups to be applied to the instance"
  type        = list(string)
  default     = ["ssh", "icmp", "default"]
}

variable "set_description" {
  description = "Description for a new LanDB set"
  type        = string
  default     = ""
}

variable "set_name" {
  description = "Name of the LanDB set to which instances should be added"
  type        = string
  default     = "tf-set"
}

variable "set_network_domain" {
  description = "Network domain for a new set"
  type        = string
  default     = "GPN"
}

variable "set_present" {
  description = "Whether the set already exists. If false, the set is required to be already created in LanDB"
  type        = bool
  default     = true
}

variable "set_project_url" {
  description = "Project URL for a new set"
  type        = string
  default     = ""
}

variable "set_receive_notifications" {
  description = "Whether a new set should send notifications about its state"
  type        = bool
  default     = true
}

variable "set_type" {
  description = "Type of a new LanDB set (e.g. INTERDOMAIN)"
  type        = string
  default     = "INTERDOMAIN"
}

variable "user_data" {
  description = "Extra user data to be added to the instance, e.g. a cloud-config snippet."
  type        = string
  default     = ""
}

variable "user_data_path" {
  description = "If path is provided, the content of the file will be used as user_data. Otherwise, the inline var user_data will be used."
  type        = string
  default     = ""
}

variable "volume_availability_zone" {
  description = "Availability zone for the volume"
  type        = string
  default     = ""
}

variable "volume_count" {
  description = "Number of volumes to create per instance."
  type        = number
  default     = 1
}

variable "volume_name" {
  description = "The name of the volume"
  type        = string
  default     = "tf-volume"
}

variable "volume_size" {
  description = "Size of each volume in GB. If 0, no volume is created."
  type        = number
  default     = 0
}

variable "volume_type" {
  description = "Type of the volume"
  type        = string
  default     = ""
}
