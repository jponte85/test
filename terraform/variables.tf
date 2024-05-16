variable "environment" {
  type        = string
  description = "Type of environment mapping to Vodafone Environment Classifications"
  default     = "DEV"

  validation {
    condition     = var.environment == "DEV" ? true : false
    error_message = "'environment' must be: DEV"
  }
}

variable "project" {
  type        = string
  description = "Name of the project associated with the Project tag on AWS resources"
  default     = "pcs-test-terraform-task"

  validation {
    condition     = var.project == "pcs-test-terraform-task" ? true : false
    error_message = "'project' must be: pcs-test-terraform-task"
  }
}

# Please set variable region as per your needs.
variable "region" {
  type        = string
  description = "Region for the resource deployment"
  default     = "eu-west-1"
}

# Please set variable region as per your needs.

# variables.tf
variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "ec2_subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  default     = "aws_subnet.public_subnet_1.id"
}

variable "ec2_vpc_security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  default     = "aws_security_group.sg_allow_http1.id"
}

variable "ec2_user_data" {
  description = "User data script for the EC2 instance"
  default     = ""
}


/*variable "private_subnet" {
  type    = "list"
  default = []
}*/

#private_subnet = ["10.0.0.128/26", "10.0.0.192/24"]