# Manage Membership.
# Add user to group and compartment
resource "oci_identity_user_group_membership" "group_membership" {
  depends_on = ["oci_identity_compartment.compartments", "oci_identity_user.users", "oci_identity_group.groups"]
  count      = "${var.user_count}"
  compartment_id = "${element(oci_identity_compartment.compartments.*.id, count.index + 1)}"
  user_id        = "${element(oci_identity_user.users.*.id, count.index + 1)}"
  group_id       = "${element(oci_identity_group.groups.*.id, count.index + 1)}"
}