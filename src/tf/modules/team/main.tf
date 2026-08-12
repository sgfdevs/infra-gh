resource "github_team" "this" {
  name                 = var.name
  description          = var.description
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team_membership" "this" {
  for_each = { for member in var.members : member.username => member }

  team_id  = github_team.this.id
  username = each.value.username
  role     = each.value.role
}
