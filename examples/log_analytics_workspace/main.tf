// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


module "log_analytics_workspace" {
  source = "../.."

  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  identity            = var.identity


  depends_on = [module.resource_group]
}

module "resource_group" {
  source = "git::https://github.com/nexient-llc/tf-azurerm-module_primitive-resource_group.git?ref=0.2.0"

  name     = local.resource_group
  location = var.location
  tags = {
    resource_name = local.resource_group
  }
}

module "resource_names" {
  source = "git::https://github.com/nexient-llc/tf-module-resource_name.git?ref=1.1.0"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
}
