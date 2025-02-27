#!/bin/bash
# Nacho Barrientos <nacho.barrientos@cern.ch>
# This is a template that will be filled in by
# ai-bs. Don't use directly as a user script
# as it won't work as expected.
# Generated at $_GENERATED_TS

# FUNCTION execute_shell_block
# Executes function $1, $3 times at maximum
# with a wait time of $2 seconds between tries
function execute_shell_block {
  waittime=$2
  max_attempts=$3
  attemptno=1
  until $1 ; do
    if [ "$attemptno" -eq "$max_attempts" ] ; then
      echo "Max number of attempts exceeded"
      return 1
    fi
    echo "Execution failed (attempt #$attemptno out of #$max_attempts) (next in $waittime secs)"
    sleep "$waittime"
    attemptno=$((attemptno + 1))
  done
  return 0
}

function unrecoverable_error {
  echo "Step '$1' failed. Puppet won't run. Use SSH key (if available) to login."
  exit 1
}

LOCKFILE=/var/lib/cloud/puppetinit.lock

date
[ -e "$LOCKFILE" ] && echo "Puppet init has already run. Exiting." && exit 0
touch $LOCKFILE

echo "Setting up Puppet for the initial run. Please wait..."

#
# Discover the OS type and the major version
#
if [ -f /etc/os-release ] ; then
  . /etc/os-release
  OS_MAJOR_VERSION=$(echo "$VERSION_ID" | awk '{split($0,a,"."); print a[1]}')
  OS_DISTRIBUTOR_ID=$ID
elif [ -x /usr/bin/lsb_release ] ; then
  OS_MAJOR_VERSION=$(lsb_release -r | awk '{split($2,a,"."); print a[1]}')
  OS_DISTRIBUTOR_ID=$(lsb_release -i | awk '{print $3}')
fi
echo "OS DISTRIBUTOR: $OS_DISTRIBUTOR_ID, OS MAJOR: $OS_MAJOR_VERSION"

#
# Discover (via Openstack) and set the hostname
#
FINALHOSTNAME=$(curl http://169.254.169.254/1.0/meta-data/hostname -s -o - -m 5)
if [ -n "$FINALHOSTNAME" ]; then
  echo "Setting hostname to $${FINALHOSTNAME}"
  hostname "$FINALHOSTNAME"
fi

#
# Install bootstrapping-time dependencies
#
function set_config_repositories {
  if [ "$OS_MAJOR_VERSION" -eq 7 ]
  then
    echo "Setting AI repository..."
    CONFIGREPO="ai$OS_MAJOR_VERSION"
  elif [ "$OS_MAJOR_VERSION" -eq 8 ] && [ "$OS_DISTRIBUTOR_ID" = "centos" ]
  then
    CONFIGREPO="config$${OS_MAJOR_VERSION}s"
  else
    if [ "$OS_DISTRIBUTOR_ID" = "rhel" ] ; then
      CONFIGREPO="config$${OS_MAJOR_VERSION}el"
    elif [ "$OS_DISTRIBUTOR_ID" = "almalinux" ] ; then
      CONFIGREPO="config$${OS_MAJOR_VERSION}al"
    else
      CONFIGREPO="config$${OS_MAJOR_VERSION}"
    fi
  fi

  curl "http://linuxsoft.cern.ch/internal/repos/$${CONFIGREPO}.repo" > \
    "/etc/yum.repos.d/$${CONFIGREPO}.repo"
  if [ "$OS_MAJOR_VERSION" -gt 7 ] && [ "$${OS_DISTRIBUTOR_ID}" = "rhel" ]
  then
    dnf config-manager --setopt gpgcheck=0 "$CONFIGREPO" "$${CONFIGREPO}-qa" --save
  fi
  test -s "/etc/yum.repos.d/$${CONFIGREPO}.repo"
}
execute_shell_block set_config_repositories 60 5 || unrecoverable_error "config-repositories"

function set_bootstrap_for_rhel_repositories {
  echo "Setting up CERN bootstrap repositories for RHEL machines..."
  curl "http://linuxsoft.cern.ch/internal/repos/rhel$${OS_MAJOR_VERSION}-cern.repo" > \
    "/etc/yum.repos.d/rhel$${OS_MAJOR_VERSION}-cern.repo"
  test -s "/etc/yum.repos.d/rhel$${OS_MAJOR_VERSION}-cern.repo"
  if [ "$OS_MAJOR_VERSION" -gt 7 ]
  then
    echo "Installing CERN GPG keys for RHEL machines..."
    yum install -y centos-gpg-keys
    test -s /etc/pki/rpm-gpg/RPM-GPG-KEY-kojiv2
  fi
}
[[ "$${OS_DISTRIBUTOR_ID}" = "RedHatEnterpriseServer" || "$${OS_DISTRIBUTOR_ID}" = "rhel" ]] && \
  ( execute_shell_block set_bootstrap_for_rhel_repositories 60 5 || unrecoverable_error "bootstrap-rhel-repository" )

function install_epel_release {
  if [ "$OS_MAJOR_VERSION" -eq 7 ]
  then
    yum install -y epel-release
  else
    dnf install -y epel-release
  fi

  test -s /etc/yum.repos.d/epel.repo
}
execute_shell_block install_epel_release 60 5 || unrecoverable_error "install epel-release"

DEPS=(cern-get-keytab certmgr-client CERN-CA-certs augeas)

[ "$OS_MAJOR_VERSION" -ge 8 ] && DEPS=("$${DEPS[@]}" cern-krb5-conf)
[ "$OS_MAJOR_VERSION" -eq 7 ] && DEPS=("$${DEPS[@]}" yum-plugin-priorities deltarpm yum-utils yum-plugin-protectbase)

[[ $(echo "${_FOREMAN_ENVIRONMENT}" | tr '[:upper:]' '[:lower:]') == 'qa' ]] && CONFIGREPO="$CONFIGREPO-qa"

function install_dependencies {
  echo "Trying to install dependencies..."
  yum install -y --enablerepo="$CONFIGREPO" "$${DEPS[@]}"
  rpm -ql "$${DEPS[@]}" > /dev/null
}
execute_shell_block install_dependencies 60 5 || unrecoverable_error "dependencies"

#
# Install Puppet agent
#
function install_puppet {
  echo "Trying to remove puppet-agent that came with image if any..."
  yum remove -y puppet-agent puppet-agent-extra-gems puppet facter hiera # Obsoleted by puppet-agent, anyway
  echo "Trying to install puppet-agent..."
  if [ "$OS_MAJOR_VERSION" -eq 7 ]
  then
    yum-config-manager --setopt=base.exclude=puppet-agent,puppet-agent-extra-gems --save > /dev/null
    yum-config-manager --setopt=updates.exclude=puppet-agent,puppet-agent-extra-gems --save > /dev/null
    yum-config-manager --setopt=extras.exclude=puppet-agent,puppet-agent-extra-gems --save > /dev/null
    yum-config-manager --setopt=cern.exclude=puppet-agent,puppet-agent-extra-gems --save > /dev/null
  elif [ "$OS_MAJOR_VERSION" -eq 8 ]
  then
    dnf config-manager --setopt "*.exclude=puppet-agent,puppet-agent-extra-gems" baseos appstream extras cern --save
  else
    dnf config-manager --setopt "*.exclude=puppet-agent,puppet-agent-extra-gems" baseos appstream crb cern --save
  fi
  rm -rf /etc/puppet /var/lib/puppet
  yum install -y --enablerepo="$CONFIGREPO" puppet-agent
  rpm -ql puppet-agent > /dev/null
}
execute_shell_block install_puppet 60 5 || unrecoverable_error "puppet"

#
# Generate puppet.conf
#
function configure_puppet {
  echo "Generating initial puppet.conf ($1/$2)..."
  cat << EOF > /etc/puppetlabs/puppet/puppet.conf
# puppet.conf
# Generated by ai-bs
[main]
ssldir = /var/lib/puppet/ssl
localcacert = /etc/pki/tls/certs/CERN-bundle.pem

[agent]
server = ${_PUPPETMASTER_HOSTNAME}
ca_server = ${_CASERVER_HOSTNAME}
masterport = 8144
http_extra_headers = X-Namespace:${_TOPLEVEL_HOSTGROUP}
ca_port = 8140
report = true
ignoreschedules = true
certificate_revocation = false
runinterval = $1
splaylimit = $2
splay = true
EOF
}
configure_puppet 600 200

#
# Install systemd-resolved early
# We want this installed early so that it is there
# before we start starting services and it takes
# two puppet runs otherwise
if [ "$OS_MAJOR_VERSION" -ge 9 ] ; then
  dnf install -y systemd-resolved
fi

#
# Generate initial Kerberos configuration on OS6/7.
# OS8 and above uses contents of cern-krb5-config
# package installed above.
if [ "$OS_MAJOR_VERSION" -eq 7 ] ; then
  echo "Generating initial krb5.conf..."
  cat << EOF > /etc/krb5.conf
# krb5.conf
# Generated by ai-bs
[libdefaults]
 default_realm = CERN.CH
 ticket_lifetime = 25h
 renew_lifetime = 120h
 forwardable = true
 proxiable = true
 default_tkt_enctypes = aes256-cts-hmac-sha1-96 aes256-cts-hmac-sha384-192 camellia256-cts-cmac aes128-cts-hmac-sha1-96 aes128-cts-hmac-sha256-128 camellia128-cts-cmac

[appdefaults]
  pam = {
         external = true
         krb4_convert = false
         krb4_convert_524 = false
         krb4_use_as_req = false
  }

[domain_realm]
  .cern.ch = CERN.CH

[realms]
  CERN.CH  = {
    default_domain = cern.ch
    kpasswd_server = cerndc.cern.ch
    admin_server = cerndc.cern.ch
    kdc = cerndc.cern.ch
    v4_name_convert = {
      host = {
        rcmd = host
      }
    }
  }
EOF
fi

#
# Specify lxkerbwin server to use
#
if [[ $(echo "${_FOREMAN_ENVIRONMENT}" | tr '[:upper:]' '[:lower:]') == 'qa' ]] ; then
  LXKRBWIN_SERVER=lxkerbwinqa.cern.ch
else
  LXKRBWIN_SERVER=lxkerbwin.cern.ch
fi
echo "Generating initial cern-get-keytab.yaml"
cat << EOF > /etc/cern-get-keytab.yaml
---
# puppetinit installed
server:      https://$${LXKRBWIN_SERVER}/LxKerb.asmx
verify_peer: true
verify_host: true
EOF

#
# Download and install the host certificate
#
SSLDIR=$(/opt/puppetlabs/bin/puppet config print ssldir)
HOSTCERTDIR=$(/opt/puppetlabs/bin/puppet config print certdir)
HOSTKEYDIR=$(/opt/puppetlabs/bin/puppet config print privatekeydir)
HOSTPUBKEYDIR=$(/opt/puppetlabs/bin/puppet config print publickeydir)
install -m 0750 -d "$SSLDIR" "$HOSTCERTDIR" "$HOSTKEYDIR" "$HOSTPUBKEYDIR"
HOSTKEY=$(/opt/puppetlabs/bin/puppet config print hostprivkey)
HOSTPUBKEY=$(/opt/puppetlabs/bin/puppet config print hostpubkey)
HOSTCERT=$(/opt/puppetlabs/bin/puppet config print hostcert)
function get_host_certificate {
  echo "Getting host certificate..."
  if ! certmgr-getcert -s "${_CASERVER_HOSTNAME}" -p "${_CASERVER_PORT}" -w "$HOSTKEYDIR" -o "$HOSTCERT"
  then
    echo "certmgr-getcert didn't return 0" && return 1
  fi
  [[ ! -s $HOSTKEY ]] && echo "Host key not created" && return 1
  [[ ! -s $HOSTCERT ]] && echo "Host cert not created" && return 1
  openssl rsa -in "$HOSTKEY" -pubout 2> /dev/null > "$HOSTPUBKEY"
  test -s "$HOSTPUBKEY"
}
execute_shell_block get_host_certificate 10 15 || unrecoverable_error "getcert"

# Clean up /etc/yum.repos.d/, no longer necessary.
# Puppet will recreate all of them.
/bin/rm -rf /etc/yum.repos.d/*.repo

# Because of: 418aa59f5c348bc97cfc48011ecdda62c26b5e36
/bin/mkdir -p /etc/yum-puppet.repos.d
/usr/bin/augtool -s set /files/etc/yum.conf/main/reposdir /etc/yum-puppet.repos.d/

# Some images (mainly RHEL 6) don't have the firewall configured so these two files
# don't exist, which makes the puppet firewall configuration fail.
if [ "$OS_MAJOR_VERSION" -eq 7 ]
then
  for file in iptables ip6tables
  do
    if [ ! -f "/etc/sysconfig/$${file}" ]
      then
        echo "Generating empty /etc/sysconfig/$${file}"
        touch "/etc/sysconfig/$${file}"
    fi
  done
fi

echo "Generating initial /etc/sysconfig/puppet"
cat << EOF > /etc/sysconfig/puppet
PUPPET_EXTRA_OPTS="--waitforcert=500 --masterport=8154 --ca_port=8140"
EOF

#
# Warm the EC2 facts cache if the host is a physical machine
#
function fill_ec2_facts_cache {
  if [ -f "/mnt/configdrive/ec2/latest/meta-data.json" ]
    then
      echo "Found a config drive! Initialising stuff for facts..."
      echo "Setting the initial EC2 facts cache TTL..."
      mkdir -p /etc/puppetlabs/facter
      echo 'facts : { ttls : [ { "EC2" : "72000 days" } ] }' > /etc/puppetlabs/facter/facter.conf
      echo "Filling the EC2 facts cache..."
      mkdir -p /opt/puppetlabs/facter/cache/cached_facts
      < /mnt/configdrive/ec2/latest/meta-data.json \
        xargs -0 -I {} echo '{"cache_format_version": 1, "ec2_metadata": {}}' > /opt/puppetlabs/facter/cache/cached_facts/EC2
      test -s /opt/puppetlabs/facter/cache/cached_facts/EC2
  fi
}
execute_shell_block fill_ec2_facts_cache 10 2 || unrecoverable_error "fill_ec2_facts_cache"

#
# * Turn Puppet on for next boot.
#
/usr/bin/systemctl enable puppet.service

#
# * Ensure ip(6)tables and not firewalld is running on first boot.
# * Restart rsyslog to make sure it logs with the new hostname.
#
if [ "$OS_MAJOR_VERSION" -eq 7 ]
  then
    /usr/bin/systemctl restart rsyslog.service
    /usr/bin/systemctl disable firewalld.service
    /usr/bin/systemctl enable iptables.service
    /usr/bin/systemctl enable ip6tables.service
fi

#
# * Run Puppet (only the osrepos and landb tags).
# * Reset the initial runinterval if the catalog didn't compile.
# * Run yum/dnf distro-sync.
# * Grow the root partition (only 6).
# * Reboot the system to boot the latest kernel.
#
date
echo "Waiting for a time slot to run Puppet (osrepos and landb tags only)..."
/bin/sleep $((RANDOM % 180))
echo "Running Puppet to configure only the YUM repositories"
/opt/puppetlabs/bin/puppet agent -t --tags osrepos,landb --masterport 8154 \
    --ca_port 8140 --waitforcert 120 --color=FALSE
echo "Resetting initial runinterval if needed..."
[[ ! -e /opt/puppetlabs/puppet/cache/client_data/catalog/$(hostname).json ]] && \
  configure_puppet 5200 1800
echo "Running yum distro-sync for the first time..."
if [ "$OS_MAJOR_VERSION" -eq 7 ]
then
  [[ -x /usr/local/sbin/distro_sync.sh ]] \
    && /usr/local/sbin/distro_sync.sh && cat /var/log/distro_sync.log \
    || echo "Distro_sync.sh not found. Either disabled or Puppet failed to install it."
  [[ -e /var/log/distro_sync.log ]] \
    && /sbin/restorecon /var/log/distro_sync.log
else
  [[ -e /etc/systemd/system/dnf-distro-sync.service ]] \
    && eval "$(grep ExecStart /etc/systemd/system/dnf-distro-sync.service | cut -f 2 -d "=")" \
    || echo "Distro-sync not configured. Either disabled or Puppet failed to install it."
fi
date
[[ ${_NO_REBOOT} -eq 1 ]] || (echo "The system will now reboot" && /sbin/reboot)
