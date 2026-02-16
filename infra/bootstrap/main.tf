#ECR 

resource "aws_ecr_repository" "eks" {
  name                 = var.ecr_name
  image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }
}

resource "aws_s3_bucket" "eks" {
  bucket = "mazin-eks-s3-bucket"

  tags = {
    Name        = "eks-bucket"
    
  }
}