data "aws_vpc" "myvpc" {
  tags = {
    Name = "broadridge-main"
  }
}

data "aws_subnet_ids" "sbt-main" {
  vpc_id = "${data.aws_vpc.myvpc.id}"
}

data "aws_security_group" "sg-main" {
  vpc_id = "${data.aws_vpc.myvpc.id}"
  name   = "SelectAccess"
}


