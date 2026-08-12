resource "github_membership" "organization" {
  for_each = {
    fredlawl      = "admin"
    glitchedmob   = "admin"
    jason-klein   = "admin"
    Joey-Powers13 = "member"
    KalonOhm      = "member"
    KCSBach       = "member"
    Motter360     = "member"
    mykebates     = "admin"
    pureux        = "member"
    Ryan-DL       = "member"
    shaversj      = "member"
    sm0862512     = "member"
    Techhead404   = "member"
    trankin       = "admin"
  }

  username = each.key
  role     = each.value
}
