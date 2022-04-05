terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.40.0-beta0"
    }
  }
}

provider "ibm" {
  generation       = 2
  ibmcloud_api_key = var.ibm_key
}

data "ibm_resource_group" "am-resource" {
  name = "default"
}

data "ibm_is_vpc" "am-vpc" {
  name = "vpc-test-us-am"
}

data "ibm_is_subnet" "am-subnet1" {
  name = "sn-20220228-06"
}
data "ibm_is_subnet" "am-subnet2" {
  name = "sn-20220228-04"
}
data "ibm_is_subnet" "am-subnet3" {
  name = "sn-20220228-05"
}

module "am_cluster1" {
  source         = "./modules/cluster"
  cluster_name   = "alfredo-dev-us-south"
  resource_group = data.ibm_resource_group.am-resource.id
  vpc            = data.ibm_is_vpc.am-vpc.id
  subnets        = [data.ibm_is_subnet.am-subnet1.id, data.ibm_is_subnet.am-subnet2.id, data.ibm_is_subnet.am-subnet3.id]
  zones_name     = var.zones_name
  cluster_flavor = var.cluster_flavor
  name_prefix    = var.name_prefix
  worker_count   = var.worker_count
}

output "cluster_id" {
  value = module.am_cluster1.cluster_id
}
