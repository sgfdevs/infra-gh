locals {
  infrastructure_repositories = toset([
    "infra-app-config",
    "infra-aws-core",
    "infra-dns",
    "infra-gh",
    "infra-k8s-apps",
    "infra-vm-workloads",
  ])
}

resource "github_team_repository" "infra_platform_admins" {
  for_each = local.infrastructure_repositories

  team_id    = github_team.platform_admins.id
  repository = each.value
  permission = "admin"
}

resource "github_team_repository" "infra_maintainers" {
  for_each = local.infrastructure_repositories

  team_id    = github_team.infra_maintainers.id
  repository = each.value
  permission = "maintain"
}

resource "github_team_repository" "hack4good" {
  team_id    = github_team.hack4good.id
  repository = "hack4goodsgf.com"
  permission = "push"
}
