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
