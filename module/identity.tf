data "openstack_identity_auth_scope_v3" "scope" {
  name = "default" 
  region = var.region
}