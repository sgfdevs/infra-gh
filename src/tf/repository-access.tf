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

locals {
  managed_repositories = merge(
    { for name, repository in module.infrastructure_repository : name => repository.name },
    {
      "cms.methodconf.com" = module.cms_methodconf_com.name
      "methodconf.com"     = module.methodconf_com.name
      "sgf.dev"            = module.sgf_dev.name
    },
  )
}

resource "github_team_repository" "super_admins" {
  for_each = local.managed_repositories

  team_id    = github_team.super_admins.id
  repository = each.value
  permission = "admin"
}

resource "github_team_repository" "sgf_devs_website_maintainers" {
  team_id    = github_team.sgf_devs_website_maintainers.id
  repository = module.sgf_dev.name
  permission = "maintain"
}

resource "github_team_repository" "methodconf_maintainers" {
  for_each = toset([
    module.cms_methodconf_com.name,
    module.methodconf_com.name,
  ])

  team_id    = github_team.methodconf_maintainers.id
  repository = each.value
  permission = "maintain"
}

resource "github_team_repository" "hack4good" {
  team_id    = github_team.hack4good.id
  repository = "hack4goodsgf.com"
  permission = "push"
}
