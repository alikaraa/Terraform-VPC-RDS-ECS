resource "aws_security_group" "tf-devops" {
  name        = "tf-devops"
  description = "All Rules"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "80 rules"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [0.0.0.0]
  }
  ingress {
    description      = "mysql"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [0.0.0.0]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}