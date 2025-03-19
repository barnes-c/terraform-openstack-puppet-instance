# Region to deploy in, e.g. "cern" or "pdc"
region = "cern"

# Instance configuration
instance_flavor      = "m2.small"
instance_name_prefix = "test"

# Specify which OS should be used for the image
image_distro           = "RHEL"
image_os_major_version = "9"
image_os_minor_version = "5"

# List of security groups which should be applied to the instance
security_groups = ["ssh", "icmp", "default"]

# Environment for the instance to be deployed in
foreman_environment = "qa"

# This genereates two volumes per instance with a volume size of 10GB, of type "standard"
volume_count = 2
volume_size  = 1
volume_type  = "standard"

# Insert your custom user data here
user_data = "#cloud-config\nhostname: instance_1.example.com\nfqdn: instance_1.example.com"
