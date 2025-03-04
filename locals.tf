locals {
  default_tags = {
    provisioner = "terraform"
    resource_name = var.name
  }
  tags = merge(local.default_tags, var.tags)
}
