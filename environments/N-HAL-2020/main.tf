terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.42.0"
    }
  }
}

provider "github" {
  # Authenticating with the Github provider using Github CLI.
  # See https://registry.terraform.io/providers/integrations/github/latest/docs#github-cli
  owner = "N-HAL-2020"
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
    "example-repo": {
      "description": "An example GitHub repository",
      "visibility": "public",
    }
  }
}
