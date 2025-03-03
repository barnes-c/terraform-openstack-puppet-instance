provider "foreman" {
  client_auth_negotiate = true
  location_id           = var.location_id
  organization_id       = var.organization_id
  server_hostname       = "${var.foreman_hostname}:8443" # Using port 8443 for Kerberos 
}
