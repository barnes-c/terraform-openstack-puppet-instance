terraform {
  required_providers {
    certmgr = {
      source = "barnes-c/certmgr"
      version = "1.2.1"
    }
    foreman = {
      source  = "terraform-coop/foreman"
      version = "0.7.0"
    }
    roger = {
      source = "barnes-c/roger"
      version = "1.2.2"
    }
  }
  required_version = ">= 1.0"
}
