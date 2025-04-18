# terraform-openstack-puppet-instance

Repository to automate the provisioning of puppet managed instances in the CERN OpenStack private cloud.

## Environment Setup

Follow these steps to configure your environment before running Terraform:

### 1. Load OpenStack Credentials

Ensure you have your OpenStack environment variables set up correctly by sourcing the `openrc.sh` file:

```bash
source openrc.sh
```

### 2. Set Kerberos Configuration

Export the correct Kerberos configuration file:

```bash
export KRB5_CONFIG=./krb5.conf
```

### 3. Authenticate with Kerberos

Obtain a Kerberos ticket:

```bash
kinit
```

Verify that the ticket was obtained:

```bash
klist
```

### 4. Export the Kerberos Ticket Cache

Copy the output from `klist`, and set the `KRB5CCNAME` environment variable accordingly. Example:

```bash
export KRB5CCNAME=FILE:/run/user/{uid}/krb5cc
```

### 5. Verify Setup

Ensure that both OpenStack and Kerberos authentication are correctly set up by running:

```bash
openstack project list
```

If this command succeeds, your authentication setup is complete.

### 6. Apply Terraform Configuration

Once the environment is correctly set up, you can apply the Terraform configuration:

```bash
terraform init
terraform apply
```

## Module Usage

This Terraform module is designed to provision a puppet managed OpenStack instance, attach a volume, fetch a certificate from certmgr, and register the host in Foreman. To use this module in your own Terraform project, follow these steps:

### 1. Reference the Module in Your Configuration

In your root Terraform configuration, create a module block pointing to this repository. For example:

```terraform
module "create-openstack-instance" {
  source = "git::https://gitlab.com/your-group/terraform-openstack-instance.git?ref=v1.0.0"

  key_pair_name = "YOUR-KEY-NAME"
  # Include additional variables
  # flavor, certmgr settings, foreman configurations, etc.
}
```

### 2. Initialize and Run Terraform

After adding the module to your configuration, run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone for the instance | `string` | `""` | no |
| <a name="input_certmgr_deref_alias"></a> [certmgr\_deref\_alias](#input\_certmgr\_deref\_alias) | Whether to dereference DNS aliases | `bool` | `false` | no |
| <a name="input_certmgr_host"></a> [certmgr\_host](#input\_certmgr\_host) | Certificate Manager service hostname | `string` | `"hector.cern.ch"` | no |
| <a name="input_certmgr_port"></a> [certmgr\_port](#input\_certmgr\_port) | Certificate Manager service port | `number` | `8008` | no |
| <a name="input_certmgr_timeout"></a> [certmgr\_timeout](#input\_certmgr\_timeout) | Timeout for Certmgr requests | `number` | `30` | no |
| <a name="input_foreman_domain"></a> [foreman\_domain](#input\_foreman\_domain) | The domain name in which the instance should be created (e.g. cern.ch, dyndns.cern.ch) | `string` | `"cern.ch"` | no |
| <a name="input_foreman_environment"></a> [foreman\_environment](#input\_foreman\_environment) | The Foreman environment | `string` | `"qa"` | no |
| <a name="input_foreman_hostgroup"></a> [foreman\_hostgroup](#input\_foreman\_hostgroup) | The title of the foreman hostgroup which the instance should be in | `string` | `"playground"` | no |
| <a name="input_foreman_hostname"></a> [foreman\_hostname](#input\_foreman\_hostname) | The hostname of the foreman server | `string` | `"judy.cern.ch"` | no |
| <a name="input_foreman_location_id"></a> [foreman\_location\_id](#input\_foreman\_location\_id) | The foreman location ID | `number` | `1` | no |
| <a name="input_foreman_media_name"></a> [foreman\_media\_name](#input\_foreman\_media\_name) | The name of the foreman medium | `string` | `"RedHatCERN"` | no |
| <a name="input_foreman_model_name"></a> [foreman\_model\_name](#input\_foreman\_model\_name) | The name of the foreman model | `string` | `"OpenStack Compute"` | no |
| <a name="input_foreman_organization_id"></a> [foreman\_organization\_id](#input\_foreman\_organization\_id) | The foreman organization ID | `number` | `2` | no |
| <a name="input_image_distro"></a> [image\_distro](#input\_image\_distro) | The name of the OpenStack distro | `string` | `"RHEL"` | no |
| <a name="input_image_os_major_version"></a> [image\_os\_major\_version](#input\_image\_os\_major\_version) | Major version of the OS | `string` | `"9"` | no |
| <a name="input_image_os_minor_version"></a> [image\_os\_minor\_version](#input\_image\_os\_minor\_version) | Minor version of the OS | `string` | `"5"` | no |
| <a name="input_image_ref"></a> [image\_ref](#input\_image\_ref) | Image to be turned into a volume (optional) | `string` | `""` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances to spawn | `number` | `1` | no |
| <a name="input_instance_flavor"></a> [instance\_flavor](#input\_instance\_flavor) | The name of the OpenStack flavor | `string` | `"m2.small"` | no |
| <a name="input_instance_key_pair_name"></a> [instance\_key\_pair\_name](#input\_instance\_key\_pair\_name) | Name of the key pair to be used for the instance | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the OpenStack instance | `string` | `"terraform-openstack-puppet-instance-1"` | no |
| <a name="input_instance_name_prefix"></a> [instance\_name\_prefix](#input\_instance\_name\_prefix) | Prefix for the instance name | `string` | `"test"` | no |
| <a name="input_instance_waitdns"></a> [instance\_waitdns](#input\_instance\_waitdns) | Wether the instance should wait for the dns to be propagated | `bool` | `true` | no |
| <a name="input_landb_mainuser"></a> [landb\_mainuser](#input\_landb\_mainuser) | LanDB user of the instance | `string` | `""` | no |
| <a name="input_landb_responsible"></a> [landb\_responsible](#input\_landb\_responsible) | LanDB responsible of the instance | `string` | `""` | no |
| <a name="input_no_reboot"></a> [no\_reboot](#input\_no\_reboot) | no reboot (default 0) | `number` | `0` | no |
| <a name="input_ptable_name"></a> [ptable\_name](#input\_ptable\_name) | The name of the partition table | `string` | `"AFS Server"` | no |
| <a name="input_puppet_master_host"></a> [puppet\_master\_host](#input\_puppet\_master\_host) | Puppet master hostname | `string` | `"it-puppet-masters-public-a.cern.ch"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which the instance should spawn | `string` | `"cern"` | no |
| <a name="input_roger_appstate"></a> [roger\_appstate](#input\_roger\_appstate) | Optional appstate value. Possible values are 'production', 'draining' or 'quiesce' | `string` | `"production"` | no |
| <a name="input_roger_host"></a> [roger\_host](#input\_roger\_host) | The host for the Roger service. | `string` | `"woger-direct.cern.ch"` | no |
| <a name="input_roger_message"></a> [roger\_message](#input\_roger\_message) | Optional message for state creation/updating. | `string` | `""` | no |
| <a name="input_roger_port"></a> [roger\_port](#input\_roger\_port) | The port for the Roger service. | `number` | `8201` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security groups to be applied to the instance | `list(string)` | <pre>[<br/>  "ssh",<br/>  "icmp",<br/>  "default"<br/>]</pre> | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Extra user data to be added to the instance, e.g. a cloud-config snippet. | `string` | `""` | no |
| <a name="input_volume_availability_zone"></a> [volume\_availability\_zone](#input\_volume\_availability\_zone) | Availability zone for the volume | `string` | `""` | no |
| <a name="input_volume_count"></a> [volume\_count](#input\_volume\_count) | Number of volumes to create per instance. | `number` | `1` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | The name of the volume | `string` | `"terraform-openstack-puppet-volume"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of each volume. If 0, no volume is created. | `number` | `0` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of the volume | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_flavor_id"></a> [flavor\_id](#output\_flavor\_id) | The OpenStack flavor ID |
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | The OpenStack image ID |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The OpenStack instance ID |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The IPv4 address of the instance |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | The IPv6 address of the instance |
| <a name="output_is_physical"></a> [is\_physical](#output\_is\_physical) | Is the instance running on a physical machine? |
| <a name="output_user_data"></a> [user\_data](#output\_user\_data) | Default puppet init content + user data |
<!-- END_TF_DOCS -->
