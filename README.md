# terraform-openstack-instance

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
