resource "certmgr_certificate" "certificate" {
  hostname = resource.foreman_host.host.interfaces_attributes[0].name
}
