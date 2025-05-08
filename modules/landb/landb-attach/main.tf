resource "landb_set_attach" "set_attach" {
  set_name    = upper(var.set_name)
  device_name        = upper(var.device_name)
  ipv4        = var.ipv4
  ipv6        = var.ipv6
  description = var.description
}
