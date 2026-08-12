resource "github_team" "platform_admins" {
  name                 = "Platform Admins"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "admins" {
  name                 = "Admins"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "lifestrengths" {
  name                 = "LifeStrengths"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "treasurer" {
  name                 = "Treasurer"
  description          = ""
  privacy              = "closed"
  notification_setting = "notifications_enabled"
}

resource "github_team" "website_volunteers" {
  name                 = "Website Volunteers"
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

resource "github_team_membership" "admins" {
  team_id  = github_team.admins.id
  username = "mykebates"
  role     = "maintainer"
}

resource "github_team_membership" "lifestrengths" {
  for_each = {
    glitchedmob = "maintainer"
    pureux      = "member"
  }

  team_id  = github_team.lifestrengths.id
  username = each.key
  role     = each.value
}

resource "github_team_membership" "treasurer" {
  for_each = {
    glitchedmob = "maintainer"
    Motter360   = "member"
  }

  team_id  = github_team.treasurer.id
  username = each.key
  role     = each.value
}

resource "github_team_membership" "website_volunteers" {
  for_each = {
    glitchedmob = "maintainer"
    KalonOhm    = "member"
    KCSBach     = "member"
    Motter360   = "member"
    shaversj    = "member"
    Techhead404 = "member"
  }

  team_id  = github_team.website_volunteers.id
  username = each.key
  role     = each.value
}
