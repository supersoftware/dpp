# Configure the Rancher provider
provider "rancher" {
  # ↓this only supports v1 global api
  api_url    = "${var.rancher_url}"
  access_key = "${var.rancher_access_key}"
  secret_key = "${var.rancher_secret_key}"
}

# Create the LB stack
resource "rancher_stack" "lb" {
  name        = "lb"
  description = "Load Balancer Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/lb/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/lb/rancher-compose.yml")}"
  scope           = "user"
}
