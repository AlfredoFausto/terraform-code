terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.40.0-beta0"
    }
  }
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = var.cluster_name
  vpc_id            = var.vpc
  flavor            = var.cluster_flavor
  worker_count      = 1
  resource_group_id = var.resource_group
  wait_till         = "MasterNodeReady"
  zones {
    subnet_id = var.subnets[0]
    name      = var.zones_name[0]
  }
}

resource "ibm_container_vpc_worker_pool" "cluster_pool1" {
  cluster           = ibm_container_vpc_cluster.cluster.id
  worker_pool_name  = "${var.cluster_name}-worker1"
  flavor            = var.cluster_flavor
  vpc_id            = var.vpc
  worker_count      = var.worker_count
  resource_group_id = var.resource_group
  zones {
    name      = var.zones_name[0]
    subnet_id = var.subnets[0]
  }
}

resource "ibm_container_vpc_worker_pool" "cluster_pool2" {
  cluster           = ibm_container_vpc_cluster.cluster.id
  worker_pool_name  = "${var.cluster_name}-worker2"
  flavor            = var.cluster_flavor
  vpc_id            = var.vpc
  worker_count      = var.worker_count
  resource_group_id = var.resource_group
  zones {
    name      = var.zones_name[1]
    subnet_id = var.subnets[1]
  }
}

resource "ibm_container_vpc_worker_pool" "cluster_pool3" {
  cluster           = ibm_container_vpc_cluster.cluster.id
  worker_pool_name  = "${var.cluster_name}-worker3"
  flavor            = var.cluster_flavor
  vpc_id            = var.vpc
  worker_count      = var.worker_count
  resource_group_id = var.resource_group
  zones {
    name      = var.zones_name[2]
    subnet_id = var.subnets[2]
  }
}

output "cluster_id" {
  value = ibm_container_vpc_cluster.cluster.id
}
