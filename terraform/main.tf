terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0, < 6.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"

  profile = "vf-pc-dev-001"

  default_tags {
    tags = {
      Project          = var.project
      ManagedBy        = "joel.ponte2@vodafone.com" #! <-- update to your VF e-mail
      Confidentiality  = "C2"
      Environment      = var.environment
      TaggingVersion   = "V2.4"
      SecondaryContact = "kieran.lowe@vodafone.com"
      SecurityZone     = "A"
    }
  }
}

module "my_webserver_jjp23" {
  source             = "./ec2"                # Path to your module
  
  instance_type      = var.ec2_instance_type      # Replace with your desired instance type
  subnet_id          = aws_subnet.public_subnet_1.id         # Replace with your subnet ID
  security_group_ids = aws_security_group.sg_allow_http1.ids # Replace with your security group IDs
  user_data          = "${file("user-data-apache.sh")}"
}

#module "my_webserver2" {
#  source             = "./ec2"                              # Path to your module
#  instance_type      = "t2.micro"                           # Replace with your desired instance type
#  subnet_id          = aws_subnet.public_subnet_1.id        # Replace with your subnet ID
#  security_group_ids = aws_security_group.sg_allow_http1.id # Replace with your security group IDs
#  user_data          = ${file("user-data-apache.sh")}
#}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "lb-target-group"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.vpc.id

  health_check {
    path = "/"
  }

  targets = [
    module.my_webserver1.instance_id
  ]
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}


resource "aws_lb" "my_lb" {
  name               = "my_lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_lb.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}
