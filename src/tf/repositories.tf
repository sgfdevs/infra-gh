resource "github_repository" "infra_dns" {
  name       = "infra-dns"
  visibility = "public"

  has_issues      = true
  has_projects    = true
  has_wiki        = false
  has_discussions = false

  allow_merge_commit  = false
  allow_squash_merge  = true
  allow_rebase_merge  = true
  allow_auto_merge    = true
  allow_update_branch = true

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"

  delete_branch_on_merge = true
}

resource "github_repository_ruleset" "infra_dns_main" {
  name        = "Protect main"
  repository  = github_repository.infra_dns.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  bypass_actors {
    actor_id    = github_team.platform_admins.id
    actor_type  = "Team"
    bypass_mode = "always"
  }

  rules {
    deletion                = true
    non_fast_forward        = true
    required_linear_history = true

    pull_request {
      allowed_merge_methods             = ["rebase", "squash"]
      dismiss_stale_reviews_on_push     = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }

    required_status_checks {
      strict_required_status_checks_policy = true

      required_check {
        context        = "Terraform checks"
        integration_id = 15368
      }
    }
  }
}
