terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.42.0"
    }
  }
}

provider "github" {
  # Authenticating with the GitHub provider using GitHub CLI.
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

module "boilerplates" {
  source = "../../modules/repository"
  for_each = local.boilerplates
  name = each.key
  description = each.value.description
  visibility = each.value.visibility
}

module "teams" {
  source      = "../../modules/team"
  for_each    = local.teams
  name        = each.key
  description = each.value["description"]
  privacy     = each.value["privacy"]
  members     = each.value["members"]
  permissions = each.value["permissions"]
}

locals {
  repositories = {
    "example-repo": {
      "description": "An example GitHub repository",
      "visibility": "public",
    }
  }
  boilerplates = {
    "nextjs-boilerplate": {
      "description": "A boilerplate for Next.js",
      "visibility": "public",
    }
  }
  teams = {
    "example-project-admin": {
      "description": "Administrators of the example project",
      "privacy": "closed",
      "members": {
        "nakamura0907": "maintainer",
        "mitsuYashi": "maintainer",
      },
      "permissions": {
        "example-repo": "admin",
      }
    }
  }
}
