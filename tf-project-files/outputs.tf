# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}

# Output the subnet ID
output "subnet_id" {
  value = aws_subnet.subnet.id
}

# Output the endpoint of the RDS instance
output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

# Output the ID of the EC2 instance
output "web_instance_id" {
  value = aws_instance.web.id
}
