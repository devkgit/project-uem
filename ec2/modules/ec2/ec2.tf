/*data template_file "user-data" {
  template = "${file("${path.module}/../user-data/${var.user_data}.sh")}"
}*/

resource "aws_instance" "uem" {
  count = "${var.instance_count}"

  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  //user_data = "${data.template_file.user-data.rendered}"
  //user_data = "${file("${path.module}/../user-data/${var.user_data}.sh")}"
  user_data   ="${var.user_data}"
  subnet_id = "${var.subnet_id}"
  key_name  = "${var.key_name}"
  security_groups = ["${var.security_groups}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  ebs_optimized = "${var.ebs_optimized}"
  //region        = "${var.region}"


  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  ebs_block_device {
    device_name           = "${var.device_name}"
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }

    tags {
    Name = "${lookup(var.common, "org")}-${lookup(var.common, "busseg")}${lookup(var.common, "sdlcenv")}-${lookup(var.common, "product")}"
  }


}
