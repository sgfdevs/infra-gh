provider "github" {
  owner = local.github_organization

  app_auth {
    id              = "4566253"
    installation_id = "153094387"
    pem_file        = var.github_app_pem
  }
}
