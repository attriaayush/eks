module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    cluster_name    = local.cluster_name
    cluster_version = "1.18"
    subnets         = module.vpc.private_subnets

    tags = {
        Environment = var.environment
        GithubRepo  = "eks"
        GithubOrg   = "attriaayush"
    }

    vpc_id          = module.vpc.vpc_id

    // node pool
    worker_groups = [
        {
            name                            = "worker-group-one"
            instance_type                   = "t2.small"
            additional_userdata             = "worker group one"
            # auto scale desired capacity
            asg_desired_capacity            = 2
            additional_security_group_ids   = [aws_security_group.worker-group-one.id]
        },
        {
            name                            = "worker-group-two"
            instance_type                   = "t2.medium"
            additional_userdata             = "worker group two"
            # auto scale desired capacity
            asg_desired_capacity            = 1
            additional_security_group_ids   = [aws_security_group.worker-group-two.id]
        }
    ]

}

data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}