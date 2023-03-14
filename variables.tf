variable "profile" {
  default = "terraform"
}

variable "region_master" {
  default = "us-east-1"
}

variable "region_worker" {
  default = "us-west-2"
}

variable "external_ip" {
  default = "0.0.0.0/0"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "worker_count" {
  default = 2
}