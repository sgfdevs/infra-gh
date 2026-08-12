locals {
  github_actions_integration_id = 15368

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

  source = "./modules/github-repository"

  name   = each.key
  topics = ["infra"]
  required_checks = [{
    context        = each.value.required_check
    integration_id = local.github_actions_integration_id
  }]
  teams = [
    {
      id         = module.infra_platform_admins.id
      permission = "admin"
      bypass     = true
    },
    {
      id         = module.infra_maintainers.id
      permission = "maintain"
    },
    {
      id         = module.super_admins.id
      permission = "admin"
      bypass     = true
    },
  ]
}

module "cms_methodconf_com" {
  source = "./modules/github-repository"

  name        = "cms.methodconf.com"
  description = "MethodConf CMS"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = [
    {
      id         = module.methodconf_maintainers.id
      permission = "maintain"
    },
    {
      id         = module.super_admins.id
      permission = "admin"
      bypass     = true
    },
  ]
}

module "methodconf_com" {
  source = "./modules/github-repository"

  name = "methodconf.com"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = [
    {
      id         = module.methodconf_maintainers.id
      permission = "maintain"
    },
    {
      id         = module.super_admins.id
      permission = "admin"
      bypass     = true
    },
  ]
}

module "sgf_dev" {
  source = "./modules/github-repository"

  name   = "sgf.dev"
  topics = ["hacktoberfest"]
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
  teams = [
    {
      id         = module.sgf_devs_website_maintainers.id
      permission = "maintain"
    },
    {
      id         = module.super_admins.id
      permission = "admin"
      bypass     = true
    },
  ]
}

module "hack4goodsgf_com" {
  source = "./modules/github-repository"

  name        = "hack4goodsgf.com"
  description = "Custom WordPress image for hack4goodsgf.com"
  teams = [
    {
      id         = module.hack4good.id
      permission = "push"
    },
    {
      id         = module.super_admins.id
      permission = "admin"
      bypass     = true
    },
  ]
}
