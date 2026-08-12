locals {
  github_actions_integration_id = 15368

  super_admin_team = {
    id         = module.super_admins_team.id
    permission = "admin"
    bypass     = true
  }

  infrastructure_repositories = {
    infra-app-config = {
      required_check = "Terraform checks"
    }
    infra-aws-core = {
      required_check = "Terraform checks"
    }
    infra-dns = {
      required_check = "Terraform checks"
    }
    infra-gh = {
      required_check = "Terraform checks"
    }
    infra-k8s-apps = {
      required_check = "checks / Kubernetes checks"
    }
    infra-vm-workloads = {
      required_check = "CI checks"
    }
  }
}

module "infrastructure_repository" {
  for_each = local.infrastructure_repositories

  source = "./modules/repository"

  name   = each.key
  topics = ["infra"]
  required_checks = [{
    context        = each.value.required_check
    integration_id = local.github_actions_integration_id
  }]
  teams = concat(
    [
      {
        id         = module.infra_platform_admins_team.id
        permission = "admin"
        bypass     = true
      },
      {
        id         = module.infra_maintainers_team.id
        permission = "maintain"
      },
    ],
    [local.super_admin_team],
  )
}

module "cms_methodconf_com_repository" {
  source = "./modules/repository"

  name        = "cms.methodconf.com"
  description = "MethodConf CMS"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = concat(
    [{
      id         = module.methodconf_maintainers_team.id
      permission = "maintain"
    }],
    [local.super_admin_team],
  )
}

module "methodconf_com_repository" {
  source = "./modules/repository"

  name = "methodconf.com"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = concat(
    [{
      id         = module.methodconf_maintainers_team.id
      permission = "maintain"
    }],
    [local.super_admin_team],
  )
}

module "sgf_dev_repository" {
  source = "./modules/repository"

  name   = "sgf.dev"
  topics = ["hacktoberfest"]
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = concat(
    [{
      id         = module.sgf_devs_website_maintainers_team.id
      permission = "maintain"
    }],
    [local.super_admin_team],
  )
}

module "hack4goodsgf_com_repository" {
  source = "./modules/repository"

  name        = "hack4goodsgf.com"
  description = "Custom WordPress image for hack4goodsgf.com"
  teams = concat(
    [{
      id         = module.hack4good_team.id
      permission = "push"
    }],
    [local.super_admin_team],
  )
}
