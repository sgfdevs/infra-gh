# Adopt the private IAM repository that predates its common repository configuration.
import {
  to = module.infrastructure_repository["infra-iam"].github_repository.this
  id = "infra-iam"
}
