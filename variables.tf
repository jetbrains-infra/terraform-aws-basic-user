variable "name" {}
variable "roles" {
  type = "list"
}

locals {
  roles = ["${var.roles}"]
  name  = "${var.name}"
}