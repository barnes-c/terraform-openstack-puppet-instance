locals {
  puppet_init_script = templatefile("${path.module}/puppetinit", {
    _CASERVER_HOSTNAME     = var.certmgr_fqdn
    _CASERVER_PORT         = var.certmgr_port
    _PUPPETMASTER_HOSTNAME = var.puppet_master_host
    _TOPLEVEL_HOSTGROUP    = var.foreman_hostgroup
    _FOREMAN_ENVIRONMENT   = var.foreman_environment
    _NO_REBOOT             = var.no_reboot
    _GENERATED_TS          = timestamp()
  })
}
