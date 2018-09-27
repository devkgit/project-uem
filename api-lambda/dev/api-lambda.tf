module "api-lambda-uem" {
  source = "../modules/api-lambda"

  common   = "${var.common}"
  region   = "${var.region}"
  function = "${var.function}"
  
  common = "${var.common}"
  region = "${var.region}"

  //s3_bucket          = "${module.s3.s3bucket_id}"
  s3_bucket          = "${var.s3_bucket}"
  runtime            = "${var.runtime}"
  function_name      = "${var.function_name}"
  handler            = "${var.handler}"
  s3_key             = "${var.s3_key}"
  security_group_ids = ["${(data.aws_security_group.sg-main.id)}"]
  subnet_ids         = ["${data.aws_subnet_ids.sbt-main.ids}"]
  role_lambda_api    = "${var.role_lambda_api}"

}
