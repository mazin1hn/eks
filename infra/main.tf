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



module "eks" {
    source = "./modules/eks"
  
private_subnet_ids = module.vpc.private_subnet_ids
vpc_id = module.vpc.vpc_id




}
  
module "oidc" {
    source = "./modules/oidc"

    cluster_oidc_issuer = module.eks.cluster_oidc_issuer    
}

resource "aws_eks_addon" "ebs_csi_driver" {
    cluster_name = module.eks.cluster_name
    addon_name = "ebs_csi_driver"
    addon_version = "v1.59.0"
    depends_on = [module.eks] 
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "OVERWRITE"
    service_account_role_arn = module.oidc.ebs_csi_role_arn
  
}
 