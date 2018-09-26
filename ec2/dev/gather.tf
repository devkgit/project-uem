data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "tag:Name"
    values = ["jenkins"]
  }

}
