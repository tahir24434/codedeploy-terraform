# Creates a CodeDeploy application to be used as a basis for deployments
resource "aws_codedeploy_app" "main" {
  name = "trauf_cd_app"
}

# Creates a CodeDeploy Deployment Group for a CodeDeploy Application
resource "aws_codedeploy_deployment_group" "main" {
  app_name              = "${aws_codedeploy_app.main.name}"
  deployment_group_name = "${var.deployment_group_name}"
  service_role_arn      = "${aws_iam_role.codedeploy_svc.arn}"
  deployment_config_name = "${aws_codedeploy_deployment_config.main.id}"

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "CodeDeployDemo"
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  deployment_style {
    deployment_type = "IN_PLACE"
  }
}

# Provides a CodeDeploy deployment config for an application
resource "aws_codedeploy_deployment_config" "main" {
  deployment_config_name = "trauf_cd_deployment_config"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 1
  }
}