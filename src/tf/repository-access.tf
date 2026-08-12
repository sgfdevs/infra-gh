resource "github_team_repository" "admins_method_conf_temp_landing" {
  team_id    = github_team.admins.id
  repository = "method-conf-temp-landing"
  permission = "admin"
}

resource "github_team_repository" "lifestrengths_lifestrengths" {
  team_id    = github_team.lifestrengths.id
  repository = "LifeStrengths"
  permission = "push"
}

resource "github_team_repository" "treasurer_treasurer" {
  team_id    = github_team.treasurer.id
  repository = "treasurer"
  permission = "admin"
}

resource "github_team_repository" "website_volunteers_sgf_dev" {
  team_id    = github_team.website_volunteers.id
  repository = "sgf.dev"
  permission = "maintain"
}

resource "github_repository_collaborator" "direct" {
  for_each = {
    "LifeStrengths:glitchedmob"          = { repository = "LifeStrengths", username = "glitchedmob", permission = "admin" }
    "email-campaigns:jenn8421"           = { repository = "email-campaigns", username = "jenn8421", permission = "push" }
    "h4g-api-jobs:fredlawl"              = { repository = "h4g-api-jobs", username = "fredlawl", permission = "admin" }
    "infrastructure:Ryan-DL"             = { repository = "infrastructure", username = "Ryan-DL", permission = "admin" }
    "infrastructure:jason-klein"         = { repository = "infrastructure", username = "jason-klein", permission = "admin" }
    "method-conf-temp-landing:mykebates" = { repository = "method-conf-temp-landing", username = "mykebates", permission = "admin" }
    "sgf.dev:Ryan-DL"                    = { repository = "sgf.dev", username = "Ryan-DL", permission = "maintain" }
    "sgf.dev:glitchedmob"                = { repository = "sgf.dev", username = "glitchedmob", permission = "admin" }
    "www.sgf.dev:trankin"                = { repository = "www.sgf.dev", username = "trankin", permission = "admin" }
  }

  repository = each.value.repository
  username   = each.value.username
  permission = each.value.permission
}
