terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  is_template = var.is_template

  ## Features
  has_issues = true

  ## Pull Requests
  allow_rebase_merge = false
  allow_update_branch = true
  delete_branch_on_merge = true
}