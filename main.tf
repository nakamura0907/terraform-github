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
}

resource "github_repository" "example" {
  name        = "example-repo"
  description = "An example GitHub repository"
  visibility  = "public"
}