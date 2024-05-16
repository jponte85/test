# outputs.tf

output "instance_id" {
  value = aws_instance.my_webserver.id
}

output "load_balancer_address" {
  value = aws_lb.my_lb.dns_name
}