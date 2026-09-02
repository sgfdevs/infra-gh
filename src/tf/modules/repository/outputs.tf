output "name" {
  description = "Repository name"
  value       = github_repository.this.name
}

output "ruleset_id" {
  description = "Main branch ruleset ID"
  value       = one(github_repository_ruleset.main[*].id)
}
