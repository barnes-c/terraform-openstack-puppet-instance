module "terraform-openstack-instance" {
  source = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.10"

  key_pair_name = var.key_pair_name
}
