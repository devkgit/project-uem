/* IAM role which dictates what other AWS services the Lambda function
 may access. */

resource "aws_iam_role" "lambda_exec" {
  name = "${var.role_lambda_api}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
   ]
}
EOF
}

resource "aws_iam_role_policy" "policy" {
  name = "lambda_role_policy"
  role = "${aws_iam_role.lambda_exec.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "ec2:CreateNetworkInterface",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DeleteNetworkInterface"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
