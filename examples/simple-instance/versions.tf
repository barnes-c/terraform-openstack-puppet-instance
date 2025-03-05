terraform {
  required_providers {
    foreman = {
      source  = "terraform-coop/foreman"
      version = "0.7.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
  required_version = ">= 1.0"
}
