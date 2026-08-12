resource "github_membership" "organization" {
  for_each = {
    fredlawl    = "member"
    glitchedmob = "admin"
    jason-klein = "member"
    jenn8421    = "admin"
    Motter360   = "admin"
    Ryan-DL     = "admin"
    sm0862512   = "member"
  }

  username = each.key
  role     = each.value
}
