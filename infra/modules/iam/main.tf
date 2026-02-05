#EKS Role 

resource "aws_iam_role" "eks_cluster_role" {
    name = var.eks_cluster_role_name

    assume_role_policy = jsonencode({
         Version = var.eks_cluster_role_assume_role_policy_version  
     Statement = [
        {
             Effect = var.eks_cluster_role_assume_role_policy_effect
             Principal = {
                 Service = var.eks_cluster_role_assume_role_policy_service
            },
             Action = var.eks_cluster_role_assume_role_policy_action
        }
    ]
  
  })

    tags = {
        Name = aws_iam_role.eks_cluster_role.name
    }
  
}

#EKS Cluster Role Policy Attachment 

resource "aws_iam_role_policy_attachment" "eks_cluster_role_policy" {
    role = aws_iam_role.eks_cluster_role.name
    policy_arn = var.eks_cluster_role_policy_arn
  
}

#EKS Node Group Role 

resource "aws_iam_role" "eks_node_group_role" {
    name = var.eks_node_group_role_name

    assume_role_policy = jsonencode({
         Version =  var.eks_node_group_role_assume_role_policy_version
     Statement = [
        {
             Effect = var.eks_node_group_role_assume_role_policy_effect
             Principal = {
                 Service = var.eks_node_group_role_assume_role_policy_service
            },
             Action = var.eks_node_group_role_assume_role_policy_action
        }
    ]
  
  })

    tags = {
        Name = aws_iam_role.eks_node_group_role.name
    }
  
}


#EKS Node Group Role Policy Attachment 

resource "aws_iam_role_policy_attachment" "ecr_pull_only_policy" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = var.ecr_pull_only_policy_arn
  
}

resource "aws_iam_role_policy_attachment" "ecr_read_only_policy" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = var.ecr_read_only_policy_arn
  
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = var.cni_policy_arn
  
}

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = var.worker_node_policy_arn
  
}