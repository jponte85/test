# Create VPC Flow Logs
resource "aws_flow_log" "vpc_flow_logs" {
  depends_on      = [aws_vpc.vpc]
  iam_role_arn    = aws_iam_role.flow_logs.arn
  log_destination = aws_cloudwatch_log_group.flow_logs.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
  tags = {
    Name = "joel-vpc_flow_logs-${var.project}-${var.environment}"
  }
}

# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "flow_logs" {
  name = "joel-vpc_flow_logs-${var.project}-${var.environment}"
}

# Create IAM Role and Policy for Flow Logs
resource "aws_iam_role" "flow_logs" {
  name = "joel-vpc_flow_logs_role-${var.project}-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "flow_logs_policy" {
  name        = "joel-vpc_flow_logs_policy-${var.project}-${var.environment}"
  description = "Policy for VPC Flow Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ],
        Resource = aws_cloudwatch_log_group.flow_logs.arn
      },
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogStream",
        Resource = "${aws_cloudwatch_log_group.flow_logs.arn}:*"
      },
      {
        Effect   = "Allow",
        Action   = "logs:PutLogEvents",
        Resource = "${aws_cloudwatch_log_group.flow_logs.arn}:*:*"
      }
    ]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "flow_logs_attachment" {
  policy_arn = aws_iam_policy.flow_logs_policy.arn
  role       = aws_iam_role.flow_logs.name
}
