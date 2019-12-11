# specify input variables
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
#On this particular sample code, we are expecting a 1:1 mapping between Users x Groups x Compartments.
# For every User, we will create a Group and a Compartment.
# You need to modify the template files to accommodate a different mapping/relationship.
variable "user_count" {
  default = 1
}