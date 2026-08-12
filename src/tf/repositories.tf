module "infra_dns" {
  source = "./modules/github-repository"

  name = "infra-dns"
  required_checks = [{
    context        = "Terraform checks"
    integration_id = 15368
  }]
  bypass_actors = [{
    actor_id   = github_team.platform_admins.id
    actor_type = "Team"
  }]
}
