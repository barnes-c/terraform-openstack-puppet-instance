terraform {
  required_providers {
    certmgr = {
      source = "barnes-c/certmgr"
      version = "1.1.23"
    }
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
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.13.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
  required_version = ">= 1.0"
}
