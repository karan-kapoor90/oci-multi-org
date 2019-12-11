# Manage Compartment resource.
# Name format: ProjectXXX'
# where XXX is the number of Compartments incremented by 1,
# total is specified by the variable count ${var.count}.
resource "oci_identity_compartment" "compartments" {
  count       = "${var.user_count}"
  name        = "${format("Project%03d", count.index + 1)}"
  description = "Compartment for user ${format("User%03d", count.index + 1)}"
}