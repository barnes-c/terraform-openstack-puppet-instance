# multiple-projects

This example shows you how to deploy instances in different projects at the same time. For this you have to define two provider blocks for OpenStack. Example: 

```terraform
provider "openstack" {
  alias     = "first_project"
  tenant_id = var.tenant_id_1
}

provider "openstack" {
  alias     = "second_project"
  tenant_id = var.tenant_id_2
}
```

OpenStack knows in which project to deploy by the tenant_id. This is the `OS_PROJECT_ID` that can be found when you download the rc file in the [OpenStack UI](https://openstack.cern.ch/). The other required variables (username, password) should be set when setting up the environment and sourcing your rc file in the beginning.