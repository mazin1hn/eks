CREATE NEW APPLY PIPELINE 

UPDATE API TOKEN 

Terraform fixes :

Notes : Things I changed in the console :

Make sure eks endpoint is private and public + add 0.0.0.0/0 to cidrs that can access the public endpoint (its meant to be my IP but we will sort that). (done for now)

Create access entry for my user to and assign eks cluster admin policy for permissions to access eks clusters through the kubernetes api (done)

Then create cluster role binding for the user 

Associate private subnets to private route table (routing the subnets to the NAT Gateway) (done i think we have to check)


need to do this in terraform ^^

ARGOCD : 

replaced apply with create so we dont reach annotation limit (done)

INcrease the max pods to host other applications (done)

Increase the max nodes (done)

tag public subnets so elb can be assigned (done)

make sure ALL subnets are known to eks in the vpc_config (done) 

make sure my public subnets are assigned to the right route table (done i think we have to check)
##### ebs csi resource 


#resource "aws_eks_addon" "ebs_csi_driver" {
    #cluster_name = module.eks.cluster_name
    #addon_name = "ebs_csi_driver"
    #addon_version = "v1.59.0-eksbuild.1"
    #depends_on = [module.eks] 
    #resolve_conflicts_on_create = "OVERWRITE"
    #resolve_conflicts_on_update = "OVERWRITE"
    #service_account_role_arn = module.oidc.ebs_csi_role_arn
  
#}



############