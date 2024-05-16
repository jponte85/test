resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "joel-vpc-${var.project}-${var.environment}" #! Replace first name with your first name e.g. "kieran-vpc-${var.project}-${var.environment}"
  }
}
