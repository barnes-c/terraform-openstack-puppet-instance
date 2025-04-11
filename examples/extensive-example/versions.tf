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
    roger = {
      source = "barnes-c/roger"
      version = "1.1.12"
    }
  }
  required_version = ">= 1.0"
}
