module "userdata_uem" {
  source = "../modules/user-data"
  
}


module "ec2-test" {
  source = "../modules/ec2"

  common        = "${var.common}"
  region        = "${var.region}"
  volume_size   = "${var.volume_size}"
  ami           = "${data.aws_ami.linux_ami.id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  user_data     = "${module.userdata_uem.userdata}"

  volume_type           = "${var.volume_type}"
  volume_size           = "${var.volume_size}"
  delete_on_termination = "${var.delete_on_termination}"

  device_name           = "${var.device_name}"
  volume_type           = "${var.volume_type}"
  volume_size           = "${var.volume_size_ebs}"
  delete_on_termination = "${var.delete_on_termination}"

  subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_groups}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  ebs_optimized               = "${var.ebs_optimized}"
}
