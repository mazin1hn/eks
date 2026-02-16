terraform {
  backend "s3" {
    bucket       = "mazin-s3-ecs-bucket"
    key          = "infra/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
    encrypt      = true
  }
}