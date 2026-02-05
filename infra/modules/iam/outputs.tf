output "eks_cluster_role_arn" {
    description = "ARN of the EKS Cluster Role"
    value = aws_iam_role.eks_cluster_role.arn
  
}

output "eks_node_group_role_arn" {
    description = "ARN of the EKS Node Group Role"
    value = aws_iam_role.eks_node_group_role.arn 
  
}