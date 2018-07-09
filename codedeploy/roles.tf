resource "aws_iam_role" "codedeploy_svc" {
  name = "trauf_cd-service-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "codedeploy.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# attach AWS managed policy called AWSCodeDeployRole
# required for deployments which are to an EC2 compute platform
resource "aws_iam_role_policy_attachment" "codedeploy_service" {
  role       = "${aws_iam_role.codedeploy_svc.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

#################
# Create an IAM Instance Profile for Your Amazon EC2 Instances
# https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html
#################
resource "aws_iam_role" "instance_role" {
  name = "trauf_cd_EC2-Instance-Profile"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "instance_role_policy" {
  name = "trauf_cd_EC2-Permissions"
  role = "${aws_iam_role.instance_role.id}"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "main" {
  name = "trauf_cd_EC2-Instance-Profile"
  role = "${aws_iam_role.instance_role.name}"
}
