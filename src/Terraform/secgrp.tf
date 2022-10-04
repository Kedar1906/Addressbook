resource "aws_security_group" "all_sec_group" {
  name   = "all_sec_grp"
  vpc_id = var.vpc

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    protocol    = "TCP"
    to_port     = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }


}