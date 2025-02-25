provider "openstack" {}

provider "http" {}

provider "foreman" {
  # 8443 is the port using Kerberos auth
  server_hostname = "judy.cern.ch:8443"

  # Use the right auth workflow
  client_auth_negotiate = true

  location_id     = 1
  organization_id = 2
}
