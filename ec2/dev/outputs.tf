output "latest_ami_name" {
  value = "${data.aws_ami.linux_ami.name}"
}

output "latest_ami_id" {
  value = "${data.aws_ami.linux_ami.id}"
}


/*output "ip" {
  value = "${aws_instance.uem.*.public_ip}"
}

output "privip" {
  value = "${aws_instance.uem.*.private_ip}"
}

output "subid" {
  value = "${aws_instance.uem.*.subnet_id}"
}*/