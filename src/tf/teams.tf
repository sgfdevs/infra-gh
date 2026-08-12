module "infra_platform_admins" {
  source = "./modules/github-team"

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

module "infra_maintainers" {
  source = "./modules/github-team"

  name = "Infra Maintainers"
  members = [{
    username = github_membership.sm0862512.username
    role     = "maintainer"
  }]
}

module "sgf_devs_website_maintainers" {
  source = "./modules/github-team"

  name        = "SGF Devs Website Maintainers"
  description = "Maintainers of the SGF Devs website"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "methodconf_maintainers" {
  source = "./modules/github-team"

  name        = "MethodConf Maintainers"
  description = "Maintainers of MethodConf applications"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "super_admins" {
  source = "./modules/github-team"

  name        = "Super Admins"
  description = "Administrators with ruleset bypass access to managed repositories"
  members = [{
    username = github_membership.glitchedmob.username
    role     = "maintainer"
  }]
}

module "board" {
  source = "./modules/github-team"

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

module "hack4good" {
  source = "./modules/github-team"

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
