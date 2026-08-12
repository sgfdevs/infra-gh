resource "github_team" "platform_admins" {
  name                 = "Infra Platform Admins"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "infra_maintainers" {
  name                 = "Infra Maintainers"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "board" {
  name                 = "Board"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "hack4good" {
  name                 = "Hack4Good"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team_membership" "platform_admins" {
  for_each = {
    glitchedmob = "maintainer"
    Ryan-DL     = "maintainer"
  }

  team_id  = github_team.platform_admins.id
  username = each.key
  role     = each.value
}

resource "github_team_membership" "infra_maintainers" {
  team_id  = github_team.infra_maintainers.id
  username = "sm0862512"
  role     = "maintainer"
}

resource "github_team_membership" "board" {
  for_each = {
    glitchedmob = "maintainer"
    jenn8421    = "maintainer"
    Motter360   = "maintainer"
    Ryan-DL     = "maintainer"
  }

  team_id  = github_team.board.id
  username = each.key
  role     = each.value
}

resource "github_team_membership" "hack4good" {
  for_each = {
    glitchedmob = "maintainer"
    jason-klein = "member"
  }

  team_id  = github_team.hack4good.id
  username = each.key
  role     = each.value
}
