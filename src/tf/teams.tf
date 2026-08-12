locals {
  common_team_maintainer = {
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }
}

module "infra_platform_admins_team" {
  source = "./modules/team"

  name = "Infra Platform Admins"
  members = concat(
    [{
      username = github_membership.ryan_dl.username
      role     = "maintainer"
    }],
    [local.common_team_maintainer],
  )
}

module "infra_maintainers_team" {
  source = "./modules/team"

  name = "Infra Maintainers"
  members = concat(
    [{
      username = github_membership.sm0862512.username
    }],
    [local.common_team_maintainer],
  )
}

module "sgf_devs_website_maintainers_team" {
  source = "./modules/team"

  name        = "SGF Devs Website Maintainers"
  description = "Maintainers of the SGF Devs website"
  members     = [local.common_team_maintainer]
}

module "methodconf_maintainers_team" {
  source = "./modules/team"

  name        = "MethodConf Maintainers"
  description = "Maintainers of MethodConf applications"
  members     = [local.common_team_maintainer]
}

module "super_admins_team" {
  source = "./modules/team"

  name        = "Super Admins"
  description = "Administrators with ruleset bypass access to managed repositories"
  members     = [local.common_team_maintainer]
}

module "board_team" {
  source = "./modules/team"

  name = "Board"
  members = concat(
    [
      {
        username = github_membership.jenn8421.username
        role     = "maintainer"
      },
      {
        username = github_membership.motter360.username
        role     = "maintainer"
      },
      {
        username = github_membership.ryan_dl.username
        role     = "maintainer"
      },
    ],
    [local.common_team_maintainer],
  )
}

module "hack4good_team" {
  source = "./modules/team"

  name = "Hack4Good"
  members = concat(
    [{
      username = github_membership.jason_klein.username
    }],
    [local.common_team_maintainer],
  )
}
