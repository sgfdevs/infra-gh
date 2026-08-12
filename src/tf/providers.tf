provider "github" {
  owner = local.github_organization

  app_auth {}
}
