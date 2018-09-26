
data "template_file" "userdata_uem" {
  template = "${file("${path.module}/userdata.sh")}"

  }

