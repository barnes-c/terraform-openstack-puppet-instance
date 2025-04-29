data "template_file" "puppetinit" {
  template = file(var.puppet_init_path)
  vars = {
    _CASERVER_HOSTNAME     = var.certmgr_host
    _CASERVER_PORT         = var.certmgr_port
    _PUPPETMASTER_HOSTNAME = var.puppet_master_host
    _TOPLEVEL_HOSTGROUP    = var.foreman_hostgroup
    _FOREMAN_ENVIRONMENT   = var.foreman_environment
    _NO_REBOOT             = var.no_reboot
    _GENERATED_TS          = time_static.timestamp.rfc3339
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

resource "time_static" "timestamp" {}
