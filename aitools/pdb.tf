variable "pdb_host" {
  description = "PuppetDB hostname"
  type        = string
}

variable "pdb_port" {
  description = "PuppetDB port"
  type        = number
  default     = 8081
}

variable "pdb_hostname" {
  description = "Hostname to query in PuppetDB"
  type        = string
}

provider "http" {}

data "http" "pdb_host_info" {
  url = "https://${var.pdb_host}:${var.pdb_port}/pdb/query/v4/nodes/${var.pdb_hostname}"
  request_headers = {
    Accept = "application/json"
  }
}

output "puppetdb_host_info" {
  description = "Host details from PuppetDB"
  value       = data.http.pdb_host_info.body
}

data "http" "pdb_facts" {
  url = "https://${var.pdb_host}:${var.pdb_port}/pdb/query/v4/nodes/${var.pdb_hostname}/facts"
  request_headers = {
    Accept = "application/json"
  }
}

output "puppetdb_facts" {
  description = "Facts of the PuppetDB host"
  value       = data.http.pdb_facts.body
}

data "http" "pdb_resources" {
  url = "https://${var.pdb_host}:${var.pdb_port}/pdb/query/v4/nodes/${var.pdb_hostname}/resources"
  request_headers = {
    Accept = "application/json"
  }
}

output "puppetdb_resources" {
  description = "Resources assigned to the host in PuppetDB"
  value       = data.http.pdb_resources.body
}

resource "null_resource" "extract_lbaliases" {
  provisioner "local-exec" {
    command = <<EOT
      curl -s -X GET \
        -H "Accept: application/json" \
        "https://${var.pdb_host}:${var.pdb_port}/pdb/query/v4/nodes/${var.pdb_hostname}/resources/Lbd::Client" \
        | jq -r 'map(.parameters.lbalias) | @json' > lbaliases.json
    EOT
  }
}

output "puppetdb_lbaliases" {
  description = "Extracted Load Balancer Aliases from PuppetDB"
  value       = file("lbaliases.json")
}
