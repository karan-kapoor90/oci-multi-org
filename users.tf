# Manage users and create one-time credentials for UI
# Name: UserXXX
# where XXX is the number of groups incremented by 1,
# total is specified by the variable count ${var.count}.
resource "oci_identity_user" "users" {
  count = "${var.user_count}"
  name        = "${format("User%03d", count.index + 1)}"
  description = "User - ${format("User%03d", count.index + 1)}"
}
resource "oci_identity_ui_password" "user_pwd" {
  count   = "${var.user_count}"
  user_id = "${element(oci_identity_user.users.*.id, count.index + 1)}"
}
output "users_temp_credentials" {
  sensitive = false
  value     = "${formatlist("User: %v   Password: %v", oci_identity_user.users.*.name, oci_identity_ui_password.user_pwd.*.password)}"
  #value = "${join(" \n ",oci_identity_ui_password.user_pwd.*.password)}"
}