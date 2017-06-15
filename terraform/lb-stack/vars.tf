variable "repository_root_path" {
  description = "Root Path of this repository"
  default     = "../.."
}

variable "rancher_url" {
  description = "Rancher URL. It can also be sourced from the RANCHER_URL environment variable."
}

variable "rancher_access_key" {
  description = "Rancher API access key. It can also be sourced from the RANCHER_ACCESS_KEY environment variable."
}

variable "rancher_secret_key" {
  description = "Rancher API access key. It can also be sourced from the RANCHER_SECRET_KEY environment variable."
}

variable "rancher_environment_id" {
  description = "The Rancher Environment ID to deploy to."
}
