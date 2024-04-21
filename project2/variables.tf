variable "region" {
  description = "Region"
  type        = string
}

variable "igw_name" {
  description = "IGW name"
  type        = string
}

variable "rt_name" {
  description = "RT name"
  type        = string
}

variable "vpc_data" {
  description = "VPC data"
  type = list(object(
    { name = string, cidr_block = string }
  ))
}

variable "subnet_data" {
  description = "Subnet data"
  type = list(object(
    { name = string, cidr_block = string, az = string }
  ))
}

variable "ec2_data" {
  description = "EC2 data"
  type = list(object(
    { name = string, type = string }
  ))
}


