variable "region" {}

variable "common" {
  type = "map"
}

##############
# api-gateway
##############



variable "function" {
  
}

variable "s3_bucket" {}

variable "s3_key" {}

variable "runtime" {}

/*variable "sbt-main" {
  description = "A list of subnet IDs to launch resources in"
  type        = "list"
}*/

variable "subnet_ids" {
  type = "list"
}

variable "security_group_ids" {
  type = "list"
  
}

variable "function_name" {
  
}

variable "handler" {
  
}

#############
# IAM Role
#############

variable "role_lambda_api" {
  
}
