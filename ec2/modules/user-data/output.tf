output "userdata" {
  value = "${data.template_file.userdata_uem.rendered}"
}