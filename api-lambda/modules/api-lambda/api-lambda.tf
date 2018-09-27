resource "aws_lambda_function" "lambda-mod" {
  function_name = "${var.function_name}"

  # The bucket name where we will be uploading the code to"
  s3_bucket = "${var.s3_bucket}"
  s3_key    = "${var.s3_key}"

  /* "index" is the filename within the zip file (main.js) and "handler" is the name of the property under which the handler function was exported in that file. */
  handler = "${var.handler}"

  runtime = "${var.runtime}"

  role = "${aws_iam_role.lambda_exec.arn}"

  vpc_config {
    security_group_ids = ["${(data.aws_security_group.sg-main.id)}"]

    subnet_ids = ["${(data.aws_subnet_ids.sbt-main.ids)}"]
  }

  environment {
    variables {
      test = "whats_up"
    }
  }
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda-mod.arn}"
  principal     = "apigateway.amazonaws.com"

  # The  portion grants access from any method on any resource
  # within the API Gateway "REST API".
  #source_arn = "arn:aws:execute-api:us-east-1:022234657220:tshd1a7emf/test"
  source_arn = "${aws_api_gateway_deployment.apigw-deploy.execution_arn}"
  //source_arn = ""
}


resource "aws_api_gateway_rest_api" "apigw-mod" {
  name        = "${lookup(var.common, "sdlcenv")}-${lookup(var.common, "product")}-${var.function}-${lookup(var.common, "company")}.net"
  
}

resource "aws_api_gateway_resource" "apigw-resource" {
  rest_api_id = "${aws_api_gateway_rest_api.apigw-mod.id}"
  parent_id = "${aws_api_gateway_rest_api.apigw-mod.root_resource_id}"
  path_part = "messages"
}

resource "aws_api_gateway_method" "apigw-method" {
  rest_api_id = "${aws_api_gateway_rest_api.apigw-mod.id}"
  resource_id = "${aws_api_gateway_resource.apigw-resource.id}"
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "apigw-method-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.apigw-mod.id}"
  resource_id = "${aws_api_gateway_resource.apigw-resource.id}"
  http_method = "${aws_api_gateway_method.apigw-method.http_method}"
  type = "AWS_PROXY"
  #uri = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:022234657220:function:lambda_api_code/invocations"
  uri = "${aws_lambda_function.lambda-mod.invoke_arn}"
  #uri = ""
  integration_http_method = "POST"
}

resource "aws_api_gateway_deployment" "apigw-deploy" {
  depends_on = [
    "aws_api_gateway_integration.apigw-method-integration",
    #"aws_api_gateway_integration.lambda_root",
  ]

  rest_api_id = "${aws_api_gateway_rest_api.apigw-mod.id}"
  stage_name  = "test"
}