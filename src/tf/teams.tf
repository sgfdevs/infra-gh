module "infra_platform_admins_team" {
  source = "./modules/team"

  name = "Infra Platform Admins"
  members = [
    {
      username = github_membership.glitchedmob.username
      role     = "maintainer"
    },
    {
      username = github_membership.ryan_dl.username
      role     = "maintainer"
    },
  ]
}

module "infra_maintainers_team" {
  source = "./modules/team"

  name = "Infra Maintainers"
  members = [{
    username = github_membership.sm0862512.username
    role     = "maintainer"
  }]
}

module "sgf_devs_website_maintainers_team" {
  source = "./modules/team"

  name        = "SGF Devs Website Maintainers"
  description = "Maintainers of the SGF Devs website"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "methodconf_maintainers_team" {
  source = "./modules/team"

  name        = "MethodConf Maintainers"
  description = "Maintainers of MethodConf applications"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "super_admins_team" {
  source = "./modules/team"

  name        = "Super Admins"
  description = "Administrators with ruleset bypass access to managed repositories"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "board_team" {
  source = "./modules/team"

  name = "Board"
  members = [
    {
      username = github_membership.glitchedmob.username
      role     = "maintainer"
    },
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
  ]
}

module "hack4good_team" {
  source = "./modules/team"

  name = "Hack4Good"
  members = [
    {
      username = github_membership.glitchedmob.username
      role     = "maintainer"
    },
    {
      username = github_membership.jason_klein.username
    },
  ]
}
