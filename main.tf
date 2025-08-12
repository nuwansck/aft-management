# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory?ref=v1.15.1"

  # Required account + region inputs
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  # GitHub repos for AFT pipelines
  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/learn-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/learn-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/learn-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/learn-terraform-aft-account-customizations"

  # 🔻 Turn off AFT-managed networking (no VPC, NAT, EIPs, endpoints)
  aft_enable_vpc               = false
  aft_vpc_endpoints            = false
  aft_enable_vpc_flow_logs     = false
  aft_enable_lambda_vpc        = false
  aft_customer_vpc_id          = null
  aft_customer_private_subnets = null
}

