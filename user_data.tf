data "template_file" "puppetinit" {
  template = file("${path.module}/puppetinit")
  vars = {
    _CASERVER_HOSTNAME     = var.certmgr_fqdn
    _CASERVER_PORT         = var.certmgr_port
    _PUPPETMASTER_HOSTNAME = var.puppet_master_host
    _TOPLEVEL_HOSTGROUP    = var.foreman_hostgroup
    _FOREMAN_ENVIRONMENT   = var.foreman_environment
    _NO_REBOOT             = var.no_reboot
    _GENERATED_TS          = timestamp()
  }
}

data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "puppetinit"
    content_type = "text/x-shellscript"
    content      = data.template_file.puppetinit.rendered
  }

  part {
    content_type = "text/cloud-config"
    content      = var.user_data
  }
}
