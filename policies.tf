# Manage policies
# On this particular sample code, we are expecting a one-to-one mapping between Users x Groups x Compartments.
# This is why we have one unique variable `count` for Group, Compartment and Users.
# If you want to have different number of resources depending on the type, you may have to modify the
# statements according to your need.
resource "oci_identity_policy" "policies" {
  depends_on = ["oci_identity_compartment.compartments", "oci_identity_user.users", "oci_identity_group.groups", "oci_identity_user_group_membership.group_membership"]
  count      = "${var.user_count}"
  name           = "${format("PolicyForUser%03d", count.index + 1)}"
  description    = "${format("Policy For User%03d", count.index + 1)}"
  compartment_id = "${var.tenancy_ocid}"
  statements = ["Allow any-user to manage all-resources in compartment ${format("Project%03d", count.index + 1)} where request.user.id='${element(oci_identity_user.users.*.id, count.index)}'",
    "${format("Allow group Project%03d", count.index + 1)} to manage all-resources in compartment ${format("Project%03d", count.index + 1)}",
  ]
}