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

output "id" {
  description = "The Log Analytics Workspace ID."
  value       = module.log_analytics_workspace.id
}

output "workspace_id" {
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
  value       = module.log_analytics_workspace.workspace_id
}

output "workspace_name" {
  description = "The Workspace name for the Log Analytics Workspace."
  value       = local.log_analytics_workspace_name
}

output "resource_group_name" {
  description = "The name of the Resource Group in which the Log Analytics Workspace is created."
  value       = module.resource_group.name
}
