#################################
#    ROUTING
#################################
# Create Route Tables

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "joel-PrivateRouteTable-${var.project}-${var.environment}"
  }
}

# Associate Subnets with Route Tables
resource "aws_route_table_association" "private_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

####################################
## SUBNETS
####################################
# Create Private Subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.128/26"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "joel-pvt_subnet1-${var.project}-${var.environment}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.192/26"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "joel-pvt_subnet2-${var.project}-${var.environment}"
  }
}


/*resource "aws_subnet" "private" {
  count                   = "${length(var.private_subnet)}"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.private_subnet[count.index]}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
}*/

####################################
#### SECURITY GROUP
####################################

# Security Group for EC2 instance
resource "aws_security_group" "sg_lb" {
  vpc_id = aws_vpc.vpc.id
  name   = "Joel-ssm-${var.project}-${var.environment}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
  tags = {
    Name = "joel-lb-${var.project}-${var.environment}"
  }
}

resource "aws_security_group" "sg_allow_http1" {
  vpc_id = aws_vpc.vpc.id
  name   = "Joel-sg_AllowHTTPs1-${var.project}-${var.environment}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "joel-Allow_HTTP_and_HTTPS-${var.project}-${var.environment}"
  }
}

resource "aws_security_group" "sg_allow_http2" {
  vpc_id = aws_vpc.vpc.id
  name   = "Joel-sg_AllowHTTPs2-${var.project}-${var.environment}"

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Joel_Allow_HTTP_and_HTTPS"
  }
}
