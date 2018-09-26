variable "region" {}

variable "ami" {}

variable "user_data" {}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "subnet_id" {}

variable "key_name" {}

variable "security_groups" {
  type = "list"
}

variable "associate_public_ip_address" {}

variable "ebs_optimized" {}

variable "instance_type" {}

variable "volume_size" {}

variable "common" {
  type = "map"
}

variable "volume_type" {}

//variable "volume_size" {}

variable "delete_on_termination" {}

variable "device_name" {}
