# terraform-openstack-instance

Repository to automate the provisioning of instances in the CERN OpenStack private cloud.


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

This Terraform module is designed to provision an OpenStack instance, attach a volume, fetch a certificate from certmgr, and register the host in Foreman. To use this module in your own Terraform project, follow these steps:

### 1. Reference the Module in Your Configuration

In your root Terraform configuration, create a module block pointing to this repository. For example:

```hcl2
module "create-openstack-instance" {
  source = "git::https://gitlab.com/your-group/terraform-openstack-instance.git?ref=v1.0.0"

  # Required variables (adjust these as needed)
  instance_name              = "example-instance"
  volume_availability_zone   = "nova"
  # Include additional variables as required by the module
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

### 3. Variables and Outputs
Review the module's `variables.tf` file for a complete list of required and optional inputs. Required variables are:

* instance_name: The name of the instance to create.
* instance_flavor: The name of the OpenStack flavor (e.g. m2.small)
* key_pair_name: Name of the key pair in OpenStack.

The module also provides outputs (check outputs.tf) that might include:
* instance_id: The ID of the created instance.
* ip_address: The public IP address assigned to the instance.
* (Other outputs based on your module configuration.)