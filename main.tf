# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The following configuration uses a provider which provisions [fake] resources
# to a fictitious cloud vendor called "Fake Web Services". Configuration for
# the fakewebservices provider can be found in provider.tf.
#
# After running the setup script (./scripts/setup.sh), feel free to change these
# resources and 'terraform apply' as much as you'd like! These resources are
# purely for demonstration and created in HCP Terraform, scoped to your HCP Terraform
# user account.
#
# To review the provider and documentation for the available resources and
# schemas, see: https://registry.terraform.io/providers/hashicorp/fakewebservices
#
# If you're looking for the configuration for the remote backend, you can find that
# in backend.tf.


resource "fakewebservices_vpc" "primary_vpc1" {
  name       = "Primary VPC1"
  cidr_block = "0.0.1.0/1"
}

resource "fakewebservices_server" "servers1" {
  count = 3

  name = "Server ${count.index + 1}"
  type = "t2.micro"
  vpc  = fakewebservices_vpc.primary_vpc.name
}

resource "fakewebservices_load_balancer" "primary_lb1" {
  name    = "Primary Load Balancer1"
  servers = fakewebservices_server.servers[*].name
}

resource "fakewebservices_database" "prod_db1" {
  name = "Production DB1"
  size = 256
}
