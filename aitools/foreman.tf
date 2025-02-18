terraform {
  required_providers {
    foreman = {
      source  = "theforeman/foreman"
      version = "~> 1.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.0"
    }
  }
}

provider "foreman" {
  hostname = var.foreman_host
  username = var.foreman_user
  password = var.foreman_password
}

provider "http" {}

variable "foreman_host" {
  description = "Foreman API hostname"
  type        = string
}

variable "foreman_user" {
  description = "Foreman API username"
  type        = string
}

variable "foreman_password" {
  description = "Foreman API password"
  type        = string
  sensitive   = true
}

variable "foreman_host_name" {
  description = "Hostname for the Foreman-managed instance"
  type        = string
}

variable "foreman_hostgroup" {
  description = "Hostgroup to assign the instance to"
  type        = string
}

variable "foreman_power_action" {
  description = "Power action to perform (on, off, reboot, reset, status)"
  type        = string
}

resource "foreman_host" "host" {
  name       = var.foreman_host_name
  hostgroup  = var.foreman_hostgroup
  managed    = true
}

resource "foreman_hostgroup" "hostgroup" {
  name = var.foreman_hostgroup
}

resource "null_resource" "foreman_power" {
  provisioner "local-exec" {
    command = <<EOT
      curl -X PUT \
        -H "Content-Type: application/json" \
        -d '{"power_action": "${var.foreman_power_action}"}' \
        --user "${var.foreman_user}:${var.foreman_password}" \
        "https://${var.foreman_host}/api/hosts/${var.foreman_host_name}/power"
    EOT
  }
}

data "foreman_host" "host_details" {
  name = var.foreman_host_name
}

output "foreman_host_details" {
  description = "Details of the Foreman-managed host"
  value       = data.foreman_host.host_details
}

data "http" "foreman_host_static" {
  url = "https://${var.foreman_host}/api/hosts/${var.foreman_host_name}"
  request_headers = {
    Accept = "application/json"
  }
}

output "foreman_host_static_data" {
  description = "Static API query results from Foreman"
  value       = data.http.foreman_host_static.body
}

output "foreman_host_id" {
  description = "ID of the created host in Foreman"
  value       = foreman_host.host.id
}
