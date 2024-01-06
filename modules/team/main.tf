terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_team" "this" {
  name                      = var.name
  description               = var.description
  privacy                   = var.privacy
  create_default_maintainer = true 
}

resource "github_team_membership" "this" {
  for_each = var.members
  team_id  = github_team.this.id
  username = each.key
  role     = each.value
}

resource "github_team_repository" "this" {
  for_each   = var.permissions
  repository = each.key
  team_id    = github_team.this.id
  permission = each.value
}

