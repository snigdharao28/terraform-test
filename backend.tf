# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The block below configures Terraform to use the 'remote' backend with HCP Terraform.
# For more information, see https://www.terraform.io/docs/backends/types/remote.html
terraform {
  cloud {
    organization = "test-snigdha"

    workspaces {
      name = "dev"
    }
  }

  required_version = ">= 1.1.2"
}
