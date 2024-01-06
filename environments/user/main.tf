terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  # Authenticating with the GitHub provider using GitHub CLI.
  # See https://registry.terraform.io/providers/integrations/github/latest/docs#github-cli
}

module "repositories" {
  source = "../../modules/repository"
  for_each = local.repositories
  name = each.key
  description = each.value.description
  visibility = each.value.visibility
}

locals {
  repositories = {
    "keycloak-example": {
      "description": "Example repository for Keycloak",
      "visibility": "public",
    }
  }
}
