## DEFAULT SG
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "DO-NOT-USE-DEFAULT-SG"
  }
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ## Workaround, otherwise triggered an update-in-place at every TF run
  lifecycle {
    ignore_changes = [
      subnet_ids
    ]
  }

  tags = {
    Name = "DO-NOT-USE-DEFAULT-NACL"
  }
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name = "DO-NOT-USE-DEFAULT-RTB"
  }
}