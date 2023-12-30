terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  # Authenticating with the Github provider using Github CLI.
  # See https://registry.terraform.io/providers/integrations/github/latest/docs#github-cli
}

resource "github_repository" "example" {
  name        = "example-repo"
  description = "An example GitHub repository"
  visibility  = "public"

  ## Features
  has_issues = true

  ## Pull Requests
  allow_rebase_merge = false
  allow_update_branch = true
  delete_branch_on_merge = true
}