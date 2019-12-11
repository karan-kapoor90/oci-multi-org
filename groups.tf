# Manage Group resource.
# Name: 'ProjectXXX'
# where XXX is the number of groups incremented by 1,
# total is specified by the variable count ${var.count}.
resource "oci_identity_group" "groups" {
  count = "${var.user_count}"
  name        = "${format("Project%03d", count.index + 1)}"
  description = "Group - ${format("Project%03d", count.index + 1)} "
}