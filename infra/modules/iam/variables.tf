#EKS Cluster Role 

variable "eks_cluster_role_name" {
    type = string 
    default = "eks-cluster-role"
  
}

variable "eks_cluster_role_assume_role_policy_version" {
    type = string 
    default = "2012-10-17"
  
}

variable "eks_cluster_role_assume_role_policy_effect" {
    type = string 
    default = "Allow"
  
}

variable "eks_cluster_role_assume_role_policy_service" {
    type = string 
    default = "eks.amazonaws.com"
  
}

variable "eks_cluster_role_assume_role_policy_action" {
    type = string 
    default = "sts:AssumeRole"
  
}

#EKS Cluster Policy Attatchment 

variable "eks_cluster_role_policy_arn" {
    type = string 
    default =  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  
}

#EKS Node Group Role 

variable "eks_node_group_role_name" {
    type = string 
    default = "eks-node-group-role"
  
}

variable "eks_node_group_role_assume_role_policy_version" {
    type = string 
    default = "2012-10-17"
  
}

variable "eks_node_group_role_assume_role_policy_effect" {
    type = string 
    default = "Allow"
  
}

variable "eks_node_group_role_assume_role_policy_service" {
    type = string 
    default = "ec2.amazonaws.com"
  
}

variable "eks_node_group_role_assume_role_policy_action" {
    type = string 
    default = "sts:AssumeRole"
  
}

#EKS Node Group Policy Attatchment 

variable "ecr_pull_only_policy_arn" {
    type = string 
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
  
}

variable "ecr_read_only_policy_arn" {
    type = string 
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  
}

variable "cni_policy_arn" {
    type = string 
    default = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  
}

variable "worker_node_policy_arn" {
    type = string 
    default = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  
}




