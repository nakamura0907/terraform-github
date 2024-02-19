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
}

locals {
  examples = {
    "keycloak": {
      "description": "Example repository for Keycloak",
      "visibility": "public",
    },
    "echo-prometheus-grafana": {
      "description": "Example repository for Echo, Prometheus, and Grafana",
      "visibility": "private",
    },
  }
}
