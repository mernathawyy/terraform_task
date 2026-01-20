resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}
