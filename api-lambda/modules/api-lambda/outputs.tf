output "iamrole_arn" {
  value = "${aws_iam_role.lambda_exec.arn}"
}

output "iamrole_id" {
  value = "${aws_iam_role.lambda_exec.id}"
}

output "iamrole_name" {
  value = "${aws_iam_role.lambda_exec.name}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.lambda-mod.arn}"
}

output "lambda_name" {
  value = "${aws_lambda_function.lambda-mod.function_name}"
}

output "lambda_invokearn" {
  value = "${aws_lambda_function.lambda-mod.invoke_arn}"
}

output "apigw_id" {
  value = "${aws_api_gateway_rest_api.apigw-mod.id}"
}

output "apigw_rootresourceid" {
  value = "${aws_api_gateway_rest_api.apigw-mod.root_resource_id}"
}

output "apigw_createddate" {
  value = "${aws_api_gateway_rest_api.apigw-mod.created_date}"
}

output "apigw_resource_id" {
  value = "${aws_api_gateway_resource.apigw-resource.id}"
}

output "apigw_resource_path" {
  value = "${aws_api_gateway_resource.apigw-resource.path}"
}

output "apigw_method_id" {
  value = "${aws_api_gateway_method.apigw-method.id}"
}

output "apigw_executionarn" {
  value = "${aws_api_gateway_deployment.apigw-deploy.execution_arn}"
}
