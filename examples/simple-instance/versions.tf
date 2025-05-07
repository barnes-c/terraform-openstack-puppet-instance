terraform {
  required_providers {
    certmgr = {
      source  = "barnes-c/certmgr"
      version = "1.3.0"
    }
    foreman = {
      source  = "terraform-coop/foreman"
      version = "0.7.0"
    }
    landb = {
      source  = "barnes-c/landb"
      version = ">= 1.0.12"
    }
    roger = {
      source  = "barnes-c/roger"
      version = "1.2.3"
    }
  }
  required_version = ">= 1.0"
}
