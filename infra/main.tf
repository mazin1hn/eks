module "vpc" {
  source = "./modules/vpc"

  
  vpc_cidr_block = var.vpc_cidr_block
  private_subnet_a_cidr_block = var.private_subnet_a_cidr_block
  private_subnet_b_cidr_block = var.private_subnet_b_cidr_block
  public_subnet_a_cidr_block  = var.public_subnet_a_cidr_block
  public_subnet_b_cidr_block  = var.public_subnet_b_cidr_block
  az_a = var.az_a
  az_b = var.az_b 

}

module "iam" {
    source = "./modules/iam"
}


module "eks" {
    source = "./modules/eks"
  
private_subnet_ids = module.vpc.private_subnet_ids
vpc_id = module.iam.vpc_id



}
  