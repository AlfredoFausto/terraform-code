variable "region" {
  type    = string
  default = "us-south"
}

variable "ibm_key" {
  type    = string
}

variable "zones_name" {
  type    = list(string)
  default = ["us-south-1", "us-south-2", "us-south-3"]
}

variable "cluster_flavor" {
  default = "bx2.4x16"
}

variable "name_prefix" {
  default = "alfredo"
}

variable "worker_count" {
  default = "1"
}
