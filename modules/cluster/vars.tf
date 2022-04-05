variable "cluster_name" {}
variable "resource_group" {}
variable "vpc" {}
variable "subnets" {
  type = list(string)
}
variable "zones_name" {}
variable "cluster_flavor" {}
variable "name_prefix" {}
variable "worker_count" {}
