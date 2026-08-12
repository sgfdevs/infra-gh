resource "github_team" "platform_admins" {
  name                 = "Platform Admins"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team_membership" "platform_admins" {
  for_each = {
    glitchedmob = "maintainer"
    Ryan-DL     = "member"
    sm0862512   = "member"
  }

  team_id  = github_team.platform_admins.id
  username = each.key
  role     = each.value
}
