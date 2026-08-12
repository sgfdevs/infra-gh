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
  bypass_actors = [{
    actor_id   = github_team.platform_admins.id
    actor_type = "Team"
  }]
}

module "cms_methodconf_com" {
  source = "./modules/github-repository"

  name        = "cms.methodconf.com"
  description = "MethodConf CMS"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
}

module "methodconf_com" {
  source = "./modules/github-repository"

  name = "methodconf.com"
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
}

module "sgf_dev" {
  source = "./modules/github-repository"

  name   = "sgf.dev"
  topics = ["hacktoberfest"]
  required_checks = [{
    context        = "CI checks"
    integration_id = local.github_actions_integration_id
  }]
}
