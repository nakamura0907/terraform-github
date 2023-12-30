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

