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

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are PerNode, Standalone, Unlimited, CapacityReservation, and PerGB2018. Defaults to PerGB2018. Premium and Standard do not work as per testing."
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) The workspace data retention in days. Possible values are in the range between 30 and 730."
  default     = 30
  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "retention_in_days should be between 30 to 730."
  }
}

variable "daily_quota_gb" {
  type        = number
  description = "(Optional) The daily quota in GB for ingestion. Defaults to -1 for unlimited."
  default     = -1
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  description = <<EOF
  (Optional) A identity block as defined below.
  - type Specifies the identity type of the Log Analytics Workspace. Possible values are SystemAssigned (where Azure will generate a Service Principal for you) and UserAssigned where you can specify the Service Principal IDs in the identity_ids field.
  - identity_ids Specifies the list of User Assigned Identity IDs to be associated with the Log Analytics Workspace. This field is required when type is UserAssigned.
  EOF
  default     = null
}

variable "local_authentication_disabled" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether local authentication should be disabled. Defaults to false."
  default     = false
}
