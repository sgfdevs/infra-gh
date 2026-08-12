resource "github_team_repository" "infra_platform_admins" {
  for_each = module.infrastructure_repository

  team_id    = github_team.platform_admins.id
  repository = each.value.name
  permission = "admin"
}

resource "github_team_repository" "infra_maintainers" {
  for_each = module.infrastructure_repository

  team_id    = github_team.infra_maintainers.id
  repository = each.value.name
  permission = "maintain"
}

resource "github_team_repository" "hack4good" {
  team_id    = github_team.hack4good.id
  repository = "hack4goodsgf.com"
  permission = "push"
}
