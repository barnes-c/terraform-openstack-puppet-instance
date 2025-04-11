resource "roger_state" "state" {
  appstate = var.roger_appstate
  hostname = resource.foreman_host.host.interfaces_attributes[0].name
}
