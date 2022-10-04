resource "aws_key_pair" "my_key" {
  key_name   = "sshkey"
  public_key = file(var.pub_key)
}
resource "aws_instance" "first_instance" {
  ami                    = var.ami[var.region]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.all_sec_group.id]
  instance_type          = "t2.micro"

  connection {
    user        = "ec2-user"
    private_key = file("mykey")
    host        = self.public_ip
  }

  user_data = <<EOF
  #! /bin/bash
  sudo apt update
  sudo apt install awscli
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x ./kubectl
  sudo mv kubectl /usr/local/bin
  EOF

}

resource "aws_s3_bucket" "s3_bucket"{

}