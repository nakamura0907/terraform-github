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

module "examples" {
  source = "../../modules/repository"
  for_each = local.examples
  name = "${each.key}-example"
  description = each.value.description
  visibility = each.value.visibility
  archived = each.value.archived
}

locals {
  examples = {
    "keycloak": {
      "description": "Example repository for Keycloak",
      "visibility": "public",
      "archived": null,
    },
    "echo-prometheus-grafana": {
      "description": "Example repository for Echo, Prometheus, and Grafana",
      "visibility": "public",
      "archived": true,
    },
  }
}
