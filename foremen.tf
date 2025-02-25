resource "foreman_host" "host" {
  architecture_id    = resource.foreman_architecture.architecture.id
  operatingsystem_id = data.foreman_operatingsystem.os.id
  domain_id          = resource.foreman_domain.domain.id
  # ptable_id = 1
  # medium_id
  # full_messages
  name           = var.instance_name
  hostgroup_id   = data.foreman_hostgroup.hostgroup.id
  environment_id = data.foreman_environment.env.id

  # puppet_class_ids = [data.foreman_puppetclass.class.id]
}

# data "foreman_puppetclass" "class" {
#   name = "qa"
# }

data "foreman_hostgroup" "hostgroup" {
  title = var.hostgroup
}

data "foreman_environment" "env" {
  name = var.foreman_environment
}

resource "foreman_architecture" "architecture" {
  name = var.arch
}

data "foreman_operatingsystem" "os" {
  title = format("%s %s.%s", var.distro, var.os_major_version, var.os_minor_version)
}

resource "foreman_domain" "domain" {
  name = "${var.instance_name}.cern.ch"
}
