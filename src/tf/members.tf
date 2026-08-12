locals {
  organization_admins = toset([
    "glitchedmob",
    "jenn8421",
    "Motter360",
    "Ryan-DL",
  ])

  organization_members = toset([
    "fredlawl",
    "jason-klein",
    "sm0862512",
  ])
}

resource "github_membership" "organization" {
  for_each = setunion(local.organization_admins, local.organization_members)

  username = each.key
  role     = contains(local.organization_admins, each.key) ? "admin" : "member"
}
