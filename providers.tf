terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0.0"
    }
  }
  required_version = ">= 1.0"
}

provider "openstack" {}

provider "http" {}