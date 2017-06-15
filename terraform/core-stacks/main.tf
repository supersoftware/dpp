# Configure the Rancher provider
provider "rancher" {
  # ↓this only supports v1 global api
  api_url    = "${var.rancher_url}"
  access_key = "${var.rancher_access_key}"
  secret_key = "${var.rancher_secret_key}"
}

# Create the Akka stack
resource "rancher_stack" "web" {
  name        = "web"
  description = "Akka API and WebUI Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/web/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/web/rancher-compose.yml")}"
  scope           = "user"
}

# Create the Cassandra stack
resource "rancher_stack" "cassandra" {
  name        = "cassandra"
  description = "Cassandra Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/cassandra/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/cassandra/rancher-compose.yml")}"
  scope           = "user"
  start_on_create = true
}

# Create the JMeter stack
resource "rancher_stack" "jmeter" {
  name        = "jmeter"
  description = "JMeter Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/jmeter/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/jmeter/rancher-compose.yml")}"
  scope           = "user"
}

# Create the Kafka stack
resource "rancher_stack" "kafka" {
  name        = "kafka"
  description = "Kafka Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/kafka/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/kafka/rancher-compose.yml")}"
  scope           = "user"
}

# Create the minio stack
resource "rancher_stack" "minio" {
  name        = "minio"
  description = "Minio Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/minio/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/minio/rancher-compose.yml")}"
  scope           = "user"
}

# Create the OpenVPN Rancher Local stack
resource "rancher_stack" "openvpnrancherlocal" {
  name        = "openvpn-rancherlocal"
  description = "OpenVPN Rancher Local Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/openvpn-rancherlocal/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/openvpn-rancherlocal/rancher-compose.yml")}"
  scope           = "user"
}

# Create the Prometheus stack
resource "rancher_stack" "prometheus" {
  name        = "prometheus"
  description = "Prometheus Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/prometheus/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/prometheus/rancher-compose.yml")}"
  scope           = "user"
}

# Create the Apache Spark stack
resource "rancher_stack" "spark" {
  name        = "spark"
  description = "Apache Spark Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/spark/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/spark/rancher-compose.yml")}"
  scope           = "user"
}

# Create the Apache ZooKeeper stack
resource "rancher_stack" "zookeeper" {
  name        = "zookeeper"
  description = "Apache ZooKeeper Stack"

  environment_id  = "${var.rancher_environment_id}"
  docker_compose  = "${file("${var.repository_root_path}/zookeeper/docker-compose.yml")}"
  rancher_compose = "${file("${var.repository_root_path}/zookeeper/rancher-compose.yml")}"
  scope           = "user"
}
