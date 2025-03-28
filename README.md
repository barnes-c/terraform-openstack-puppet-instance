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

| Name                                                                                                      | Description                                                                            | Type           | Default                                                    | Required |
| --------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------- | ---------------------------------------------------------- | :------: |
| <a name="input_availability_zone"></a> [availability_zone](#input_availability_zone)                      | The availability zone for the instance                                                 | `string`       | `""`                                                       |    no    |
| <a name="input_certmgr_deref_alias"></a> [certmgr_deref_alias](#input_certmgr_deref_alias)                | Whether to dereference DNS aliases                                                     | `bool`         | `false`                                                    |    no    |
| <a name="input_certmgr_host"></a> [certmgr_host](#input_certmgr_host)                                     | Certificate Manager service hostname                                                   | `string`       | `"hector.cern.ch"`                                         |    no    |
| <a name="input_certmgr_port"></a> [certmgr_port](#input_certmgr_port)                                     | Certificate Manager service port                                                       | `number`       | `8008`                                                     |    no    |
| <a name="input_certmgr_timeout"></a> [certmgr_timeout](#input_certmgr_timeout)                            | Timeout for Certmgr requests                                                           | `number`       | `30`                                                       |    no    |
| <a name="input_foreman_domain"></a> [foreman_domain](#input_foreman_domain)                               | The domain name in which the instance should be created (e.g. cern.ch, dyndns.cern.ch) | `string`       | `"cern.ch"`                                                |    no    |
| <a name="input_foreman_environment"></a> [foreman_environment](#input_foreman_environment)                | The Foreman environment                                                                | `string`       | `"qa"`                                                     |    no    |
| <a name="input_foreman_hostgroup"></a> [foreman_hostgroup](#input_foreman_hostgroup)                      | The title of the foreman hostgroup which the instance should be in                     | `string`       | `"playground"`                                             |    no    |
| <a name="input_foreman_hostname"></a> [foreman_hostname](#input_foreman_hostname)                         | The hostname of the foreman server                                                     | `string`       | `"judy.cern.ch"`                                           |    no    |
| <a name="input_foreman_location_id"></a> [foreman_location_id](#input_foreman_location_id)                | The foreman location ID                                                                | `number`       | `1`                                                        |    no    |
| <a name="input_foreman_managed"></a> [foreman_managed](#input_foreman_managed)                            | If the foreman host should be managed (default: true)                                  | `bool`         | `true`                                                     |    no    |
| <a name="input_foreman_media_name"></a> [foreman_media_name](#input_foreman_media_name)                   | The name of the foreman medium                                                         | `string`       | `"RedHatCERN"`                                             |    no    |
| <a name="input_foreman_model_name"></a> [foreman_model_name](#input_foreman_model_name)                   | The name of the foreman model                                                          | `string`       | `"OpenStack Compute"`                                      |    no    |
| <a name="input_foreman_organization_id"></a> [foreman_organization_id](#input_foreman_organization_id)    | The foreman organization ID                                                            | `number`       | `2`                                                        |    no    |
| <a name="input_image_distro"></a> [image_distro](#input_image_distro)                                     | The name of the OpenStack distro                                                       | `string`       | `"RHEL"`                                                   |    no    |
| <a name="input_image_os_major_version"></a> [image_os_major_version](#input_image_os_major_version)       | Major version of the OS                                                                | `string`       | `"9"`                                                      |    no    |
| <a name="input_image_os_minor_version"></a> [image_os_minor_version](#input_image_os_minor_version)       | Minor version of the OS                                                                | `string`       | `"5"`                                                      |    no    |
| <a name="input_image_ref"></a> [image_ref](#input_image_ref)                                              | Image to be turned into a volume (optional)                                            | `string`       | `""`                                                       |    no    |
| <a name="input_instance_count"></a> [instance_count](#input_instance_count)                               | Number of instances to spawn                                                           | `number`       | `1`                                                        |    no    |
| <a name="input_instance_flavor"></a> [instance_flavor](#input_instance_flavor)                            | The name of the OpenStack flavor                                                       | `string`       | `"m2.small"`                                               |    no    |
| <a name="input_instance_key_pair_name"></a> [instance_key_pair_name](#input_instance_key_pair_name)       | Name of the key pair to be used for the instance                                       | `string`       | `""`                                                       |    no    |
| <a name="input_instance_name"></a> [instance_name](#input_instance_name)                                  | The name of the OpenStack instance                                                     | `string`       | `"terraform-openstack-puppet-instance-1"`                  |    no    |
| <a name="input_instance_name_prefix"></a> [instance_name_prefix](#input_instance_name_prefix)             | Prefix for the instance name                                                           | `string`       | `"test"`                                                   |    no    |
| <a name="input_instance_waitdns"></a> [instance_waitdns](#input_instance_waitdns)                         | Wether the instance should wait for the dns to be propagated                           | `bool`         | `false`                                                    |    no    |
| <a name="input_landb_mainuser"></a> [landb_mainuser](#input_landb_mainuser)                               | LanDB user of the instance                                                             | `string`       | `""`                                                       |    no    |
| <a name="input_landb_responsible"></a> [landb_responsible](#input_landb_responsible)                      | LanDB responsible of the instance                                                      | `string`       | `""`                                                       |    no    |
| <a name="input_no_reboot"></a> [no_reboot](#input_no_reboot)                                              | no reboot (default 0)                                                                  | `number`       | `0`                                                        |    no    |
| <a name="input_ptable_name"></a> [ptable_name](#input_ptable_name)                                        | The name of the partition table                                                        | `string`       | `"AFS Server"`                                             |    no    |
| <a name="input_puppet_master_host"></a> [puppet_master_host](#input_puppet_master_host)                   | Puppet master hostname                                                                 | `string`       | `"it-puppet-masters-public-a.cern.ch"`                     |    no    |
| <a name="input_region"></a> [region](#input_region)                                                       | Region in which the instance should spawn                                              | `string`       | `"cern"`                                                   |    no    |
| <a name="input_roger_appstate"></a> [roger_appstate](#input_roger_appstate)                               | Optional appstate value.                                                               | `string`       | `"build"`                                                  |    no    |
| <a name="input_roger_host"></a> [roger_host](#input_roger_host)                                           | The host for the Roger service.                                                        | `string`       | `"woger-direct.cern.ch"`                                   |    no    |
| <a name="input_roger_message"></a> [roger_message](#input_roger_message)                                  | Optional message for state creation/updating.                                          | `string`       | `""`                                                       |    no    |
| <a name="input_roger_port"></a> [roger_port](#input_roger_port)                                           | The port for the Roger service.                                                        | `number`       | `8201`                                                     |    no    |
| <a name="input_security_groups"></a> [security_groups](#input_security_groups)                            | List of security groups to be applied to the instance                                  | `list(string)` | <pre>[<br/> "ssh",<br/> "icmp",<br/> "default"<br/>]</pre> |    no    |
| <a name="input_user_data"></a> [user_data](#input_user_data)                                              | Extra user data to be added to the instance, e.g. a cloud-config snippet.              | `string`       | `""`                                                       |    no    |
| <a name="input_volume_availability_zone"></a> [volume_availability_zone](#input_volume_availability_zone) | Availability zone for the volume                                                       | `string`       | `""`                                                       |    no    |
| <a name="input_volume_count"></a> [volume_count](#input_volume_count)                                     | Number of volumes to create per instance.                                              | `number`       | `1`                                                        |    no    |
| <a name="input_volume_name"></a> [volume_name](#input_volume_name)                                        | The name of the volume                                                                 | `string`       | `"terraform-openstack-puppet-volume"`                      |    no    |
| <a name="input_volume_size"></a> [volume_size](#input_volume_size)                                        | Size of each volume. If 0, no volume is created.                                       | `number`       | `0`                                                        |    no    |
| <a name="input_volume_type"></a> [volume_type](#input_volume_type)                                        | Type of the volume                                                                     | `string`       | `""`                                                       |    no    |

## Outputs

| Name                                                                    | Description                                        |
| ----------------------------------------------------------------------- | -------------------------------------------------- |
| <a name="output_instance_id"></a> [instance_id](#output_instance_id)    | The OpenStack instance ID                          |
| <a name="output_ipv4_address"></a> [ipv4_address](#output_ipv4_address) | The IPv4 address of the instance                   |
| <a name="output_ipv6_address"></a> [ipv6_address](#output_ipv6_address) | The IPv6 address of the instance                   |
| <a name="output_user_data"></a> [user_data](#output_user_data)          | The user data thats being injected in the instance |

<!-- END_TF_DOCS -->
